# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n
  = {
    Always
      | doc m%"
        A contract that always succeeds. The same as `Dyn`, but with a more JSON-schema name.
        
        # Examples
        
        ```nickel multiline
        "foo" | Always
        
        3 | Always
        ```
      "% = Dyn,
    Const
      | Dyn -> Dyn
      | doc m%"
        A more eager version of `std.contract.Equal`.
        
        # Examples
        
        ```nickel multiline
        5 | Const 5
        
        3 | Const 5
        # => error
        ```
      "%
      = fun
          expected
          =>
          std.contract.from_validator
            (fun
              value
              =>
              if value == expected then
                'Ok
              else
                'Error { message = "expected %{std.to_string expected}" }),
    Enum
      | Array Dyn -> Dyn
      | doc m%"
        `Enum values x` succeeds if and only if `x` is equal to one of the elements of `values`.
        
        # Examples
        
        ```nickel multiline
        "no" | Enum [false, "false", "no", "off"]
        
        "yes" | Enum [false, "false", "no", "off"]
        # => error
        ```
      "%
      = fun
          variants
          =>
          std.contract.from_validator
            (fun
              value
              =>
              let check_equal
                = fun
                  input
                  variant
                  =>
                  (input == variant)
                  || ((std.is_enum input)
                  && (((std.string.from_enum input) == variant)
                  | Bool))
                in
              if std.array.any (check_equal value) variants then
                  'Ok
                else
                  'Error
                    {
                      message =
                        "expected one of %{std.serialize 'Json variants}"
                    }),
    IfThenElse
      | Dyn -> Dyn -> Dyn -> Dyn
      | doc m%"
        `IfThenElse iph zen els` checks the `iph` contract (eagerly). If that
        succeeds, it checks the `zen` contract and otherwise checks the `els`
        contract.
        
        Only the eager part of the `iph` contract is used to decide which of the
        other contracts is applied. The lazy part of the `iph` contract will be
        applied if the eager part succeeds.
        
        # Examples
        
        ```nickel multiline
        6 | IfThenElse Number (number.MultipleOf 2) String
        
        "hi" | IfThenElse Number (number.MultipleOf 2) String
        
        true | IfThenElse Number (number.MultipleOf 2) String
        # => error
        
        # The `zen` branch gets the value that was normalized by TagOrString
        "hi" | IfThenElse std.enum.TagOrString (std.contract.Equal 'hi) Number
        ```
      "%
      = fun
          iph
          zen
          els
          =>
          std.contract.custom
            (fun
              label
              value
              =>
              (match {
                'Ok
                v =>
                  std.contract.check zen label v,
                'Error
                _ =>
                  std.contract.check els label value,
              })
                (std.contract.check iph label value)),
    Never
      | doc m%"
        A contract that always fails.
        
        # Examples
        
        ```nickel multiline
        "foo" | Never
        # => error
        
        3 | Never
        # => error
      "% = std.contract.from_predicate (fun _ => false),
    Null
      | doc m%"
        A contract asserting that a value is null.
        
        # Examples
        
        ```nickel multiline
        null | Null
        
        "foo" | Null
        # => error
      "% = std.contract.from_predicate ((fun x0 x1 => x0 == x1) null),
    Nullable
      : Dyn -> Dyn
      | doc m%"
        For a contract `C`, `Nullable C` returns a contract that allows either `C` or a null value.
        
        # Examples
        
        ```nickel multiline
        1 | Nullable Number
        
        null | Nullable Number
        
        "1" | Nullable Number
        # => error
        ```
      "%
      = fun
          Contract
          =>
          std.contract.custom
            (fun
              label
              value
              =>
              if value == null then
                'Ok value
              else
                std.contract.check Contract label value),
    OneOf
      | Array Dyn -> Dyn
      | doc m%"
        Checks that exactly one of a list of contracts succeeds.
        
        # Examples
        
        ```nickel multiline
        "hi" | OneOf [Number, String, Bool]
        
        "hi" | OneOf [Number, String, std.enum.TagOrString]
        # => error: 2 of the contracts passed
        
        "hi" | OneOf [Number, std.enum.TagOrString]
        # => 'hi
        ```
      "%
      = fun
          contracts
          =>
          std.contract.custom
            (fun
              label
              value
              =>
              (match {
                'Count
                n =>
                  'Error
                    {
                      message =
                        "%{std.to_string
                            n} of the contracts passed, expected precisely one to pass"
                    },
                'Ok
                v =>
                  'Ok v,
              })
                (std.array.fold_right
                  (fun
                    ctr
                    acc
                    =>
                    (match {
                      'Ok
                      val =>
                        (match {
                          'Count
                          0 =>
                            'Ok val,
                          'Count
                          n =>
                            'Count (n + 1),
                          'Ok
                          _ =>
                            'Count 2,
                        })
                          acc,
                      'Error
                      e =>
                        acc,
                    })
                      (std.contract.check ctr label value))
                  ('Count 0)
                  contracts)),
    array =
      {
          ArrayOf
            | Dyn -> Dyn
            | doc m%"
              An eager version of `Array`. `value | ArrayOf C` will succeed if `value` is an array and all of
              its elements satisfy the eager part of the contract `C`.
              
              # Examples
              
              ```nickel multiline
              [1, 2, 3] | ArrayOf Number
              # => [1, 2, 3]
              
              [1, 2, 3] | ArrayOf String
              # => error
              
              ["a", "b", "c"] | ArrayOf std.enum.TagOrString
              # => ['a, 'b, 'c]
              ```
            "%
            = fun
                ctr
                =>
                std.contract.custom
                  (fun
                    label
                    value
                    =>
                    if !(std.is_array value) then
                      'Error { message = "expected an array" }
                    else
                      std.array.try_fold_left
                        (fun
                          acc
                          elt
                          =>
                          (match {
                            'Ok
                            v =>
                              'Ok (acc @ [ v ]),
                            'Error
                            e =>
                              'Error e,
                          })
                            (std.contract.check ctr label elt))
                        [  ]
                        value),
          Contains
            | Dyn -> Dyn
            | doc m%"
              A contract checking that an array contains something satisfying another contract.
              
              For example, `Contains Number` is a contract checking that the value is an array
              and that it contains at least one number.
              
              This is an eager contract, and it assumes that the inputs are also eager.
              Any lazy parts of the inputs will be ignored.
              
              # Examples
              
              ```nickel multiline
              ["hi", true, 1] | Contains Bool
              # => ["hi", true, 1]
              
              ["hi", true, 1] | Contains (Array Bool)
              # => error
              
              # Lazy parts of the inner contract are ignored: "hi" does not get transformed
              # to 'hi.
              ["hi", true, 1] | Contains std.enum.TagOrString
              # => ["hi", true, 1]
              ```
            "%
            = fun
                contract
                =>
                std.contract.custom
                  (fun
                    label
                    value
                    =>
                    if !(std.is_array value) then
                      'Error { message = "expected an array" }
                    else
                      let good_elt
                        = fun
                          elt
                          =>
                          (match { 'Ok _ => true, 'Error _ => false, })
                            (std.contract.check contract label elt)
                        in
                      if std.array.any good_elt value then
                          'Ok value
                        else
                          'Error { message = "no elements matched" }),
          Items
            | Array Dyn -> Dyn -> Dyn
            | doc m%"
              A contract checking that the first few elements of an array satisfy
              specific contracts, and the remaining elements satisfy another contract.
              For example, `Items [C1 C2] C3` is a contract checking that the value is
              an array, that its first two elements (if present) satisfy `C1` and `C2`
              respectively, and that any other elements satisfy `C3`.
              
              # Examples
              
              ```nickel multiline
              [1, 2, "foo", "bar"] | Items [Number, Number] String
              
              # The value is allowed to be shorter than the list of contracts.
              [1] | Items [Number, Number] String
              
              [1, "foo", "bar"] | Items [Number, Number] String
              # => error
              
              # Inner contracts are propagated, but note that the overall `Items` contract
              # is eager if and only if all the contracts you pass in are eager.
              [1, { foo = "str"}, "foo", "bar"] | Items [Number, { foo | Number }] String
              # => error
              ```
            "%
            = fun
                elt_contracts
                rest
                =>
                std.contract.custom
                  (fun
                    label
                    value
                    =>
                    if !(std.is_array value) then
                      'Error { message = "expected an array" }
                    else
                      let length_to_check
                        = std.number.min
                          (std.array.length elt_contracts)
                          (std.array.length value)
                        in
                      let { left, right, }
                          = std.array.split_at length_to_check value
                          in
                        (match {
                            'Error
                            e =>
                              'Error e,
                            'Ok
                            left_with_contracts =>
                              std.array.try_fold_left
                                (fun
                                  acc
                                  elt
                                  =>
                                  (match {
                                    'Ok
                                    v =>
                                      'Ok (acc @ [ v ]),
                                    'Error
                                    e =>
                                      'Error e,
                                  })
                                    (std.contract.check rest label elt))
                                left_with_contracts
                                right,
                          })
                            (std.array.try_fold_left
                              (fun
                                acc
                                =>
                                match {
                                  'Ok
                                  v =>
                                    'Ok (acc @ [ v ]),
                                  'Error
                                  e =>
                                    'Error e,
                                })
                              [  ]
                              (std.array.zip_with
                                (fun
                                  contract
                                  elt
                                  =>
                                  std.contract.check contract label elt)
                                elt_contracts
                                left))),
          MaxItems
            : Number -> Dyn
            | doc m%"
              A contract that checks whether an array has at most a certain number of items.
              
              # Examples
              
              ```nickel multiline
              [1, 2, 3] | MaxItems 3
              
              [1, 2, 3] | MaxItems 2
              # => error
            "%
            = fun
                n
                =>
                std.contract.from_predicate
                  (fun
                    arr
                    =>
                    (std.is_array arr)
                    && ((std.array.length (arr | Array Dyn)) <= n)),
          MinItems
            : Number -> Dyn
            | doc m%"
              A contract that checks whether an array has at least a certain number of items.
              
              # Examples
              
              ```nickel multiline
              [1, 2, 3] | MinItems 3
              
              [1, 2, 3] | MinItems 4
              # => error
              ```
            "%
            = fun
                n
                =>
                std.contract.from_predicate
                  (fun
                    arr
                    =>
                    (std.is_array arr)
                    && ((std.array.length (arr | Array Dyn)) >= n)),
          UniqueItems
            | doc m%"
              Checks that the elements of an array are pairwise distinct.
              
              # Examples
              
              ```nickel multiline
              [1, 2, "3"] | UniqueItems
              
              [1, 3, 2, 3] | UniqueItems
              # => error: duplicate found: 3
              ```
            "%
            = let find_duplicate
                : Array Dyn
                -> {
                  has_duplicate : Bool,
                  duplicate : Dyn,
                  seen : { _ : Bool }
                }
                = std.array.fold_right
                  (fun
                    elt
                    acc
                    =>
                    if acc.has_duplicate then
                      acc
                    else
                      let index = std.serialize 'Json elt in
                      if std.record.has_field index acc.seen then
                          {
                            duplicate = elt,
                            has_duplicate = true,
                            seen = acc.seen
                          }
                        else
                          {
                            duplicate = null,
                            has_duplicate = false,
                            seen = std.record.insert index true acc.seen
                          })
                  { duplicate = null, has_duplicate = false, seen = {} }
                in
              std.contract.from_validator
                  (fun
                    x
                    =>
                    if !(std.is_array x) then
                      'Error { message = "expected an array" }
                    else
                      let { has_duplicate, duplicate, .. } = find_duplicate x in
                      if has_duplicate then
                          'Error
                            {
                              message =
                                "duplicate found: %{std.serialize
                                    'Json
                                    duplicate}"
                            }
                        else
                          'Ok)
        },
    number =
      let from_predicate
          | (Number -> Bool) -> String -> Dyn
          = fun
            pred
            msg
            =>
            std.contract.from_validator
              (fun
                value
                =>
                if !(std.is_number value) then
                  'Error { message = "expected a number" }
                else
                  if pred (value | Number) then
                    'Ok
                  else
                    'Error { message = msg })
          in
        {
            ExclusiveMaximum
              | Number -> Dyn
              | doc m%"
                `ExclusiveMaximum n` is a contract checking that a number is at strictly less than `n`.
                
                # Examples
                
                ```nickel multiline
                5 | ExclusiveMaximum 5.1
                
                5 | ExclusiveMaximum 5
                # => error: expected an exclusive maximum of 5
                
                "5" | ExclusiveMaximum 5
                # => error: expected a number
                ```
              "%
              = fun
                  limit
                  =>
                  from_predicate
                    (fun x => x < limit)
                    "expected an exclusive maximum of %{std.string.from_number
                      limit}",
            ExclusiveMinimum
              | Number -> Dyn
              | doc m%"
                `ExclusiveMinimum n` is a contract checking that a number is at strictly more than `n`.
                
                # Examples
                
                ```nickel multiline
                5 | ExclusiveMinimum 4.9
                
                5 | ExclusiveMinimum 5
                # => error: expected an exclusive minimum of 5
                
                "5" | ExclusiveMinimum 5
                # => error: expected a number
                ```
              "%
              = fun
                  limit
                  =>
                  from_predicate
                    (fun x => x > limit)
                    "expected an exclusive minimum of %{std.string.from_number
                      limit}",
            Maximum
              | Number -> Dyn
              | doc m%"
                `Maximum n` is a contract checking that a number is at most `n`.
                
                # Examples
                
                ```nickel multiline
                5 | Maximum 5
                
                5 | Maximum 4
                # => error: expected a maximum of 4
                
                "5" | Maximum 5
                # => error: expected a number
                ```
              "%
              = fun
                  limit
                  =>
                  from_predicate
                    (fun x => x <= limit)
                    "expected a maximum of %{std.string.from_number limit}",
            Minimum
              | Number -> Dyn
              | doc m%"
                `Minimum n` is a contract checking that a number is at least `n`.
                
                # Examples
                
                ```nickel multiline
                5 | Minimum 5
                
                5 | Minimum 6
                # => error: expected a minimum of 6
                
                "5" | Minimum 6
                # => error: expected a number
                ```
              "%
              = fun
                  limit
                  =>
                  from_predicate
                    (fun x => x >= limit)
                    "expected a minimum of %{std.string.from_number limit}",
            MultipleOf
              | Number -> Dyn
              | doc m%"
                `MultipleOf n` is a contract checking whether a value is a multiple of `n`.
                
                # Examples
                
                ```nickel multiline
                4 | MultipleOf 2
                
                "4" | MultipleOf 2
                # => error: expected a number
                
                4 | MultipleOf 3
                # => error: expected a multiple of 3
                
                4 | MultipleOf 0
                # => error: expected a multiple of 0
                ```
              "%
              = fun
                  n
                  =>
                  std.contract.from_validator
                    (fun
                      value
                      =>
                      if !(std.is_number value) then
                        'Error { message = "expected a number" }
                      else
                        if n == 0 then
                          'Error { message = "expected a multiple of 0" }
                        else
                          if std.number.is_integer (value / n) then
                            'Ok
                          else
                            'Error
                              {
                                message =
                                  "expected a multiple of %{std.string.from_number
                                      n}"
                              })
          },
    record =
      let ErrData
          = {
            blame_location | Dyn | optional,
            message | String | optional,
            notes | Array String | optional
          }
          in
        {
            DependentContracts
              | { _ | Dyn } -> Dyn
              | doc m%"
                A contract for asserting that if some fields are present then the entire
                record satisfies a contract.
                
                Specifically, `DependentContracts { foo = C }` is a contract asserting that
                the value is a record, and if the value contains a field named `foo` then
                the entire record satisfies the contract `C`.
                
                `DependentContracts` calls `std.contract.check` for each of the provided
                contracts. In particular, if `C` is fully eager then so is
                `DependentContracts { foo = C }`.
                
                # Examples
                
                ```nickel multiline
                { foo = 1, bar = 2 } | DependentContracts { foo = { bar | Number, .. } }
                
                { foo = 1, bar = 2 } | DependentContracts { foo = { bar | Number } }
                # => error: extra field `foo`
                
                # This one doesn't fail: the inner contract never gets triggered because there's no `baz` field
                { foo = 1, bar = 2 } | DependentContracts { baz = { bar | Number } }
                
                1 | DependentContracts { baz = { bar | Number } }
                # => error: expected a record
                ```
              "%
              = fun
                  deps
                  =>
                  std.contract.custom
                    (fun
                      label
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        std.array.try_fold_left
                          (fun
                            acc
                            { field, value = contract, }
                            =>
                            if std.record.has_field field value then
                              std.contract.check contract label acc
                            else
                              'Ok acc)
                          value
                          (std.record.to_array deps)),
            DependentFields
              | { _ | Array String } -> Dyn
              | doc m%"
                A contract for asserting that if some fields are present, other fields are
                also present.
                
                Specifically, `DependentFields { foo = ["bar", "baz"] }` is a contract
                asserting that if the field `foo` is present then the fields `bar` and
                `baz` are also present. This corresponds to the part of JSON schema's
                [dependencies](https://json-schema.org/draft-07/draft-handrews-json-schema-validation-01#rfc.section.6.5.7)
                keyword in which the values are arrays.
                
                This is an eager contract.
                
                ```nickel multiline
                { foo = 1, bar = 2 } | DependentFields { foo = ["bar"] }
                
                { foo = 1, baz = 2 } | DependentFields { foo = ["bar"] }
                # => error: expected field bar
                
                { baz = 2 } | DependentFields { foo = ["bar"] }
                ```
              "%
              = fun
                  dependencies
                  =>
                  std.contract.from_validator
                    (fun
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        let must_have_fields
                          : Array String
                          -> { _ : Dyn } -> [| 'Ok, 'Error ErrData |]
                          = fun
                            fields
                            x
                            =>
                            std.array.fold_right
                              (fun
                                field
                                acc
                                =>
                                if !(std.record.has_field field x) then
                                  'Error
                                    ({ message = "expected field %{field}" }
                                    | ErrData)
                                else
                                  acc)
                              'Ok
                              fields
                          in
                        std.array.fold_right
                            (fun
                              { field, value = dependent_fields, }
                              acc
                              =>
                              if std.record.has_field field value then
                                (match {
                                  'Ok =>
                                    acc,
                                  'Error
                                  e =>
                                    'Error
                                      (e
                                      & {
                                        notes =
                                          [
                                              "because field %{field} was present"
                                            ]
                                      }),
                                })
                                  (must_have_fields dependent_fields value)
                              else
                                acc)
                            'Ok
                            (std.record.to_array dependencies)),
            MaxProperties
              | Number -> Dyn
              | doc m%"
                A contract that checks whether a record has at most a certain number of properties.
                
                # Examples
                
                ```nickel multiline
                { foo = 1, bar = 2 } | MaxProperties 2
                
                { foo = 1, bar = 2 } | MaxProperties 1
                # => error: expected a record with at most 1 fields
                ```
              "%
              = fun
                  n
                  =>
                  std.contract.from_validator
                    (fun
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        if (std.record.length value) > n then
                          'Error
                            {
                              message =
                                "expected a record with at most %{std.string.from_number
                                    n} fields"
                            }
                        else
                          'Ok),
            MinProperties
              | Number -> Dyn
              | doc m%"
                A contract that checks whether a record has at least a certain number of properties.
                
                # Examples
                
                ```nickel multiline
                { foo = 1, bar = 2 } | MinProperties 2
                
                { foo = 1, bar = 2 } | MinProperties 3
                # => error: expected a record with at least 3 fields
                ```
              "%
              = fun
                  n
                  =>
                  std.contract.from_validator
                    (fun
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        if (std.record.length value) < n then
                          'Error
                            {
                              message =
                                "expected a record with at least %{std.string.from_number
                                    n} fields"
                            }
                        else
                          'Ok),
            PropertyNames
              | Dyn -> Dyn
              | doc m%"
                `PropertyNames C` is a contract asserting that a value is a record and all of
                its field names satisfy the contract `C`.
                
                `PropertyNames C` is an eager contract for any `C`. Any lazy parts of `C` will
                be ignored.
                
                ```nickel multiline
                { foo = 1 } | PropertyNames std.string.NonEmpty
                
                { "1" = 1 } | PropertyNames std.string.NumberLiteral
                
                { foo = 1 } | PropertyNames std.string.NumberLiteral
                # => error: invalid number literal
                ```
              "%
              = fun
                  contract
                  =>
                  std.contract.custom
                    (fun
                      label
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        std.array.try_fold_left
                          (fun
                            acc
                            field_name
                            =>
                            (match {
                              'Ok
                              _ =>
                                'Ok value,
                              'Error
                              e =>
                                'Error e,
                            })
                              (std.contract.check contract label field_name))
                          ('Ok value)
                          (std.record.fields value)),
            Record
              | {
                  additional | [| 'None, 'Some Dyn |],
                  patterns | { _ | Dyn },
                  properties | { _ | Dyn },
                  required | { _ | Dyn }
                }
              -> Dyn
              | doc m%"
                A contract for checking JSON Schema object properties.
                
                In `Record { properties, required, patterns, additional }`, properties and patterns
                should be dicts containing contracts as values. These contracts will be
                applied to the appropriate fields of your record. `additional` can be
                `None` (in which case fields not matching `properties` or `patterns` are
                forbidden) or `Some contract` (in which case `contract` will be applied to
                every field not matched by `properties` and `patterns`).
                
                The contract returned by `Record` is sort of eager: it will call
                `std.contract.check` on the appropriate field values, and then it will
                propagate any lazy contracts returned by `std.contract.check`. This makes
                `Record` a little more eager than standard record contracts, and if all
                the contracts you provide are eager then `Record` will be fully eager.
                
                Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5]
                
                # Examples
                
                ```nickel multiline
                { foo = 1 } | Record { properties = { foo = Number }, required = {}, patterns = {}, additional = 'None }
                # => { foo = 1 }
                
                # Properties aren't required to be present.
                { } | Record { properties = { foo = Number }, required = {}, patterns = {}, additional = 'None }
                # => { }
                
                # Properties aren't required to be present.
                { } | Record { properties = { foo = Number }, required = { foo = null }, patterns = {}, additional = 'None }
                # => error
                
                # If something in properties also matches a pattern, both contracts are applied.
                { foo = 1.1 } | Record { properties = { foo = Number }, required = {}, patterns = { "." = std.number.Integer }, additional = 'None }
                # => error: expected an integer
                
                # additional being 'None means that unmatched fields are forbidden
                { bar = 1 } | Record { properties = { foo = Number }, required = {}, patterns = {}, additional = 'None }
                # => error: extra fields
                
                # fields that are matched by a pattern don't count as "additional"
                { bar = 1 } | Record { properties = { foo = Number }, required = {}, patterns = { "." = Number }, additional = 'None }
                # => { bar = 1 }
                
                # additional being 'Some applies the extra contract to unmatched fields
                { bar = 1 } | Record { properties = { foo = Number }, required = {}, patterns = {}, additional = 'Some String }
                # => error
                
                # Inner contracts are propagated
                { foo = { bar = 1 }} | Record { properties = { foo = { bar | String } }, required = {}, patterns = {}, additional = 'None }
                # => error: contract broken by the value of `bar`
                
                # Inner contracts aren't evaluated eagerly
                ({ foo = { bar = 1 }, baz = 2} | Record { properties = { foo = { bar | String } }, required = {}, patterns = {}, additional = 'Some Dyn }).baz
                # => 2
                ```
              "%
              = fun
                  { properties, required, patterns, additional, }
                  =>
                  std.contract.custom
                    (fun
                      label
                      x
                      =>
                      if !(std.is_record x) then
                        'Error { message = "expected a record" }
                      else
                        let x | { _ | Dyn } = x in
                        let required | { _ | Dyn } = required in
                          let checked_properties
                              : [| 'Ok ({ _ | Dyn }), 'Error ErrData |]
                              = std.array.try_fold_left
                                (fun
                                  acc
                                  { field, value = contract, }
                                  =>
                                  if !(std.record.has_field field x) then
                                    if std.record.has_field field required then
                                      'Error
                                        ({
                                          message =
                                            "missing required field `%{field}`"
                                        }
                                        | ErrData)
                                    else
                                      'Ok acc
                                  else
                                    (match {
                                      'Ok
                                      checked_value =>
                                        'Ok
                                          (std.record.insert
                                            field
                                            checked_value
                                            acc),
                                      'Error
                                      e =>
                                        'Error e,
                                    })
                                      (std.contract.check
                                        contract
                                        label
                                        x."%{field}"))
                                ({}
                                | { _ | Dyn })
                                (std.record.to_array (properties | { _ : Dyn }))
                              in
                            let matching_fields
                                : String -> { _ : Dyn }
                                = fun
                                  pattern
                                  =>
                                  let matcher = std.string.is_match pattern in
                                  std.array.fold_left
                                      (fun
                                        acc
                                        { field, value, }
                                        =>
                                        if matcher field then
                                          std.record.insert field value acc
                                        else
                                          acc)
                                      {}
                                      (std.record.to_array x)
                                in
                              let checked_pattern_properties
                                  : [| 'Ok ({ _ | Dyn }), 'Error ErrData |]
                                  = std.array.try_fold_left
                                    (fun
                                      acc
                                      { field = pattern, value = contract, }
                                      =>
                                      (match {
                                        'Ok
                                        checked_dict =>
                                          'Ok
                                            ((acc & checked_dict)
                                            | { _ | Dyn }),
                                        'Error
                                        e =>
                                          'Error e,
                                      })
                                        (std.array.try_fold_left
                                          (fun
                                            acc
                                            { field, value, }
                                            =>
                                            (match {
                                              'Ok
                                              checked_value =>
                                                'Ok
                                                  (std.record.insert
                                                    field
                                                    checked_value
                                                    acc),
                                              'Error
                                              e =>
                                                'Error e,
                                            })
                                              (std.contract.check
                                                contract
                                                label
                                                value))
                                          ({}
                                          | { _ | Dyn })
                                          (std.record.to_array
                                            (matching_fields pattern))))
                                    ({}
                                    | { _ | Dyn })
                                    (std.record.to_array
                                      (patterns
                                      | { _ : Dyn }))
                                  in
                                (match {
                                    ['Error e, _] =>
                                      'Error e,
                                    [_, 'Error e] =>
                                      'Error e,
                                    ['Ok
                                      checked_properties,
                                      'Ok
                                      checked_pattern_properties] =>
                                      let remaining_fields
                                        : { _ | Dyn }
                                        = std.array.fold_left
                                          (fun
                                            acc
                                            field
                                            =>
                                            if !(std.record.has_field
                                              field
                                              acc) then
                                              acc
                                            else
                                              std.record.remove field acc)
                                          x
                                          ((std.record.fields
                                            (checked_properties
                                            | { _ : Dyn }))
                                          @ (std.record.fields
                                            (checked_pattern_properties
                                            | { _ : Dyn })))
                                        in
                                      let checked_additional
                                          : [|
                                            'Ok (
                                            { _ | Dyn }
                                            ),
                                            'Error ErrData
                                          |]
                                          = (match {
                                            'None =>
                                              if !(std.record.is_empty
                                                remaining_fields) then
                                                'Error
                                                  ({
                                                    message =
                                                      "extra fields %{std.serialize
                                                          'Json
                                                          ((std.record.fields
                                                            remaining_fields)
                                                          | Dyn)}"
                                                  }
                                                  | ErrData)
                                              else
                                                'Ok ({} | { _ | Dyn }),
                                            'Some
                                            contract =>
                                              std.array.try_fold_left
                                                (fun
                                                  acc
                                                  { field, value, }
                                                  =>
                                                  (match {
                                                    'Ok
                                                    checked_value =>
                                                      'Ok
                                                        (std.record.insert
                                                          field
                                                          checked_value
                                                          acc),
                                                    'Error
                                                    e =>
                                                      'Error e,
                                                  })
                                                    (std.contract.check
                                                      contract
                                                      label
                                                      value))
                                                ({}
                                                | { _ | Dyn })
                                                (std.record.to_array
                                                  remaining_fields),
                                          })
                                            (additional
                                            | [| 'None, 'Some Dyn |])
                                          in
                                        (match {
                                            'Error
                                            e =>
                                              'Error e,
                                            'Ok
                                            checked_additional =>
                                              'Ok
                                                ((checked_properties
                                                & checked_pattern_properties)
                                                & checked_additional),
                                          })
                                            checked_additional,
                                  })
                                    [
                                      checked_properties,
                                      checked_pattern_properties
                                    ]),
            Required
              | Array String -> Dyn
              | doc m%"
                A contract asserting that a record has certain fields.
                
                # Examples
                
                
                ```nickel multiline
                { foo = 1, bar = 2 } | Required [ "foo" ]
                # => { foo = 1, bar = 2 }
                
                { foo = 1, bar = 2 } | Required [ "baz" ]
                # => error: missing required field baz
                
                "baz" | Required [ "baz" ]
                # => error: expected a record
                ```
              "%
              = fun
                  fields
                  =>
                  std.contract.from_validator
                    (fun
                      value
                      =>
                      if !(std.is_record value) then
                        'Error { message = "expected a record" }
                      else
                        (match { 'Error e => 'Error e, 'Ok _ => 'Ok, })
                          (std.array.try_fold_left
                            (fun
                              acc
                              field
                              =>
                              if !(std.record.has_field field value) then
                                'Error
                                  {
                                    message = "missing required field %{field}"
                                  }
                              else
                                'Ok acc)
                            null
                            fields))
          },
    string =
      {
          MaxLength
            | Number -> Dyn
            | doc m%"
              `MaxLength n` is a contract that checks for a string of length at most `n`.
              
              Here, the "length" of a string is the number of extended grapheme clusters in the string.
              This may not agree with the JSON schema semantics, which counts the number of Unicode
              code points.
              
              # Examples
              
              ```nickel multiline
              "Hello" | MaxLength 5
              
              # 15 bytes, 3 code points, 1 extended grapheme cluster
              "👨‍🦰" | MaxLength 1
              
              "Hello" | MaxLength 4
              # => error
              ```
            "%
            = fun
                limit
                =>
                std.contract.from_validator
                  (fun
                    value
                    =>
                    if !(std.is_string value) then
                      'Error { message = "expected a string" }
                    else
                      if (std.string.length value) <= limit then
                        'Ok
                      else
                        'Error
                          {
                            message =
                              "expected a string of length at most %{std.string.from_number
                                  limit}"
                          }),
          MinLength
            | Number -> Dyn
            | doc m%"
              `MinLength n` is a contract that checks for a string of length at least `n`.
              
              Here, the "length" of a string is the number of extended grapheme clusters in the string.
              This may not agree with the JSON schema semantics, which counts the number of Unicode
              code points.
              
              # Examples
              
              ```nickel multiline
              "Hello" | MinLength 5
              
              # 15 bytes, 3 code points, 1 extended grapheme cluster
              "👨‍🦰" | MinLength 3
              # => error
              
              "Hello" | MinLength 6
              # => error
              ```
            "%
            = fun
                limit
                =>
                std.contract.from_validator
                  (fun
                    value
                    =>
                    if !(std.is_string value) then
                      'Error { message = "expected a string" }
                    else
                      if (std.string.length value) >= limit then
                        'Ok
                      else
                        'Error
                          {
                            message =
                              "expected a string of length at least %{std.string.from_number
                                  limit}"
                          })
        }
  }
  in
let rec refs
    = {
      oneOf."0" = { key | String, valueExpression | String },
      oneOf."1" = { fieldRef | String, warning | String },
      oneOf."10" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."100" =
        {
            audiences | Array String | optional,
            authenticated | Bool | optional,
            error | String | optional,
            user | refs.oneOf."101" | { _ | Dyn } | optional
          },
      oneOf."101" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            uid | String | optional,
            username | String | optional
          },
      oneOf."102" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."703", { _ | Dyn } ])
              | optional
          },
      oneOf."103" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."707", { _ | Dyn } ])
              | optional
          },
      oneOf."105" = { path | String | optional, verb | String | optional },
      oneOf."106" =
        { nonResourceURLs | Array String | optional, verbs | Array String },
      oneOf."107" =
        {
            fieldSelector | refs.oneOf."102" | { _ | Dyn } | optional,
            group | String | optional,
            labelSelector | refs.oneOf."103" | { _ | Dyn } | optional,
            name | String | optional,
            namespace | String | optional,
            resource | String | optional,
            subresource | String | optional,
            verb | String | optional,
            version | String | optional
          },
      oneOf."108" =
        {
            apiGroups | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."11" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."110" =
        {
            nonResourceAttributes | refs.oneOf."105" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."107" | { _ | Dyn } | optional
          },
      oneOf."112" = { namespace | String | optional },
      oneOf."114" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            nonResourceAttributes | refs.oneOf."105" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."107" | { _ | Dyn } | optional,
            uid | String | optional,
            user | String | optional
          },
      oneOf."115" =
        {
            allowed | Bool,
            denied | Bool | optional,
            evaluationError | String | optional,
            reason | String | optional
          },
      oneOf."116" =
        {
            evaluationError | String | optional,
            incomplete | Bool,
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."106", { _ | Dyn } ]),
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."108", { _ | Dyn } ])
          },
      oneOf."117" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."118" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."120" | { _ | Dyn } | optional,
            status | refs.oneOf."121" | { _ | Dyn } | optional
          },
      oneOf."12" =
        {
            expressionWarnings
              | Array (std.contract.Sequence [ refs.oneOf."1", { _ | Dyn } ])
              | optional
          },
      oneOf."120" =
        {
            maxReplicas | std.number.Integer,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."117" | { _ | Dyn },
            targetCPUUtilizationPercentage | std.number.Integer | optional
          },
      oneOf."121" =
        {
            currentCPUUtilizationPercentage | std.number.Integer | optional,
            currentReplicas | std.number.Integer,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."719" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."123" = { replicas | std.number.Integer | optional },
      oneOf."124" =
        { replicas | std.number.Integer, selector | String | optional },
      oneOf."125" =
        {
            container | String,
            name | String,
            target | refs.oneOf."141" | { _ | Dyn }
          },
      oneOf."126" =
        {
            container | String,
            current | refs.oneOf."142" | { _ | Dyn },
            name | String
          },
      oneOf."127" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."128" =
        {
            metric | refs.oneOf."138" | { _ | Dyn },
            target | refs.oneOf."141" | { _ | Dyn }
          },
      oneOf."129" =
        {
            current | refs.oneOf."142" | { _ | Dyn },
            metric | refs.oneOf."138" | { _ | Dyn }
          },
      oneOf."13" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."18" | { _ | Dyn } | optional,
            status | refs.oneOf."19" | { _ | Dyn } | optional
          },
      oneOf."130" =
        {
            periodSeconds | std.number.Integer,
            type | String,
            value | std.number.Integer
          },
      oneOf."131" =
        {
            policies
              | Array (std.contract.Sequence [ refs.oneOf."130", { _ | Dyn } ])
              | optional,
            selectPolicy | String | optional,
            stabilizationWindowSeconds | std.number.Integer | optional,
            tolerance | refs.oneOf."695" | optional
          },
      oneOf."132" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."136" | { _ | Dyn } | optional,
            status | refs.oneOf."137" | { _ | Dyn } | optional
          },
      oneOf."133" =
        {
            scaleDown | refs.oneOf."131" | { _ | Dyn } | optional,
            scaleUp | refs.oneOf."131" | { _ | Dyn } | optional
          },
      oneOf."134" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."136" =
        {
            behavior | refs.oneOf."133" | { _ | Dyn } | optional,
            maxReplicas | std.number.Integer,
            metrics
              | Array (std.contract.Sequence [ refs.oneOf."139", { _ | Dyn } ])
              | optional,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."127" | { _ | Dyn }
          },
      oneOf."137" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."134", { _ | Dyn } ])
              | optional,
            currentMetrics
              | Array (std.contract.Sequence [ refs.oneOf."140", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."719" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."138" =
        { name | String, selector | refs.oneOf."706" | { _ | Dyn } | optional },
      oneOf."139" =
        {
            containerResource | refs.oneOf."125" | { _ | Dyn } | optional,
            external | refs.oneOf."128" | { _ | Dyn } | optional,
            object | refs.oneOf."143" | { _ | Dyn } | optional,
            pods | refs.oneOf."145" | { _ | Dyn } | optional,
            resource | refs.oneOf."147" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."14" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."16" | { _ | Dyn } | optional
          },
      oneOf."140" =
        {
            containerResource | refs.oneOf."126" | { _ | Dyn } | optional,
            external | refs.oneOf."129" | { _ | Dyn } | optional,
            object | refs.oneOf."144" | { _ | Dyn } | optional,
            pods | refs.oneOf."146" | { _ | Dyn } | optional,
            resource | refs.oneOf."148" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."141" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."695" | optional,
            type | String,
            value | refs.oneOf."695" | optional
          },
      oneOf."142" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."695" | optional,
            value | refs.oneOf."695" | optional
          },
      oneOf."143" =
        {
            describedObject | refs.oneOf."127" | { _ | Dyn },
            metric | refs.oneOf."138" | { _ | Dyn },
            target | refs.oneOf."141" | { _ | Dyn }
          },
      oneOf."144" =
        {
            current | refs.oneOf."142" | { _ | Dyn },
            describedObject | refs.oneOf."127" | { _ | Dyn },
            metric | refs.oneOf."138" | { _ | Dyn }
          },
      oneOf."145" =
        {
            metric | refs.oneOf."138" | { _ | Dyn },
            target | refs.oneOf."141" | { _ | Dyn }
          },
      oneOf."146" =
        {
            current | refs.oneOf."142" | { _ | Dyn },
            metric | refs.oneOf."138" | { _ | Dyn }
          },
      oneOf."147" = { name | String, target | refs.oneOf."141" | { _ | Dyn } },
      oneOf."148" = { current | refs.oneOf."142" | { _ | Dyn }, name | String },
      oneOf."149" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CronJob |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."151" | { _ | Dyn } | optional,
            status | refs.oneOf."152" | { _ | Dyn } | optional
          },
      oneOf."151" =
        {
            concurrencyPolicy | String | optional,
            failedJobsHistoryLimit | std.number.Integer | optional,
            jobTemplate | refs.oneOf."158" | { _ | Dyn },
            schedule | String,
            startingDeadlineSeconds | std.number.Integer | optional,
            successfulJobsHistoryLimit | std.number.Integer | optional,
            suspend | Bool | optional,
            timeZone | String | optional
          },
      oneOf."152" =
        {
            active
              | Array (std.contract.Sequence [ refs.oneOf."306", { _ | Dyn } ])
              | optional,
            lastScheduleTime | refs.oneOf."719" | String | optional,
            lastSuccessfulTime | refs.oneOf."719" | String | optional
          },
      oneOf."153" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Job |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."156" | { _ | Dyn } | optional,
            status | refs.oneOf."157" | { _ | Dyn } | optional
          },
      oneOf."154" =
        {
            lastProbeTime | refs.oneOf."719" | String | optional,
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."156" =
        {
            activeDeadlineSeconds | std.number.Integer | optional,
            backoffLimit | std.number.Integer | optional,
            backoffLimitPerIndex | std.number.Integer | optional,
            completionMode | String | optional,
            completions | std.number.Integer | optional,
            managedBy | String | optional,
            manualSelector | Bool | optional,
            maxFailedIndexes | std.number.Integer | optional,
            parallelism | std.number.Integer | optional,
            podFailurePolicy | refs.oneOf."159" | { _ | Dyn } | optional,
            podReplacementPolicy | String | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional,
            successPolicy | refs.oneOf."163" | { _ | Dyn } | optional,
            suspend | Bool | optional,
            template | refs.oneOf."340" | { _ | Dyn },
            ttlSecondsAfterFinished | std.number.Integer | optional
          },
      oneOf."157" =
        {
            active | std.number.Integer | optional,
            completedIndexes | String | optional,
            completionTime | refs.oneOf."719" | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."154", { _ | Dyn } ])
              | optional,
            failed | std.number.Integer | optional,
            failedIndexes | String | optional,
            ready | std.number.Integer | optional,
            startTime | refs.oneOf."719" | String | optional,
            succeeded | std.number.Integer | optional,
            terminating | std.number.Integer | optional,
            uncountedTerminatedPods | refs.oneOf."165" | { _ | Dyn } | optional
          },
      oneOf."158" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."156" | { _ | Dyn } | optional
          },
      oneOf."159" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."162", { _ | Dyn } ])
          },
      oneOf."16" =
        {
            matchResources | refs.oneOf."3" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."9" | { _ | Dyn } | optional,
            policyName | String | optional,
            validationActions | Array String | optional
          },
      oneOf."160" =
        {
            containerName | String | optional,
            operator | String,
            values | Array std.number.Integer
          },
      oneOf."161" = { status | String, type | String },
      oneOf."162" =
        {
            action | String,
            onExitCodes | refs.oneOf."160" | { _ | Dyn } | optional,
            onPodConditions
              | Array (std.contract.Sequence [ refs.oneOf."161", { _ | Dyn } ])
              | optional
          },
      oneOf."163" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."164", { _ | Dyn } ])
          },
      oneOf."164" =
        {
            succeededCount | std.number.Integer | optional,
            succeededIndexes | String | optional
          },
      oneOf."165" =
        {
            failed | Array String | optional,
            succeeded | Array String | optional
          },
      oneOf."166" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CertificateSigningRequest |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."169" | { _ | Dyn },
            status | refs.oneOf."170" | { _ | Dyn } | optional
          },
      oneOf."167" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            lastUpdateTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."169" =
        {
            expirationSeconds | std.number.Integer | optional,
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            request | String,
            signerName | String,
            uid | String | optional,
            usages | Array String | optional,
            username | String | optional
          },
      oneOf."170" =
        {
            certificate | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."167", { _ | Dyn } ])
              | optional
          },
      oneOf."171" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterTrustBundle |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."173" | { _ | Dyn }
          },
      oneOf."173" = { signerName | String | optional, trustBundle | String },
      oneOf."174" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PodCertificateRequest |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."176" | { _ | Dyn },
            status | refs.oneOf."177" | { _ | Dyn } | optional
          },
      oneOf."176" =
        {
            maxExpirationSeconds | std.number.Integer | optional,
            nodeName | String,
            nodeUID | String,
            pkixPublicKey | String,
            podName | String,
            podUID | String,
            proofOfPossession | String,
            serviceAccountName | String,
            serviceAccountUID | String,
            signerName | String
          },
      oneOf."177" =
        {
            beginRefreshAt | refs.oneOf."719" | String | optional,
            certificateChain | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            notAfter | refs.oneOf."719" | String | optional,
            notBefore | refs.oneOf."719" | String | optional
          },
      oneOf."178" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterTrustBundle |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."180" | { _ | Dyn }
          },
      oneOf."18" =
        {
            auditAnnotations
              | Array (std.contract.Sequence [ refs.oneOf."0", { _ | Dyn } ])
              | optional,
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."3" | { _ | Dyn } | optional,
            paramKind | refs.oneOf."8" | { _ | Dyn } | optional,
            validations
              | Array (std.contract.Sequence [ refs.oneOf."23", { _ | Dyn } ])
              | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."24", { _ | Dyn } ])
              | optional
          },
      oneOf."180" = { signerName | String | optional, trustBundle | String },
      oneOf."181" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Lease |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."183" | { _ | Dyn } | optional
          },
      oneOf."183" =
        {
            acquireTime | refs.oneOf."710" | String | optional,
            holderIdentity | String | optional,
            leaseDurationSeconds | std.number.Integer | optional,
            leaseTransitions | std.number.Integer | optional,
            preferredHolder | String | optional,
            renewTime | refs.oneOf."710" | String | optional,
            strategy | String | optional
          },
      oneOf."184" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LeaseCandidate |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."186" | { _ | Dyn } | optional
          },
      oneOf."186" =
        {
            binaryVersion | String,
            emulationVersion | String | optional,
            leaseName | String,
            pingTime | refs.oneOf."710" | String | optional,
            renewTime | refs.oneOf."710" | String | optional,
            strategy | String
          },
      oneOf."187" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LeaseCandidate |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."189" | { _ | Dyn } | optional
          },
      oneOf."189" =
        {
            binaryVersion | String,
            emulationVersion | String | optional,
            leaseName | String,
            pingTime | refs.oneOf."710" | String | optional,
            renewTime | refs.oneOf."710" | String | optional,
            strategy | String
          },
      oneOf."19" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            typeChecking | refs.oneOf."12" | { _ | Dyn } | optional
          },
      oneOf."190" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."191" =
        {
            nodeAffinity | refs.oneOf."289" | { _ | Dyn } | optional,
            podAffinity | refs.oneOf."320" | { _ | Dyn } | optional,
            podAntiAffinity | refs.oneOf."322" | { _ | Dyn } | optional
          },
      oneOf."192" = { localhostProfile | String | optional, type | String },
      oneOf."193" = { devicePath | String, name | String },
      oneOf."194" =
        {
            cachingMode | String | optional,
            diskName | String,
            diskURI | String,
            fsType | String | optional,
            kind | String | optional,
            readOnly | Bool | optional
          },
      oneOf."195" =
        {
            readOnly | Bool | optional,
            secretName | String,
            secretNamespace | String | optional,
            shareName | String
          },
      oneOf."196" =
        { readOnly | Bool | optional, secretName | String, shareName | String },
      oneOf."198" =
        {
            controllerExpandSecretRef
              | refs.oneOf."374"
              | { _ | Dyn }
              | optional,
            controllerPublishSecretRef
              | refs.oneOf."374"
              | { _ | Dyn }
              | optional,
            driver | String,
            fsType | String | optional,
            nodeExpandSecretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            nodePublishSecretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            nodeStageSecretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional,
            volumeHandle | String
          },
      oneOf."199" =
        {
            driver | String,
            fsType | String | optional,
            nodePublishSecretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional
          },
      oneOf."2" = { expression | String, name | String },
      oneOf."20" =
        {
            admissionReviewVersions | Array String,
            clientConfig | refs.oneOf."25" | { _ | Dyn },
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            name | String,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."200" =
        { add | Array String | optional, drop | Array String | optional },
      oneOf."201" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."202" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."203" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."204" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."205" = { timeoutSeconds | std.number.Integer | optional },
      oneOf."206" =
        {
            labelSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            name | String | optional,
            "optional" | Bool | optional,
            path | String,
            signerName | String | optional
          },
      oneOf."207" =
        {
            error | String | optional,
            message | String | optional,
            status | String,
            type | String
          },
      oneOf."208" =
        {
            apiVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."207", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ComponentStatus |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional
          },
      oneOf."21" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."20", { _ | Dyn } ])
              | optional
          },
      oneOf."210" =
        {
            apiVersion | String | optional,
            binaryData | { _ | String } | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'ConfigMap |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional
          },
      oneOf."211" = { name | String | optional, "optional" | Bool | optional },
      oneOf."212" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."214" =
        {
            kubeletConfigKey | String,
            name | String,
            namespace | String,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."215" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."216" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."217" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."241", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."240", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."269" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."220", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."221", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."361" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            restartPolicyRules
              | Array (std.contract.Sequence [ refs.oneOf."222", { _ | Dyn } ])
              | optional,
            securityContext | refs.oneOf."376" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."399", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."400", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."218" =
        { containerName | String, requestName | String, resourceName | String },
      oneOf."219" =
        {
            names | Array String | optional,
            sizeBytes | std.number.Integer | optional
          },
      oneOf."220" =
        {
            containerPort | std.number.Integer,
            hostIP | String | optional,
            hostPort | std.number.Integer | optional,
            name | String | optional,
            protocol | String | optional
          },
      oneOf."221" = { resourceName | String, restartPolicy | String },
      oneOf."222" =
        {
            action | String,
            exitCodes | refs.oneOf."223" | { _ | Dyn } | optional
          },
      oneOf."223" =
        { operator | String, values | Array std.number.Integer | optional },
      oneOf."224" =
        {
            running | refs.oneOf."225" | { _ | Dyn } | optional,
            terminated | refs.oneOf."226" | { _ | Dyn } | optional,
            waiting | refs.oneOf."227" | { _ | Dyn } | optional
          },
      oneOf."225" = { startedAt | refs.oneOf."719" | String | optional },
      oneOf."226" =
        {
            containerID | String | optional,
            exitCode | std.number.Integer,
            finishedAt | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            signal | std.number.Integer | optional,
            startedAt | refs.oneOf."719" | String | optional
          },
      oneOf."227" = { message | String | optional, reason | String | optional },
      oneOf."228" =
        {
            allocatedResources | { _ | refs.oneOf."695" } | optional,
            allocatedResourcesStatus
              | Array (std.contract.Sequence [ refs.oneOf."362", { _ | Dyn } ])
              | optional,
            containerID | String | optional,
            image | String,
            imageID | String,
            lastState | refs.oneOf."224" | { _ | Dyn } | optional,
            name | String,
            ready | Bool,
            resources | refs.oneOf."361" | { _ | Dyn } | optional,
            restartCount | std.number.Integer,
            started | Bool | optional,
            state | refs.oneOf."224" | { _ | Dyn } | optional,
            stopSignal | String | optional,
            user | refs.oneOf."229" | { _ | Dyn } | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."401", { _ | Dyn } ])
              | optional
          },
      oneOf."229" = { linux | refs.oneOf."275" | { _ | Dyn } | optional },
      oneOf."23" =
        {
            expression | String,
            message | String | optional,
            messageExpression | String | optional,
            reason | String | optional
          },
      oneOf."230" = { Port | std.number.Integer },
      oneOf."231" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."232", { _ | Dyn } ])
              | optional
          },
      oneOf."232" =
        {
            fieldRef | refs.oneOf."305" | { _ | Dyn } | optional,
            mode | std.number.Integer | optional,
            path | String,
            resourceFieldRef | refs.oneOf."355" | { _ | Dyn } | optional
          },
      oneOf."233" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."232", { _ | Dyn } ])
              | optional
          },
      oneOf."234" =
        { medium | String | optional, sizeLimit | refs.oneOf."695" | optional },
      oneOf."235" =
        {
            hostname | String | optional,
            ip | String,
            nodeName | String | optional,
            targetRef | refs.oneOf."306" | { _ | Dyn } | optional
          },
      oneOf."236" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer,
            protocol | String | optional
          },
      oneOf."237" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."235", { _ | Dyn } ])
              | optional,
            notReadyAddresses
              | Array (std.contract.Sequence [ refs.oneOf."235", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."236", { _ | Dyn } ])
              | optional
          },
      oneOf."238" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Endpoints |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            subsets
              | Array (std.contract.Sequence [ refs.oneOf."237", { _ | Dyn } ])
              | optional
          },
      oneOf."24" = { expression | String, name | String },
      oneOf."240" =
        {
            configMapRef | refs.oneOf."211" | { _ | Dyn } | optional,
            prefix | String | optional,
            secretRef | refs.oneOf."370" | { _ | Dyn } | optional
          },
      oneOf."241" =
        {
            name | String,
            value | String | optional,
            valueFrom | refs.oneOf."242" | { _ | Dyn } | optional
          },
      oneOf."242" =
        {
            configMapKeyRef | refs.oneOf."212" | { _ | Dyn } | optional,
            fieldRef | refs.oneOf."305" | { _ | Dyn } | optional,
            fileKeyRef | refs.oneOf."251" | { _ | Dyn } | optional,
            resourceFieldRef | refs.oneOf."355" | { _ | Dyn } | optional,
            secretKeyRef | refs.oneOf."371" | { _ | Dyn } | optional
          },
      oneOf."243" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."241", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."240", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."269" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."220", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."221", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."361" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            restartPolicyRules
              | Array (std.contract.Sequence [ refs.oneOf."222", { _ | Dyn } ])
              | optional,
            securityContext | refs.oneOf."376" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."344" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            targetContainerName | String | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."399", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."400", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."244" =
        { volumeClaimTemplate | refs.oneOf."313" | { _ | Dyn } | optional },
      oneOf."245" =
        {
            action | String | optional,
            apiVersion | String | optional,
            count | std.number.Integer | optional,
            eventTime | refs.oneOf."710" | String | optional,
            firstTimestamp | refs.oneOf."719" | String | optional,
            involvedObject | refs.oneOf."306" | { _ | Dyn },
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            lastTimestamp | refs.oneOf."719" | String | optional,
            message | String | optional,
            metadata | refs.oneOf."711" | { _ | Dyn },
            reason | String | optional,
            related | refs.oneOf."306" | { _ | Dyn } | optional,
            reportingComponent | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."247" | { _ | Dyn } | optional,
            source | refs.oneOf."248" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."247" =
        {
            count | std.number.Integer | optional,
            lastObservedTime | refs.oneOf."710" | String | optional
          },
      oneOf."248" = { component | String | optional, host | String | optional },
      oneOf."249" = { command | Array String | optional },
      oneOf."25" =
        {
            caBundle | String | optional,
            service | refs.oneOf."11" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."250" =
        {
            fsType | String | optional,
            lun | std.number.Integer | optional,
            readOnly | Bool | optional,
            targetWWNs | Array String | optional,
            wwids | Array String | optional
          },
      oneOf."251" =
        {
            key | String,
            "optional" | Bool | optional,
            path | String,
            volumeName | String
          },
      oneOf."252" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn } | optional
          },
      oneOf."253" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional
          },
      oneOf."254" =
        { datasetName | String | optional, datasetUUID | String | optional },
      oneOf."255" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            pdName | String,
            readOnly | Bool | optional
          },
      oneOf."256" = { port | std.number.Integer, service | String | optional },
      oneOf."257" =
        {
            directory | String | optional,
            repository | String,
            revision | String | optional
          },
      oneOf."258" =
        {
            endpoints | String,
            endpointsNamespace | String | optional,
            path | String,
            readOnly | Bool | optional
          },
      oneOf."259" =
        { endpoints | String, path | String, readOnly | Bool | optional },
      oneOf."26" = { expression | String | optional },
      oneOf."260" =
        {
            host | String | optional,
            httpHeaders
              | Array (std.contract.Sequence [ refs.oneOf."261", { _ | Dyn } ])
              | optional,
            path | String | optional,
            port | refs.oneOf."722",
            scheme | String | optional
          },
      oneOf."261" = { name | String, value | String },
      oneOf."262" = { hostnames | Array String | optional, ip | String },
      oneOf."263" = { ip | String },
      oneOf."264" = { path | String, type | String | optional },
      oneOf."265" =
        {
            chapAuthDiscovery | Bool | optional,
            chapAuthSession | Bool | optional,
            fsType | String | optional,
            initiatorName | String | optional,
            iqn | String,
            iscsiInterface | String | optional,
            lun | std.number.Integer,
            portals | Array String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."266" =
        {
            chapAuthDiscovery | Bool | optional,
            chapAuthSession | Bool | optional,
            fsType | String | optional,
            initiatorName | String | optional,
            iqn | String,
            iscsiInterface | String | optional,
            lun | std.number.Integer,
            portals | Array String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."267" =
        { pullPolicy | String | optional, reference | String | optional },
      oneOf."268" =
        { key | String, mode | std.number.Integer | optional, path | String },
      oneOf."269" =
        {
            postStart | refs.oneOf."270" | { _ | Dyn } | optional,
            preStop | refs.oneOf."270" | { _ | Dyn } | optional,
            stopSignal | String | optional
          },
      oneOf."27" = { expression | String | optional },
      oneOf."270" =
        {
            exec | refs.oneOf."249" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."260" | { _ | Dyn } | optional,
            sleep | refs.oneOf."386" | { _ | Dyn } | optional,
            tcpSocket | refs.oneOf."390" | { _ | Dyn } | optional
          },
      oneOf."271" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LimitRange |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."274" | { _ | Dyn } | optional
          },
      oneOf."272" =
        {
            "default" | { _ | refs.oneOf."695" } | optional,
            defaultRequest | { _ | refs.oneOf."695" } | optional,
            max | { _ | refs.oneOf."695" } | optional,
            maxLimitRequestRatio | { _ | refs.oneOf."695" } | optional,
            min | { _ | refs.oneOf."695" } | optional,
            type | String
          },
      oneOf."274" =
        {
            limits
              | Array (std.contract.Sequence [ refs.oneOf."272", { _ | Dyn } ])
          },
      oneOf."275" =
        {
            gid | std.number.Integer,
            supplementalGroups | Array std.number.Integer | optional,
            uid | std.number.Integer
          },
      oneOf."276" =
        {
            hostname | String | optional,
            ip | String | optional,
            ipMode | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."341", { _ | Dyn } ])
              | optional
          },
      oneOf."277" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."276", { _ | Dyn } ])
              | optional
          },
      oneOf."278" = { name | String | optional },
      oneOf."279" = { fsType | String | optional, path | String },
      oneOf."28" = { expression | String, name | String },
      oneOf."280" =
        {
            status | String,
            targetVolumeAttributesClassName | String | optional
          },
      oneOf."281" =
        { path | String, readOnly | Bool | optional, server | String },
      oneOf."282" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Namespace |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."285" | { _ | Dyn } | optional,
            status | refs.oneOf."286" | { _ | Dyn } | optional
          },
      oneOf."283" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."285" = { finalizers | Array String | optional },
      oneOf."286" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."283", { _ | Dyn } ])
              | optional,
            phase | String | optional
          },
      oneOf."287" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Node |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."301" | { _ | Dyn } | optional,
            status | refs.oneOf."302" | { _ | Dyn } | optional
          },
      oneOf."288" = { address | String, type | String },
      oneOf."289" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."343", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | refs.oneOf."298"
              | { _ | Dyn }
              | optional
          },
      oneOf."29" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional
          },
      oneOf."290" =
        {
            lastHeartbeatTime | refs.oneOf."719" | String | optional,
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."291" = { configMap | refs.oneOf."214" | { _ | Dyn } | optional },
      oneOf."292" =
        {
            active | refs.oneOf."291" | { _ | Dyn } | optional,
            assigned | refs.oneOf."291" | { _ | Dyn } | optional,
            error | String | optional,
            lastKnownGood | refs.oneOf."291" | { _ | Dyn } | optional
          },
      oneOf."293" =
        { kubeletEndpoint | refs.oneOf."230" | { _ | Dyn } | optional },
      oneOf."294" = { supplementalGroupsPolicy | Bool | optional },
      oneOf."296" =
        {
            features | refs.oneOf."297" | { _ | Dyn } | optional,
            name | String | optional
          },
      oneOf."297" =
        {
            recursiveReadOnlyMounts | Bool | optional,
            userNamespaces | Bool | optional
          },
      oneOf."298" =
        {
            nodeSelectorTerms
              | Array (std.contract.Sequence [ refs.oneOf."300", { _ | Dyn } ])
          },
      oneOf."299" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."3" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."7", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."7", { _ | Dyn } ])
              | optional
          },
      oneOf."30" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."35" | { _ | Dyn } | optional
          },
      oneOf."300" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."299", { _ | Dyn } ])
              | optional,
            matchFields
              | Array (std.contract.Sequence [ refs.oneOf."299", { _ | Dyn } ])
              | optional
          },
      oneOf."301" =
        {
            configSource | refs.oneOf."291" | { _ | Dyn } | optional,
            externalID | String | optional,
            podCIDR | String | optional,
            podCIDRs | Array String | optional,
            providerID | String | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."391", { _ | Dyn } ])
              | optional,
            unschedulable | Bool | optional
          },
      oneOf."302" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."288", { _ | Dyn } ])
              | optional,
            allocatable | { _ | refs.oneOf."695" } | optional,
            capacity | { _ | refs.oneOf."695" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."290", { _ | Dyn } ])
              | optional,
            config | refs.oneOf."292" | { _ | Dyn } | optional,
            daemonEndpoints | refs.oneOf."293" | { _ | Dyn } | optional,
            features | refs.oneOf."294" | { _ | Dyn } | optional,
            images
              | Array (std.contract.Sequence [ refs.oneOf."219", { _ | Dyn } ])
              | optional,
            nodeInfo | refs.oneOf."304" | { _ | Dyn } | optional,
            phase | String | optional,
            runtimeHandlers
              | Array (std.contract.Sequence [ refs.oneOf."296", { _ | Dyn } ])
              | optional,
            volumesAttached
              | Array (std.contract.Sequence [ refs.oneOf."193", { _ | Dyn } ])
              | optional,
            volumesInUse | Array String | optional
          },
      oneOf."303" = { capacity | std.number.Integer | optional },
      oneOf."304" =
        {
            architecture | String,
            bootID | String,
            containerRuntimeVersion | String,
            kernelVersion | String,
            kubeProxyVersion | String,
            kubeletVersion | String,
            machineID | String,
            operatingSystem | String,
            osImage | String,
            swap | refs.oneOf."303" | { _ | Dyn } | optional,
            systemUUID | String
          },
      oneOf."305" = { apiVersion | String | optional, fieldPath | String },
      oneOf."306" =
        {
            apiVersion | String | optional,
            fieldPath | String | optional,
            kind | String | optional,
            name | String | optional,
            namespace | String | optional,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."307" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PersistentVolume |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."316" | { _ | Dyn } | optional,
            status | refs.oneOf."317" | { _ | Dyn } | optional
          },
      oneOf."308" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PersistentVolumeClaim |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."311" | { _ | Dyn } | optional,
            status | refs.oneOf."312" | { _ | Dyn } | optional
          },
      oneOf."309" =
        {
            lastProbeTime | refs.oneOf."719" | String | optional,
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."31" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."33" | { _ | Dyn } | optional
          },
      oneOf."311" =
        {
            accessModes | Array String | optional,
            dataSource | refs.oneOf."396" | { _ | Dyn } | optional,
            dataSourceRef | refs.oneOf."397" | { _ | Dyn } | optional,
            resources | refs.oneOf."404" | { _ | Dyn } | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            volumeName | String | optional
          },
      oneOf."312" =
        {
            accessModes | Array String | optional,
            allocatedResourceStatuses | { _ | String } | optional,
            allocatedResources | { _ | refs.oneOf."695" } | optional,
            capacity | { _ | refs.oneOf."695" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."309", { _ | Dyn } ])
              | optional,
            currentVolumeAttributesClassName | String | optional,
            modifyVolumeStatus | refs.oneOf."280" | { _ | Dyn } | optional,
            phase | String | optional
          },
      oneOf."313" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."311" | { _ | Dyn }
          },
      oneOf."314" = { claimName | String, readOnly | Bool | optional },
      oneOf."316" =
        {
            accessModes | Array String | optional,
            awsElasticBlockStore | refs.oneOf."190" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."194" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."195" | { _ | Dyn } | optional,
            capacity | { _ | refs.oneOf."695" } | optional,
            cephfs | refs.oneOf."201" | { _ | Dyn } | optional,
            cinder | refs.oneOf."203" | { _ | Dyn } | optional,
            claimRef | refs.oneOf."306" | { _ | Dyn } | optional,
            csi | refs.oneOf."198" | { _ | Dyn } | optional,
            fc | refs.oneOf."250" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."252" | { _ | Dyn } | optional,
            flocker | refs.oneOf."254" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."255" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."258" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."264" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."265" | { _ | Dyn } | optional,
            local | refs.oneOf."279" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            nfs | refs.oneOf."281" | { _ | Dyn } | optional,
            nodeAffinity | refs.oneOf."402" | { _ | Dyn } | optional,
            persistentVolumeReclaimPolicy | String | optional,
            photonPersistentDisk | refs.oneOf."318" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."342" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."346" | { _ | Dyn } | optional,
            rbd | refs.oneOf."347" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."364" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            storageos | refs.oneOf."387" | { _ | Dyn } | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            vsphereVolume | refs.oneOf."405" | { _ | Dyn } | optional
          },
      oneOf."317" =
        {
            lastPhaseTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            phase | String | optional,
            reason | String | optional
          },
      oneOf."318" = { fsType | String | optional, pdID | String },
      oneOf."319" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Pod |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."336" | { _ | Dyn } | optional,
            status | refs.oneOf."337" | { _ | Dyn } | optional
          },
      oneOf."320" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."406", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."321", { _ | Dyn } ])
              | optional
          },
      oneOf."321" =
        {
            labelSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            mismatchLabelKeys | Array String | optional,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            namespaces | Array String | optional,
            topologyKey | String
          },
      oneOf."322" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."406", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."321", { _ | Dyn } ])
              | optional
          },
      oneOf."323" =
        {
            certificateChainPath | String | optional,
            credentialBundlePath | String | optional,
            keyPath | String | optional,
            keyType | String,
            maxExpirationSeconds | std.number.Integer | optional,
            signerName | String
          },
      oneOf."324" =
        {
            lastProbeTime | refs.oneOf."719" | String | optional,
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            observedGeneration | std.number.Integer | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."325" =
        {
            nameservers | Array String | optional,
            options
              | Array (std.contract.Sequence [ refs.oneOf."326", { _ | Dyn } ])
              | optional,
            searches | Array String | optional
          },
      oneOf."326" = { name | String | optional, value | String | optional },
      oneOf."327" =
        {
            requestMappings
              | Array (std.contract.Sequence [ refs.oneOf."218", { _ | Dyn } ]),
            resourceClaimName | String
          },
      oneOf."328" = { ip | String },
      oneOf."33" =
        {
            matchResources | refs.oneOf."29" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."39" | { _ | Dyn } | optional,
            policyName | String | optional
          },
      oneOf."330" = { name | String },
      oneOf."331" = { conditionType | String },
      oneOf."332" =
        {
            name | String,
            resourceClaimName | String | optional,
            resourceClaimTemplateName | String | optional
          },
      oneOf."333" = { name | String, resourceClaimName | String | optional },
      oneOf."334" = { name | String },
      oneOf."335" =
        {
            appArmorProfile | refs.oneOf."192" | { _ | Dyn } | optional,
            fsGroup | std.number.Integer | optional,
            fsGroupChangePolicy | String | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxChangePolicy | String | optional,
            seLinuxOptions | refs.oneOf."363" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."368" | { _ | Dyn } | optional,
            supplementalGroups | Array std.number.Integer | optional,
            supplementalGroupsPolicy | String | optional,
            sysctls
              | Array (std.contract.Sequence [ refs.oneOf."389", { _ | Dyn } ])
              | optional,
            windowsOptions | refs.oneOf."407" | { _ | Dyn } | optional
          },
      oneOf."336" =
        {
            activeDeadlineSeconds | std.number.Integer | optional,
            affinity | refs.oneOf."191" | { _ | Dyn } | optional,
            automountServiceAccountToken | Bool | optional,
            containers
              | Array (std.contract.Sequence [ refs.oneOf."217", { _ | Dyn } ]),
            dnsConfig | refs.oneOf."325" | { _ | Dyn } | optional,
            dnsPolicy | String | optional,
            enableServiceLinks | Bool | optional,
            ephemeralContainers
              | Array (std.contract.Sequence [ refs.oneOf."243", { _ | Dyn } ])
              | optional,
            hostAliases
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
              | optional,
            hostIPC | Bool | optional,
            hostNetwork | Bool | optional,
            hostPID | Bool | optional,
            hostUsers | Bool | optional,
            hostname | String | optional,
            hostnameOverride | String | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."278", { _ | Dyn } ])
              | optional,
            initContainers
              | Array (std.contract.Sequence [ refs.oneOf."217", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | { _ | String } | optional,
            os | refs.oneOf."330" | { _ | Dyn } | optional,
            overhead | { _ | refs.oneOf."695" } | optional,
            preemptionPolicy | String | optional,
            "priority" | std.number.Integer | optional,
            priorityClassName | String | optional,
            readinessGates
              | Array (std.contract.Sequence [ refs.oneOf."331", { _ | Dyn } ])
              | optional,
            resourceClaims
              | Array (std.contract.Sequence [ refs.oneOf."332", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."361" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            runtimeClassName | String | optional,
            schedulerName | String | optional,
            schedulingGates
              | Array (std.contract.Sequence [ refs.oneOf."334", { _ | Dyn } ])
              | optional,
            securityContext | refs.oneOf."335" | { _ | Dyn } | optional,
            serviceAccount | String | optional,
            serviceAccountName | String | optional,
            setHostnameAsFQDN | Bool | optional,
            shareProcessNamespace | Bool | optional,
            subdomain | String | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."392", { _ | Dyn } ])
              | optional,
            topologySpreadConstraints
              | Array (std.contract.Sequence [ refs.oneOf."395", { _ | Dyn } ])
              | optional,
            volumes
              | Array (std.contract.Sequence [ refs.oneOf."398", { _ | Dyn } ])
              | optional
          },
      oneOf."337" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."324", { _ | Dyn } ])
              | optional,
            containerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."228", { _ | Dyn } ])
              | optional,
            ephemeralContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."228", { _ | Dyn } ])
              | optional,
            extendedResourceClaimStatus
              | refs.oneOf."327"
              | { _ | Dyn }
              | optional,
            hostIP | String | optional,
            hostIPs
              | Array (std.contract.Sequence [ refs.oneOf."263", { _ | Dyn } ])
              | optional,
            initContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."228", { _ | Dyn } ])
              | optional,
            message | String | optional,
            nominatedNodeName | String | optional,
            observedGeneration | std.number.Integer | optional,
            phase | String | optional,
            podIP | String | optional,
            podIPs
              | Array (std.contract.Sequence [ refs.oneOf."328", { _ | Dyn } ])
              | optional,
            qosClass | String | optional,
            reason | String | optional,
            resize | String | optional,
            resourceClaimStatuses
              | Array (std.contract.Sequence [ refs.oneOf."333", { _ | Dyn } ])
              | optional,
            startTime | refs.oneOf."719" | String | optional
          },
      oneOf."338" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodTemplate |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            template | refs.oneOf."340" | { _ | Dyn } | optional
          },
      oneOf."340" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."336" | { _ | Dyn } | optional
          },
      oneOf."341" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."342" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."343" =
        {
            preference | refs.oneOf."300" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."344" =
        {
            exec | refs.oneOf."249" | { _ | Dyn } | optional,
            failureThreshold | std.number.Integer | optional,
            grpc | refs.oneOf."256" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."260" | { _ | Dyn } | optional,
            initialDelaySeconds | std.number.Integer | optional,
            periodSeconds | std.number.Integer | optional,
            successThreshold | std.number.Integer | optional,
            tcpSocket | refs.oneOf."390" | { _ | Dyn } | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."345" =
        {
            defaultMode | std.number.Integer | optional,
            sources
              | Array (std.contract.Sequence [ refs.oneOf."403", { _ | Dyn } ])
              | optional
          },
      oneOf."346" =
        {
            group | String | optional,
            readOnly | Bool | optional,
            registry | String,
            tenant | String | optional,
            user | String | optional,
            volume | String
          },
      oneOf."347" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."348" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."349" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ReplicationController |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."352" | { _ | Dyn } | optional,
            status | refs.oneOf."353" | { _ | Dyn } | optional
          },
      oneOf."35" =
        {
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."28", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."29" | { _ | Dyn } | optional,
            mutations
              | Array (std.contract.Sequence [ refs.oneOf."36", { _ | Dyn } ])
              | optional,
            paramKind | refs.oneOf."38" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."40", { _ | Dyn } ])
              | optional
          },
      oneOf."350" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."352" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | { _ | String } | optional,
            template | refs.oneOf."340" | { _ | Dyn } | optional
          },
      oneOf."353" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."350", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer
          },
      oneOf."354" = { name | String, request | String | optional },
      oneOf."355" =
        {
            containerName | String | optional,
            divisor | refs.oneOf."695" | optional,
            resource | String
          },
      oneOf."356" = { health | String | optional, resourceID | String },
      oneOf."357" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceQuota |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."359" | { _ | Dyn } | optional,
            status | refs.oneOf."360" | { _ | Dyn } | optional
          },
      oneOf."359" =
        {
            hard | { _ | refs.oneOf."695" } | optional,
            scopeSelector | refs.oneOf."366" | { _ | Dyn } | optional,
            scopes | Array String | optional
          },
      oneOf."36" =
        {
            applyConfiguration | refs.oneOf."26" | { _ | Dyn } | optional,
            jsonPatch | refs.oneOf."27" | { _ | Dyn } | optional,
            patchType | String
          },
      oneOf."360" =
        {
            hard | { _ | refs.oneOf."695" } | optional,
            used | { _ | refs.oneOf."695" } | optional
          },
      oneOf."361" =
        {
            claims
              | Array (std.contract.Sequence [ refs.oneOf."354", { _ | Dyn } ])
              | optional,
            limits | { _ | refs.oneOf."695" } | optional,
            requests | { _ | refs.oneOf."695" } | optional
          },
      oneOf."362" =
        {
            name | String,
            resources
              | Array (std.contract.Sequence [ refs.oneOf."356", { _ | Dyn } ])
              | optional
          },
      oneOf."363" =
        {
            level | String | optional,
            role | String | optional,
            type | String | optional,
            user | String | optional
          },
      oneOf."364" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."374" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."365" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."366" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."367", { _ | Dyn } ])
              | optional
          },
      oneOf."367" =
        {
            operator | String,
            scopeName | String,
            values | Array String | optional
          },
      oneOf."368" = { localhostProfile | String | optional, type | String },
      oneOf."369" =
        {
            apiVersion | String | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'Secret |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            stringData | { _ | String } | optional,
            type | String | optional
          },
      oneOf."37" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."370" = { name | String | optional, "optional" | Bool | optional },
      oneOf."371" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."373" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."374" = { name | String | optional, namespace | String | optional },
      oneOf."375" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            "optional" | Bool | optional,
            secretName | String | optional
          },
      oneOf."376" =
        {
            allowPrivilegeEscalation | Bool | optional,
            appArmorProfile | refs.oneOf."192" | { _ | Dyn } | optional,
            capabilities | refs.oneOf."200" | { _ | Dyn } | optional,
            privileged | Bool | optional,
            procMount | String | optional,
            readOnlyRootFilesystem | Bool | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxOptions | refs.oneOf."363" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."368" | { _ | Dyn } | optional,
            windowsOptions | refs.oneOf."407" | { _ | Dyn } | optional
          },
      oneOf."377" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Service |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."383" | { _ | Dyn } | optional,
            status | refs.oneOf."384" | { _ | Dyn } | optional
          },
      oneOf."378" =
        {
            apiVersion | String | optional,
            automountServiceAccountToken | Bool | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."278", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ServiceAccount |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            secrets
              | Array (std.contract.Sequence [ refs.oneOf."306", { _ | Dyn } ])
              | optional
          },
      oneOf."38" = { apiVersion | String | optional, kind | String | optional },
      oneOf."380" =
        {
            audience | String | optional,
            expirationSeconds | std.number.Integer | optional,
            path | String
          },
      oneOf."382" =
        {
            appProtocol | String | optional,
            name | String | optional,
            nodePort | std.number.Integer | optional,
            port | std.number.Integer,
            protocol | String | optional,
            targetPort | refs.oneOf."722" | optional
          },
      oneOf."383" =
        {
            allocateLoadBalancerNodePorts | Bool | optional,
            clusterIP | String | optional,
            clusterIPs | Array String | optional,
            externalIPs | Array String | optional,
            externalName | String | optional,
            externalTrafficPolicy | String | optional,
            healthCheckNodePort | std.number.Integer | optional,
            internalTrafficPolicy | String | optional,
            ipFamilies | Array String | optional,
            ipFamilyPolicy | String | optional,
            loadBalancerClass | String | optional,
            loadBalancerIP | String | optional,
            loadBalancerSourceRanges | Array String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."382", { _ | Dyn } ])
              | optional,
            publishNotReadyAddresses | Bool | optional,
            selector | { _ | String } | optional,
            sessionAffinity | String | optional,
            sessionAffinityConfig | refs.oneOf."385" | { _ | Dyn } | optional,
            trafficDistribution | String | optional,
            type | String | optional
          },
      oneOf."384" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            loadBalancer | refs.oneOf."277" | { _ | Dyn } | optional
          },
      oneOf."385" = { clientIP | refs.oneOf."205" | { _ | Dyn } | optional },
      oneOf."386" = { seconds | std.number.Integer },
      oneOf."387" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."306" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."388" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."278" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."389" = { name | String, value | String },
      oneOf."39" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional
          },
      oneOf."390" = { host | String | optional, port | refs.oneOf."722" },
      oneOf."391" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."719" | String | optional,
            value | String | optional
          },
      oneOf."392" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."393" = { key | String, values | Array String },
      oneOf."394" =
        {
            matchLabelExpressions
              | Array (std.contract.Sequence [ refs.oneOf."393", { _ | Dyn } ])
              | optional
          },
      oneOf."395" =
        {
            labelSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            maxSkew | std.number.Integer,
            minDomains | std.number.Integer | optional,
            nodeAffinityPolicy | String | optional,
            nodeTaintsPolicy | String | optional,
            topologyKey | String,
            whenUnsatisfiable | String
          },
      oneOf."396" =
        { apiGroup | String | optional, kind | String, name | String },
      oneOf."397" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."398" =
        {
            awsElasticBlockStore | refs.oneOf."190" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."194" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."196" | { _ | Dyn } | optional,
            cephfs | refs.oneOf."202" | { _ | Dyn } | optional,
            cinder | refs.oneOf."204" | { _ | Dyn } | optional,
            configMap | refs.oneOf."216" | { _ | Dyn } | optional,
            csi | refs.oneOf."199" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."233" | { _ | Dyn } | optional,
            emptyDir | refs.oneOf."234" | { _ | Dyn } | optional,
            ephemeral | refs.oneOf."244" | { _ | Dyn } | optional,
            fc | refs.oneOf."250" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."253" | { _ | Dyn } | optional,
            flocker | refs.oneOf."254" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."255" | { _ | Dyn } | optional,
            gitRepo | refs.oneOf."257" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."259" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."264" | { _ | Dyn } | optional,
            image | refs.oneOf."267" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."266" | { _ | Dyn } | optional,
            name | String,
            nfs | refs.oneOf."281" | { _ | Dyn } | optional,
            persistentVolumeClaim | refs.oneOf."314" | { _ | Dyn } | optional,
            photonPersistentDisk | refs.oneOf."318" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."342" | { _ | Dyn } | optional,
            projected | refs.oneOf."345" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."346" | { _ | Dyn } | optional,
            rbd | refs.oneOf."348" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."365" | { _ | Dyn } | optional,
            secret | refs.oneOf."375" | { _ | Dyn } | optional,
            storageos | refs.oneOf."388" | { _ | Dyn } | optional,
            vsphereVolume | refs.oneOf."405" | { _ | Dyn } | optional
          },
      oneOf."399" = { devicePath | String, name | String },
      oneOf."4" =
        {
            admissionReviewVersions | Array String,
            clientConfig | refs.oneOf."25" | { _ | Dyn },
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            name | String,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."40" = { expression | String, name | String },
      oneOf."400" =
        {
            mountPath | String,
            mountPropagation | String | optional,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional,
            subPath | String | optional,
            subPathExpr | String | optional
          },
      oneOf."401" =
        {
            mountPath | String,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional
          },
      oneOf."402" = { required | refs.oneOf."298" | { _ | Dyn } | optional },
      oneOf."403" =
        {
            clusterTrustBundle | refs.oneOf."206" | { _ | Dyn } | optional,
            configMap | refs.oneOf."215" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."231" | { _ | Dyn } | optional,
            podCertificate | refs.oneOf."323" | { _ | Dyn } | optional,
            secret | refs.oneOf."373" | { _ | Dyn } | optional,
            serviceAccountToken | refs.oneOf."380" | { _ | Dyn } | optional
          },
      oneOf."404" =
        {
            limits | { _ | refs.oneOf."695" } | optional,
            requests | { _ | refs.oneOf."695" } | optional
          },
      oneOf."405" =
        {
            fsType | String | optional,
            storagePolicyID | String | optional,
            storagePolicyName | String | optional,
            volumePath | String
          },
      oneOf."406" =
        {
            podAffinityTerm | refs.oneOf."321" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."407" =
        {
            gmsaCredentialSpec | String | optional,
            gmsaCredentialSpecName | String | optional,
            hostProcess | Bool | optional,
            runAsUserName | String | optional
          },
      oneOf."408" =
        {
            addresses | Array String,
            conditions | refs.oneOf."409" | { _ | Dyn } | optional,
            deprecatedTopology | { _ | String } | optional,
            hints | refs.oneOf."410" | { _ | Dyn } | optional,
            hostname | String | optional,
            nodeName | String | optional,
            targetRef | refs.oneOf."306" | { _ | Dyn } | optional,
            zone | String | optional
          },
      oneOf."409" =
        {
            ready | Bool | optional,
            serving | Bool | optional,
            terminating | Bool | optional
          },
      oneOf."41" = { expression | String | optional },
      oneOf."410" =
        {
            forNodes
              | Array (std.contract.Sequence [ refs.oneOf."414", { _ | Dyn } ])
              | optional,
            forZones
              | Array (std.contract.Sequence [ refs.oneOf."415", { _ | Dyn } ])
              | optional
          },
      oneOf."411" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer | optional,
            protocol | String | optional
          },
      oneOf."412" =
        {
            addressType | String,
            apiVersion | String | optional,
            endpoints
              | Array (std.contract.Sequence [ refs.oneOf."408", { _ | Dyn } ]),
            kind | std.enum.TagOrString | [| 'EndpointSlice |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."411", { _ | Dyn } ])
              | optional
          },
      oneOf."414" = { name | String },
      oneOf."415" = { name | String },
      oneOf."416" =
        {
            action | String | optional,
            apiVersion | String | optional,
            deprecatedCount | std.number.Integer | optional,
            deprecatedFirstTimestamp | refs.oneOf."719" | String | optional,
            deprecatedLastTimestamp | refs.oneOf."719" | String | optional,
            deprecatedSource | refs.oneOf."248" | { _ | Dyn } | optional,
            eventTime | refs.oneOf."710" | String,
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            note | String | optional,
            reason | String | optional,
            regarding | refs.oneOf."306" | { _ | Dyn } | optional,
            related | refs.oneOf."306" | { _ | Dyn } | optional,
            reportingController | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."418" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."418" =
        {
            count | std.number.Integer,
            lastObservedTime | refs.oneOf."710" | String
          },
      oneOf."419" =
        {
            lendablePercent | std.number.Integer | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."42" = { expression | String | optional },
      oneOf."420" = { type | String },
      oneOf."421" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'FlowSchema |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."424" | { _ | Dyn } | optional,
            status | refs.oneOf."425" | { _ | Dyn } | optional
          },
      oneOf."422" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."424" =
        {
            distinguisherMethod | refs.oneOf."420" | { _ | Dyn } | optional,
            matchingPrecedence | std.number.Integer | optional,
            priorityLevelConfiguration | refs.oneOf."434" | { _ | Dyn },
            rules
              | Array (std.contract.Sequence [ refs.oneOf."430", { _ | Dyn } ])
              | optional
          },
      oneOf."425" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."422", { _ | Dyn } ])
              | optional
          },
      oneOf."426" = { name | String },
      oneOf."427" =
        { queuing | refs.oneOf."437" | { _ | Dyn } | optional, type | String },
      oneOf."428" =
        {
            borrowingLimitPercent | std.number.Integer | optional,
            lendablePercent | std.number.Integer | optional,
            limitResponse | refs.oneOf."427" | { _ | Dyn } | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."429" = { nonResourceURLs | Array String, verbs | Array String },
      oneOf."43" = { expression | String, name | String },
      oneOf."430" =
        {
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."429", { _ | Dyn } ])
              | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."438", { _ | Dyn } ])
              | optional,
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."440", { _ | Dyn } ])
          },
      oneOf."431" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PriorityLevelConfiguration |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."435" | { _ | Dyn } | optional,
            status | refs.oneOf."436" | { _ | Dyn } | optional
          },
      oneOf."432" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."434" = { name | String },
      oneOf."435" =
        {
            exempt | refs.oneOf."419" | { _ | Dyn } | optional,
            limited | refs.oneOf."428" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."436" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."432", { _ | Dyn } ])
              | optional
          },
      oneOf."437" =
        {
            handSize | std.number.Integer | optional,
            queueLengthLimit | std.number.Integer | optional,
            queues | std.number.Integer | optional
          },
      oneOf."438" =
        {
            apiGroups | Array String,
            clusterScope | Bool | optional,
            namespaces | Array String | optional,
            resources | Array String,
            verbs | Array String
          },
      oneOf."439" = { name | String, namespace | String },
      oneOf."44" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."52", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."52", { _ | Dyn } ])
              | optional
          },
      oneOf."440" =
        {
            group | refs.oneOf."426" | { _ | Dyn } | optional,
            kind | String,
            serviceAccount | refs.oneOf."439" | { _ | Dyn } | optional,
            user | refs.oneOf."441" | { _ | Dyn } | optional
          },
      oneOf."441" = { name | String },
      oneOf."442" =
        {
            backend | refs.oneOf."449" | { _ | Dyn },
            path | String | optional,
            pathType | String
          },
      oneOf."443" =
        {
            paths
              | Array (std.contract.Sequence [ refs.oneOf."442", { _ | Dyn } ])
          },
      oneOf."444" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IPAddress |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."446" | { _ | Dyn } | optional
          },
      oneOf."446" = { parentRef | refs.oneOf."470" | { _ | Dyn } },
      oneOf."447" = { cidr | String, except | Array String | optional },
      oneOf."448" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Ingress |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."460" | { _ | Dyn } | optional,
            status | refs.oneOf."461" | { _ | Dyn } | optional
          },
      oneOf."449" =
        {
            resource | refs.oneOf."396" | { _ | Dyn } | optional,
            service | refs.oneOf."459" | { _ | Dyn } | optional
          },
      oneOf."45" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."50" | { _ | Dyn } | optional
          },
      oneOf."450" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IngressClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."453" | { _ | Dyn } | optional
          },
      oneOf."452" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional,
            scope | String | optional
          },
      oneOf."453" =
        {
            controller | String | optional,
            parameters | refs.oneOf."452" | { _ | Dyn } | optional
          },
      oneOf."455" =
        {
            hostname | String | optional,
            ip | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."457", { _ | Dyn } ])
              | optional
          },
      oneOf."456" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."455", { _ | Dyn } ])
              | optional
          },
      oneOf."457" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."458" =
        {
            host | String | optional,
            http | refs.oneOf."443" | { _ | Dyn } | optional
          },
      oneOf."459" =
        { name | String, port | refs.oneOf."471" | { _ | Dyn } | optional },
      oneOf."46" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."48" | { _ | Dyn } | optional
          },
      oneOf."460" =
        {
            defaultBackend | refs.oneOf."449" | { _ | Dyn } | optional,
            ingressClassName | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."458", { _ | Dyn } ])
              | optional,
            tls
              | Array (std.contract.Sequence [ refs.oneOf."462", { _ | Dyn } ])
              | optional
          },
      oneOf."461" =
        { loadBalancer | refs.oneOf."456" | { _ | Dyn } | optional },
      oneOf."462" =
        { hosts | Array String | optional, secretName | String | optional },
      oneOf."463" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'NetworkPolicy |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."469" | { _ | Dyn } | optional
          },
      oneOf."464" =
        {
            ports
              | Array (std.contract.Sequence [ refs.oneOf."468", { _ | Dyn } ])
              | optional,
            to
              | Array (std.contract.Sequence [ refs.oneOf."467", { _ | Dyn } ])
              | optional
          },
      oneOf."465" =
        {
            from
              | Array (std.contract.Sequence [ refs.oneOf."467", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."468", { _ | Dyn } ])
              | optional
          },
      oneOf."467" =
        {
            ipBlock | refs.oneOf."447" | { _ | Dyn } | optional,
            namespaceSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            podSelector | refs.oneOf."706" | { _ | Dyn } | optional
          },
      oneOf."468" =
        {
            endPort | std.number.Integer | optional,
            port | refs.oneOf."722" | optional,
            protocol | String | optional
          },
      oneOf."469" =
        {
            egress
              | Array (std.contract.Sequence [ refs.oneOf."464", { _ | Dyn } ])
              | optional,
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."465", { _ | Dyn } ])
              | optional,
            podSelector | refs.oneOf."706" | { _ | Dyn } | optional,
            policyTypes | Array String | optional
          },
      oneOf."470" =
        {
            group | String | optional,
            name | String,
            namespace | String | optional,
            resource | String
          },
      oneOf."471" =
        { name | String | optional, number | std.number.Integer | optional },
      oneOf."472" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ServiceCIDR |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."474" | { _ | Dyn } | optional,
            status | refs.oneOf."475" | { _ | Dyn } | optional
          },
      oneOf."474" = { cidrs | Array String | optional },
      oneOf."475" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional
          },
      oneOf."476" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IPAddress |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."478" | { _ | Dyn } | optional
          },
      oneOf."478" = { parentRef | refs.oneOf."479" | { _ | Dyn } },
      oneOf."479" =
        {
            group | String | optional,
            name | String,
            namespace | String | optional,
            resource | String
          },
      oneOf."48" =
        {
            matchResources | refs.oneOf."44" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."54" | { _ | Dyn } | optional,
            policyName | String | optional
          },
      oneOf."480" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ServiceCIDR |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."482" | { _ | Dyn } | optional,
            status | refs.oneOf."483" | { _ | Dyn } | optional
          },
      oneOf."482" = { cidrs | Array String | optional },
      oneOf."483" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional
          },
      oneOf."484" = { podFixed | { _ | refs.oneOf."695" } | optional },
      oneOf."485" =
        {
            apiVersion | String | optional,
            handler | String,
            kind | std.enum.TagOrString | [| 'RuntimeClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            overhead | refs.oneOf."484" | { _ | Dyn } | optional,
            scheduling | refs.oneOf."487" | { _ | Dyn } | optional
          },
      oneOf."487" =
        {
            nodeSelector | { _ | String } | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."392", { _ | Dyn } ])
              | optional
          },
      oneOf."489" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodDisruptionBudget |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."491" | { _ | Dyn } | optional,
            status | refs.oneOf."492" | { _ | Dyn } | optional
          },
      oneOf."491" =
        {
            maxUnavailable | refs.oneOf."722" | optional,
            minAvailable | refs.oneOf."722" | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional,
            unhealthyPodEvictionPolicy | String | optional
          },
      oneOf."492" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            currentHealthy | std.number.Integer,
            desiredHealthy | std.number.Integer,
            disruptedPods
              | { _ | std.contract.Sequence [ refs.oneOf."719", String ] }
              | optional,
            disruptionsAllowed | std.number.Integer,
            expectedPods | std.number.Integer,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."493" =
        {
            clusterRoleSelectors
              | Array (std.contract.Sequence [ refs.oneOf."706", { _ | Dyn } ])
              | optional
          },
      oneOf."494" =
        {
            aggregationRule | refs.oneOf."493" | { _ | Dyn } | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRole |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."498", { _ | Dyn } ])
              | optional
          },
      oneOf."495" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRoleBinding |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."503" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."504", { _ | Dyn } ])
              | optional
          },
      oneOf."498" =
        {
            apiGroups | Array String | optional,
            nonResourceURLs | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."499" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Role |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."498", { _ | Dyn } ])
              | optional
          },
      oneOf."5" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."4", { _ | Dyn } ])
              | optional
          },
      oneOf."50" =
        {
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."43", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."44" | { _ | Dyn } | optional,
            mutations
              | Array (std.contract.Sequence [ refs.oneOf."51", { _ | Dyn } ])
              | optional,
            paramKind | refs.oneOf."53" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."55", { _ | Dyn } ])
              | optional
          },
      oneOf."500" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'RoleBinding |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."503" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."504", { _ | Dyn } ])
              | optional
          },
      oneOf."503" = { apiGroup | String, kind | String, name | String },
      oneOf."504" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."505" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."721" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."533" | { _ | Dyn } | optional,
            pool | String,
            shareID | String | optional
          },
      oneOf."506" =
        {
            allocationTimestamp | refs.oneOf."719" | String | optional,
            devices | refs.oneOf."515" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional
          },
      oneOf."507" = { expression | String },
      oneOf."508" =
        {
            "default" | refs.oneOf."695" | optional,
            validRange | refs.oneOf."509" | { _ | Dyn } | optional,
            validValues | Array refs.oneOf."695" | optional
          },
      oneOf."509" =
        {
            max | refs.oneOf."695" | optional,
            min | refs.oneOf."695",
            step | refs.oneOf."695" | optional
          },
      oneOf."51" =
        {
            applyConfiguration | refs.oneOf."41" | { _ | Dyn } | optional,
            jsonPatch | refs.oneOf."42" | { _ | Dyn } | optional,
            patchType | String
          },
      oneOf."510" = { requests | { _ | refs.oneOf."695" } | optional },
      oneOf."511" = { value | refs.oneOf."695" },
      oneOf."512" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."511", { _ | Dyn } ] },
            name | String
          },
      oneOf."513" =
        {
            allNodes | Bool | optional,
            allowMultipleAllocations | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."516", { _ | Dyn } ] }
              | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            bindsToNode | Bool | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."517", { _ | Dyn } ] }
              | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."525", { _ | Dyn } ])
              | optional,
            name | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."530", { _ | Dyn } ])
              | optional
          },
      oneOf."514" =
        {
            opaque | refs.oneOf."534" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."515" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."514", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."527", { _ | Dyn } ])
              | optional
          },
      oneOf."516" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."517" =
        {
            requestPolicy | refs.oneOf."508" | { _ | Dyn } | optional,
            value | refs.oneOf."695"
          },
      oneOf."518" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."519", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."524", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."526", { _ | Dyn } ])
              | optional
          },
      oneOf."519" =
        {
            opaque | refs.oneOf."534" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."52" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."520" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."523" | { _ | Dyn }
          },
      oneOf."521" = { opaque | refs.oneOf."534" | { _ | Dyn } | optional },
      oneOf."523" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."521", { _ | Dyn } ])
              | optional,
            extendedResourceName | String | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."528", { _ | Dyn } ])
              | optional
          },
      oneOf."524" =
        {
            distinctAttribute | String | optional,
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."525" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."511", { _ | Dyn } ] }
          },
      oneOf."526" =
        {
            exactly | refs.oneOf."532" | { _ | Dyn } | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."529", { _ | Dyn } ])
              | optional,
            name | String
          },
      oneOf."527" =
        {
            adminAccess | Bool | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            consumedCapacity | { _ | refs.oneOf."695" } | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            shareID | String | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."531", { _ | Dyn } ])
              | optional
          },
      oneOf."528" = { cel | refs.oneOf."507" | { _ | Dyn } | optional },
      oneOf."529" =
        {
            allocationMode | String | optional,
            capacity | refs.oneOf."510" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."528", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."531", { _ | Dyn } ])
              | optional
          },
      oneOf."53" = { apiVersion | String | optional, kind | String | optional },
      oneOf."530" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."719" | String | optional,
            value | String | optional
          },
      oneOf."531" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."532" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            capacity | refs.oneOf."510" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."528", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."531", { _ | Dyn } ])
              | optional
          },
      oneOf."533" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."534" =
        { driver | String, parameters | refs.oneOf."721" | { _ | Dyn } },
      oneOf."535" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."538" | { _ | Dyn },
            status | refs.oneOf."539" | { _ | Dyn } | optional
          },
      oneOf."536" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."538" = { devices | refs.oneOf."518" | { _ | Dyn } | optional },
      oneOf."539" =
        {
            allocation | refs.oneOf."506" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."505", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."536", { _ | Dyn } ])
              | optional
          },
      oneOf."54" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional
          },
      oneOf."540" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."542" | { _ | Dyn }
          },
      oneOf."542" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."538" | { _ | Dyn }
          },
      oneOf."543" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."544" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."546" | { _ | Dyn }
          },
      oneOf."546" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."513", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."543" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."512", { _ | Dyn } ])
              | optional
          },
      oneOf."547" = { expression | String },
      oneOf."548" = { cel | refs.oneOf."547" | { _ | Dyn } | optional },
      oneOf."549" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."719" | String | optional,
            value | String | optional
          },
      oneOf."55" = { expression | String, name | String },
      oneOf."550" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceTaintRule |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."552" | { _ | Dyn }
          },
      oneOf."552" =
        {
            deviceSelector | refs.oneOf."553" | { _ | Dyn } | optional,
            taint | refs.oneOf."549" | { _ | Dyn }
          },
      oneOf."553" =
        {
            device | String | optional,
            deviceClassName | String | optional,
            driver | String | optional,
            pool | String | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."548", { _ | Dyn } ])
              | optional
          },
      oneOf."554" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."721" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."582" | { _ | Dyn } | optional,
            pool | String,
            shareID | String | optional
          },
      oneOf."555" =
        {
            allocationTimestamp | refs.oneOf."719" | String | optional,
            devices | refs.oneOf."565" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional
          },
      oneOf."556" =
        {
            allNodes | Bool | optional,
            allowMultipleAllocations | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."566", { _ | Dyn } ] }
              | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            bindsToNode | Bool | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."567", { _ | Dyn } ] }
              | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."575", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."580", { _ | Dyn } ])
              | optional
          },
      oneOf."557" = { expression | String },
      oneOf."558" =
        {
            "default" | refs.oneOf."695" | optional,
            validRange | refs.oneOf."559" | { _ | Dyn } | optional,
            validValues | Array refs.oneOf."695" | optional
          },
      oneOf."559" =
        {
            max | refs.oneOf."695" | optional,
            min | refs.oneOf."695",
            step | refs.oneOf."695" | optional
          },
      oneOf."56" =
        {
            apiServerID | String | optional,
            decodableVersions | Array String | optional,
            encodingVersion | String | optional,
            servedVersions | Array String | optional
          },
      oneOf."560" = { requests | { _ | refs.oneOf."695" } | optional },
      oneOf."561" = { value | refs.oneOf."695" },
      oneOf."562" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."561", { _ | Dyn } ] },
            name | String
          },
      oneOf."563" =
        { basic | refs.oneOf."556" | { _ | Dyn } | optional, name | String },
      oneOf."564" =
        {
            opaque | refs.oneOf."583" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."565" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."564", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."577", { _ | Dyn } ])
              | optional
          },
      oneOf."566" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."567" =
        {
            requestPolicy | refs.oneOf."558" | { _ | Dyn } | optional,
            value | refs.oneOf."695"
          },
      oneOf."568" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."569", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."574", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."576", { _ | Dyn } ])
              | optional
          },
      oneOf."569" =
        {
            opaque | refs.oneOf."583" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."57" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageVersion |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."60" | { _ | Dyn },
            status | refs.oneOf."61" | { _ | Dyn }
          },
      oneOf."570" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."573" | { _ | Dyn }
          },
      oneOf."571" = { opaque | refs.oneOf."583" | { _ | Dyn } | optional },
      oneOf."573" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."571", { _ | Dyn } ])
              | optional,
            extendedResourceName | String | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."578", { _ | Dyn } ])
              | optional
          },
      oneOf."574" =
        {
            distinctAttribute | String | optional,
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."575" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."561", { _ | Dyn } ] }
          },
      oneOf."576" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            capacity | refs.oneOf."560" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."579", { _ | Dyn } ])
              | optional,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."578", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."581", { _ | Dyn } ])
              | optional
          },
      oneOf."577" =
        {
            adminAccess | Bool | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            consumedCapacity | { _ | refs.oneOf."695" } | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            shareID | String | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."581", { _ | Dyn } ])
              | optional
          },
      oneOf."578" = { cel | refs.oneOf."557" | { _ | Dyn } | optional },
      oneOf."579" =
        {
            allocationMode | String | optional,
            capacity | refs.oneOf."560" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."578", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."581", { _ | Dyn } ])
              | optional
          },
      oneOf."58" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."580" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."719" | String | optional,
            value | String | optional
          },
      oneOf."581" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."582" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."583" =
        { driver | String, parameters | refs.oneOf."721" | { _ | Dyn } },
      oneOf."584" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."587" | { _ | Dyn },
            status | refs.oneOf."588" | { _ | Dyn } | optional
          },
      oneOf."585" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."587" = { devices | refs.oneOf."568" | { _ | Dyn } | optional },
      oneOf."588" =
        {
            allocation | refs.oneOf."555" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."554", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."585", { _ | Dyn } ])
              | optional
          },
      oneOf."589" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."591" | { _ | Dyn }
          },
      oneOf."591" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."587" | { _ | Dyn }
          },
      oneOf."592" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."593" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."595" | { _ | Dyn }
          },
      oneOf."595" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."563", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."592" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."562", { _ | Dyn } ])
              | optional
          },
      oneOf."596" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."701", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."721" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."624" | { _ | Dyn } | optional,
            pool | String,
            shareID | String | optional
          },
      oneOf."597" =
        {
            allocationTimestamp | refs.oneOf."719" | String | optional,
            devices | refs.oneOf."606" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional
          },
      oneOf."598" = { expression | String },
      oneOf."599" =
        {
            "default" | refs.oneOf."695" | optional,
            validRange | refs.oneOf."600" | { _ | Dyn } | optional,
            validValues | Array refs.oneOf."695" | optional
          },
      oneOf."60" = { _ | Dyn },
      oneOf."600" =
        {
            max | refs.oneOf."695" | optional,
            min | refs.oneOf."695",
            step | refs.oneOf."695" | optional
          },
      oneOf."601" = { requests | { _ | refs.oneOf."695" } | optional },
      oneOf."602" = { value | refs.oneOf."695" },
      oneOf."603" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."602", { _ | Dyn } ] },
            name | String
          },
      oneOf."604" =
        {
            allNodes | Bool | optional,
            allowMultipleAllocations | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."607", { _ | Dyn } ] }
              | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            bindsToNode | Bool | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."608", { _ | Dyn } ] }
              | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."616", { _ | Dyn } ])
              | optional,
            name | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."621", { _ | Dyn } ])
              | optional
          },
      oneOf."605" =
        {
            opaque | refs.oneOf."625" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."606" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."605", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."618", { _ | Dyn } ])
              | optional
          },
      oneOf."607" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."608" =
        {
            requestPolicy | refs.oneOf."599" | { _ | Dyn } | optional,
            value | refs.oneOf."695"
          },
      oneOf."609" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."610", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."615", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."617", { _ | Dyn } ])
              | optional
          },
      oneOf."61" =
        {
            commonEncodingVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."58", { _ | Dyn } ])
              | optional,
            storageVersions
              | Array (std.contract.Sequence [ refs.oneOf."56", { _ | Dyn } ])
              | optional
          },
      oneOf."610" =
        {
            opaque | refs.oneOf."625" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."611" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."614" | { _ | Dyn }
          },
      oneOf."612" = { opaque | refs.oneOf."625" | { _ | Dyn } | optional },
      oneOf."614" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."612", { _ | Dyn } ])
              | optional,
            extendedResourceName | String | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."619", { _ | Dyn } ])
              | optional
          },
      oneOf."615" =
        {
            distinctAttribute | String | optional,
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."616" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."602", { _ | Dyn } ] }
          },
      oneOf."617" =
        {
            exactly | refs.oneOf."623" | { _ | Dyn } | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."620", { _ | Dyn } ])
              | optional,
            name | String
          },
      oneOf."618" =
        {
            adminAccess | Bool | optional,
            bindingConditions | Array String | optional,
            bindingFailureConditions | Array String | optional,
            consumedCapacity | { _ | refs.oneOf."695" } | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            shareID | String | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."622", { _ | Dyn } ])
              | optional
          },
      oneOf."619" = { cel | refs.oneOf."598" | { _ | Dyn } | optional },
      oneOf."62" =
        {
            apiVersion | String | optional,
            data | refs.oneOf."721" | { _ | Dyn } | optional,
            kind | std.enum.TagOrString | [| 'ControllerRevision |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            revision | std.number.Integer
          },
      oneOf."620" =
        {
            allocationMode | String | optional,
            capacity | refs.oneOf."601" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."619", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."622", { _ | Dyn } ])
              | optional
          },
      oneOf."621" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."719" | String | optional,
            value | String | optional
          },
      oneOf."622" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."623" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            capacity | refs.oneOf."601" | { _ | Dyn } | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."619", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."622", { _ | Dyn } ])
              | optional
          },
      oneOf."624" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."625" =
        { driver | String, parameters | refs.oneOf."721" | { _ | Dyn } },
      oneOf."626" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."629" | { _ | Dyn },
            status | refs.oneOf."630" | { _ | Dyn } | optional
          },
      oneOf."627" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."629" = { devices | refs.oneOf."609" | { _ | Dyn } | optional },
      oneOf."630" =
        {
            allocation | refs.oneOf."597" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."596", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."627", { _ | Dyn } ])
              | optional
          },
      oneOf."631" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."633" | { _ | Dyn }
          },
      oneOf."633" =
        {
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."629" | { _ | Dyn }
          },
      oneOf."634" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."635" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."637" | { _ | Dyn }
          },
      oneOf."637" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."604", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."298" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."634" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."603", { _ | Dyn } ])
              | optional
          },
      oneOf."638" =
        {
            apiVersion | String | optional,
            description | String | optional,
            globalDefault | Bool | optional,
            kind | std.enum.TagOrString | [| 'PriorityClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            preemptionPolicy | String | optional,
            value | std.number.Integer
          },
      oneOf."64" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DaemonSet |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."67" | { _ | Dyn } | optional,
            status | refs.oneOf."68" | { _ | Dyn } | optional
          },
      oneOf."640" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSIDriver |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."642" | { _ | Dyn }
          },
      oneOf."642" =
        {
            attachRequired | Bool | optional,
            fsGroupPolicy | String | optional,
            nodeAllocatableUpdatePeriodSeconds | std.number.Integer | optional,
            podInfoOnMount | Bool | optional,
            requiresRepublish | Bool | optional,
            seLinuxMount | Bool | optional,
            storageCapacity | Bool | optional,
            tokenRequests
              | Array (std.contract.Sequence [ refs.oneOf."651", { _ | Dyn } ])
              | optional,
            volumeLifecycleModes | Array String | optional
          },
      oneOf."643" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSINode |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."646" | { _ | Dyn }
          },
      oneOf."644" =
        {
            allocatable | refs.oneOf."660" | { _ | Dyn } | optional,
            name | String,
            nodeID | String,
            topologyKeys | Array String | optional
          },
      oneOf."646" =
        {
            drivers
              | Array (std.contract.Sequence [ refs.oneOf."644", { _ | Dyn } ])
          },
      oneOf."647" =
        {
            apiVersion | String | optional,
            capacity | refs.oneOf."695" | optional,
            kind | std.enum.TagOrString | [| 'CSIStorageCapacity |] | optional,
            maximumVolumeSize | refs.oneOf."695" | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            nodeTopology | refs.oneOf."706" | { _ | Dyn } | optional,
            storageClassName | String
          },
      oneOf."649" =
        {
            allowVolumeExpansion | Bool | optional,
            allowedTopologies
              | Array (std.contract.Sequence [ refs.oneOf."394", { _ | Dyn } ])
              | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageClass |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            parameters | { _ | String } | optional,
            provisioner | String,
            reclaimPolicy | String | optional,
            volumeBindingMode | String | optional
          },
      oneOf."65" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."651" =
        {
            audience | String,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."652" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'VolumeAttachment |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."655" | { _ | Dyn },
            status | refs.oneOf."656" | { _ | Dyn } | optional
          },
      oneOf."654" =
        {
            inlineVolumeSpec | refs.oneOf."316" | { _ | Dyn } | optional,
            persistentVolumeName | String | optional
          },
      oneOf."655" =
        {
            attacher | String,
            nodeName | String,
            source | refs.oneOf."654" | { _ | Dyn }
          },
      oneOf."656" =
        {
            attachError | refs.oneOf."659" | { _ | Dyn } | optional,
            attached | Bool,
            attachmentMetadata | { _ | String } | optional,
            detachError | refs.oneOf."659" | { _ | Dyn } | optional
          },
      oneOf."657" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."659" =
        {
            errorCode | std.number.Integer | optional,
            message | String | optional,
            time | refs.oneOf."719" | String | optional
          },
      oneOf."660" = { count | std.number.Integer | optional },
      oneOf."661" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."663" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."665" =
        {
            group | String | optional,
            resource | String | optional,
            version | String | optional
          },
      oneOf."666" =
        {
            lastUpdateTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."667" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'StorageVersionMigration |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."669" | { _ | Dyn } | optional,
            status | refs.oneOf."670" | { _ | Dyn } | optional
          },
      oneOf."669" =
        {
            continueToken | String | optional,
            resource | refs.oneOf."665" | { _ | Dyn }
          },
      oneOf."67" =
        {
            minReadySeconds | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."706" | { _ | Dyn },
            template | refs.oneOf."340" | { _ | Dyn },
            updateStrategy | refs.oneOf."69" | { _ | Dyn } | optional
          },
      oneOf."670" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."666", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional
          },
      oneOf."671" =
        {
            description | String | optional,
            format | String | optional,
            jsonPath | String,
            name | String,
            "priority" | std.number.Integer | optional,
            type | String
          },
      oneOf."672" =
        {
            strategy | String,
            webhook | refs.oneOf."694" | { _ | Dyn } | optional
          },
      oneOf."673" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CustomResourceDefinition |]
              | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."677" | { _ | Dyn },
            status | refs.oneOf."678" | { _ | Dyn } | optional
          },
      oneOf."674" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."676" =
        {
            categories | Array String | optional,
            kind | String,
            listKind | String | optional,
            plural | String,
            shortNames | Array String | optional,
            singular | String | optional
          },
      oneOf."677" =
        {
            conversion | refs.oneOf."672" | { _ | Dyn } | optional,
            group | String,
            names | refs.oneOf."676" | { _ | Dyn },
            preserveUnknownFields | Bool | optional,
            scope | String,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."679", { _ | Dyn } ])
          },
      oneOf."678" =
        {
            acceptedNames | refs.oneOf."676" | { _ | Dyn } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."674", { _ | Dyn } ])
              | optional,
            storedVersions | Array String | optional
          },
      oneOf."679" =
        {
            additionalPrinterColumns
              | Array (std.contract.Sequence [ refs.oneOf."671", { _ | Dyn } ])
              | optional,
            deprecated | Bool | optional,
            deprecationWarning | String | optional,
            name | String,
            schema | refs.oneOf."683" | { _ | Dyn } | optional,
            selectableFields
              | Array (std.contract.Sequence [ refs.oneOf."690", { _ | Dyn } ])
              | optional,
            served | Bool,
            storage | Bool,
            subresources | refs.oneOf."682" | { _ | Dyn } | optional
          },
      oneOf."68" =
        {
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."65", { _ | Dyn } ])
              | optional,
            currentNumberScheduled | std.number.Integer,
            desiredNumberScheduled | std.number.Integer,
            numberAvailable | std.number.Integer | optional,
            numberMisscheduled | std.number.Integer,
            numberReady | std.number.Integer,
            numberUnavailable | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            updatedNumberScheduled | std.number.Integer | optional
          },
      oneOf."680" =
        {
            labelSelectorPath | String | optional,
            specReplicasPath | String,
            statusReplicasPath | String
          },
      oneOf."681" = { _ | Dyn },
      oneOf."682" =
        {
            scale | refs.oneOf."680" | { _ | Dyn } | optional,
            status | refs.oneOf."681" | { _ | Dyn } | optional
          },
      oneOf."683" =
        { openAPIV3Schema | refs.oneOf."686" | { _ | Dyn } | optional },
      oneOf."684" =
        { description | String | optional, url | String | optional },
      oneOf."685" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."686" =
        {
            "$ref" | String | optional,
            "$schema" | String | optional,
            additionalItems | refs.oneOf."688" | optional,
            additionalProperties | refs.oneOf."688" | optional,
            allOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            anyOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            "default" | refs.oneOf."685" | optional,
            definitions
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            dependencies | { _ | refs.oneOf."689" } | optional,
            description | String | optional,
            enum | Array refs.oneOf."685" | optional,
            example | refs.oneOf."685" | optional,
            exclusiveMaximum | Bool | optional,
            exclusiveMinimum | Bool | optional,
            externalDocs | refs.oneOf."684" | { _ | Dyn } | optional,
            format | String | optional,
            id | String | optional,
            items | refs.oneOf."687" | optional,
            maxItems | std.number.Integer | optional,
            maxLength | std.number.Integer | optional,
            maxProperties | std.number.Integer | optional,
            maximum | Number | optional,
            minItems | std.number.Integer | optional,
            minLength | std.number.Integer | optional,
            minProperties | std.number.Integer | optional,
            minimum | Number | optional,
            multipleOf | Number | optional,
            not | js2n.Always | { _ | Dyn } | optional,
            nullable | Bool | optional,
            oneOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            pattern | String | optional,
            patternProperties
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            properties
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            required | Array String | optional,
            title | String | optional,
            type | String | optional,
            uniqueItems | Bool | optional,
            x-kubernetes-embedded-resource | Bool | optional,
            x-kubernetes-int-or-string | Bool | optional,
            x-kubernetes-list-map-keys | Array String | optional,
            x-kubernetes-list-type | String | optional,
            x-kubernetes-map-type | String | optional,
            x-kubernetes-preserve-unknown-fields | Bool | optional,
            x-kubernetes-validations
              | Array (std.contract.Sequence [ refs.oneOf."692", { _ | Dyn } ])
              | optional
          },
      oneOf."687" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."688" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."689" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."69" =
        {
            rollingUpdate | refs.oneOf."81" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."690" = { jsonPath | String },
      oneOf."691" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."692" =
        {
            fieldPath | String | optional,
            message | String | optional,
            messageExpression | String | optional,
            optionalOldSelf | Bool | optional,
            reason | String | optional,
            rule | String
          },
      oneOf."693" =
        {
            caBundle | String | optional,
            service | refs.oneOf."691" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."694" =
        {
            clientConfig | refs.oneOf."693" | { _ | Dyn } | optional,
            conversionReviewVersions | Array String
          },
      oneOf."695" = std.contract.any_of [ Number, String ],
      oneOf."696" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIGroup |] | optional,
            name | String,
            preferredVersion | refs.oneOf."705" | { _ | Dyn } | optional,
            serverAddressByClientCIDRs
              | Array (std.contract.Sequence [ refs.oneOf."715", { _ | Dyn } ])
              | optional,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."705", { _ | Dyn } ])
          },
      oneOf."698" =
        {
            categories | Array String | optional,
            group | String | optional,
            kind | String,
            name | String,
            namespaced | Bool,
            shortNames | Array String | optional,
            singularName | String,
            storageVersionHash | String | optional,
            verbs | Array String,
            version | String | optional
          },
      oneOf."7" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."70" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Deployment |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."73" | { _ | Dyn } | optional,
            status | refs.oneOf."74" | { _ | Dyn } | optional
          },
      oneOf."701" =
        {
            lastTransitionTime | refs.oneOf."719" | String,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."702" =
        {
            apiVersion | String | optional,
            dryRun | Array String | optional,
            gracePeriodSeconds | std.number.Integer | optional,
            ignoreStoreReadErrorWithClusterBreakingPotential | Bool | optional,
            kind | std.enum.TagOrString | [| 'DeleteOptions |] | optional,
            orphanDependents | Bool | optional,
            preconditions | refs.oneOf."714" | { _ | Dyn } | optional,
            propagationPolicy | String | optional
          },
      oneOf."703" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."704" = { _ | Dyn },
      oneOf."705" = { groupVersion | String, version | String },
      oneOf."706" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."707", { _ | Dyn } ])
              | optional,
            matchLabels | { _ | String } | optional
          },
      oneOf."707" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."708" =
        {
            continue | String | optional,
            remainingItemCount | std.number.Integer | optional,
            resourceVersion | String | optional,
            selfLink | String | optional
          },
      oneOf."709" =
        {
            apiVersion | String | optional,
            fieldsType | String | optional,
            fieldsV1 | refs.oneOf."704" | { _ | Dyn } | optional,
            manager | String | optional,
            operation | String | optional,
            subresource | String | optional,
            time | refs.oneOf."719" | String | optional
          },
      oneOf."71" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            lastUpdateTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."710" = String,
      oneOf."711" =
        {
            annotations | { _ | String } | optional,
            creationTimestamp | refs.oneOf."719" | String | optional,
            deletionGracePeriodSeconds | std.number.Integer | optional,
            deletionTimestamp | refs.oneOf."719" | String | optional,
            finalizers | Array String | optional,
            generateName | String | optional,
            generation | std.number.Integer | optional,
            labels | { _ | String } | optional,
            managedFields
              | Array (std.contract.Sequence [ refs.oneOf."709", { _ | Dyn } ])
              | optional,
            name | String | optional,
            namespace | String | optional,
            ownerReferences
              | Array (std.contract.Sequence [ refs.oneOf."712", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional,
            selfLink | String | optional,
            uid | String | optional
          },
      oneOf."712" =
        {
            apiVersion | String,
            blockOwnerDeletion | Bool | optional,
            controller | Bool | optional,
            kind | String,
            name | String,
            uid | String
          },
      oneOf."714" =
        { resourceVersion | String | optional, uid | String | optional },
      oneOf."715" = { clientCIDR | String, serverAddress | String },
      oneOf."717" =
        {
            field | String | optional,
            message | String | optional,
            reason | String | optional
          },
      oneOf."718" =
        {
            causes
              | Array (std.contract.Sequence [ refs.oneOf."717", { _ | Dyn } ])
              | optional,
            group | String | optional,
            kind | String | optional,
            name | String | optional,
            retryAfterSeconds | std.number.Integer | optional,
            uid | String | optional
          },
      oneOf."719" = String,
      oneOf."721" = { _ | Dyn },
      oneOf."722" = std.contract.any_of [ String, std.number.Integer ],
      oneOf."724" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIService |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."727" | { _ | Dyn } | optional,
            status | refs.oneOf."728" | { _ | Dyn } | optional
          },
      oneOf."725" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."727" =
        {
            caBundle | String | optional,
            group | String | optional,
            groupPriorityMinimum | std.number.Integer,
            insecureSkipTLSVerify | Bool | optional,
            service | refs.oneOf."729" | { _ | Dyn } | optional,
            version | String | optional,
            versionPriority | std.number.Integer
          },
      oneOf."728" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."725", { _ | Dyn } ])
              | optional
          },
      oneOf."729" =
        {
            name | String | optional,
            namespace | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."73" =
        {
            minReadySeconds | std.number.Integer | optional,
            paused | Bool | optional,
            progressDeadlineSeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."706" | { _ | Dyn },
            strategy | refs.oneOf."75" | { _ | Dyn } | optional,
            template | refs.oneOf."340" | { _ | Dyn }
          },
      oneOf."74" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."71", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            terminatingReplicas | std.number.Integer | optional,
            unavailableReplicas | std.number.Integer | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."75" =
        {
            rollingUpdate | refs.oneOf."82" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."76" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ReplicaSet |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."79" | { _ | Dyn } | optional,
            status | refs.oneOf."80" | { _ | Dyn } | optional
          },
      oneOf."77" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."79" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | refs.oneOf."706" | { _ | Dyn },
            template | refs.oneOf."340" | { _ | Dyn } | optional
          },
      oneOf."8" = { apiVersion | String | optional, kind | String | optional },
      oneOf."80" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."77", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer,
            terminatingReplicas | std.number.Integer | optional
          },
      oneOf."81" =
        {
            maxSurge | refs.oneOf."722" | optional,
            maxUnavailable | refs.oneOf."722" | optional
          },
      oneOf."82" =
        {
            maxSurge | refs.oneOf."722" | optional,
            maxUnavailable | refs.oneOf."722" | optional
          },
      oneOf."83" =
        {
            maxUnavailable | refs.oneOf."722" | optional,
            partition | std.number.Integer | optional
          },
      oneOf."84" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StatefulSet |] | optional,
            metadata | refs.oneOf."711" | { _ | Dyn } | optional,
            spec | refs.oneOf."89" | { _ | Dyn } | optional,
            status | refs.oneOf."90" | { _ | Dyn } | optional
          },
      oneOf."85" =
        {
            lastTransitionTime | refs.oneOf."719" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."87" = { start | std.number.Integer | optional },
      oneOf."88" =
        { whenDeleted | String | optional, whenScaled | String | optional },
      oneOf."89" =
        {
            minReadySeconds | std.number.Integer | optional,
            ordinals | refs.oneOf."87" | { _ | Dyn } | optional,
            persistentVolumeClaimRetentionPolicy
              | refs.oneOf."88"
              | { _ | Dyn }
              | optional,
            podManagementPolicy | String | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."706" | { _ | Dyn },
            serviceName | String | optional,
            template | refs.oneOf."340" | { _ | Dyn },
            updateStrategy | refs.oneOf."91" | { _ | Dyn } | optional,
            volumeClaimTemplates
              | Array (std.contract.Sequence [ refs.oneOf."308", { _ | Dyn } ])
              | optional
          },
      oneOf."9" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."706" | { _ | Dyn } | optional
          },
      oneOf."90" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."85", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            currentRevision | String | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer,
            updateRevision | String | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."91" =
        {
            rollingUpdate | refs.oneOf."83" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."92" =
        {
            apiVersion | String | optional,
            kind | String | optional,
            name | String | optional,
            uid | String | optional
          },
      oneOf."94" = { userInfo | refs.oneOf."101" | { _ | Dyn } | optional },
      oneOf."96" =
        {
            audiences | Array String,
            boundObjectRef | refs.oneOf."92" | { _ | Dyn } | optional,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."97" =
        { expirationTimestamp | refs.oneOf."719" | String, token | String },
      oneOf."99" =
        { audiences | Array String | optional, token | String | optional }
    }
    in
  js2n.OneOf
      [
        js2n.record.Record
          {
            properties = { key = String, valueExpression = String },
            required = { key = true, valueExpression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fieldRef = String, warning = String },
            required = { fieldRef = true, warning = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."7",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."706",
                  objectSelector = refs.oneOf."706",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."7"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  admissionReviewVersions = js2n.array.ArrayOf String,
                  clientConfig = refs.oneOf."25",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchPolicy = String,
                  name = String,
                  namespaceSelector = refs.oneOf."706",
                  objectSelector = refs.oneOf."706",
                  reinvocationPolicy = String,
                  rules = js2n.array.ArrayOf refs.oneOf."10",
                  sideEffects = String,
                  timeoutSeconds = std.number.Integer
                },
            required =
              {
                  admissionReviewVersions = true,
                  clientConfig = true,
                  name = true,
                  sideEffects = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingWebhookConfiguration |]
                        ],
                  metadata = refs.oneOf."711",
                  webhooks = js2n.array.ArrayOf refs.oneOf."4"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."5",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingWebhookConfigurationList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."706"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  path = String,
                  port = std.number.Integer
                },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expressionWarnings = js2n.array.ArrayOf refs.oneOf."1" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."18",
                  status = refs.oneOf."19"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."16"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."14",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."3",
                  paramRef = refs.oneOf."9",
                  policyName = String,
                  validationActions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."13",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  auditAnnotations = js2n.array.ArrayOf refs.oneOf."0",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchConstraints = refs.oneOf."3",
                  paramKind = refs.oneOf."8",
                  validations = js2n.array.ArrayOf refs.oneOf."23",
                  variables = js2n.array.ArrayOf refs.oneOf."24"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  observedGeneration = std.number.Integer,
                  typeChecking = refs.oneOf."12"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  admissionReviewVersions = js2n.array.ArrayOf String,
                  clientConfig = refs.oneOf."25",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchPolicy = String,
                  name = String,
                  namespaceSelector = refs.oneOf."706",
                  objectSelector = refs.oneOf."706",
                  rules = js2n.array.ArrayOf refs.oneOf."10",
                  sideEffects = String,
                  timeoutSeconds = std.number.Integer
                },
            required =
              {
                  admissionReviewVersions = true,
                  clientConfig = true,
                  name = true,
                  sideEffects = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingWebhookConfiguration |]
                        ],
                  metadata = refs.oneOf."711",
                  webhooks = js2n.array.ArrayOf refs.oneOf."20"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."21",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingWebhookConfigurationList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  expression = String,
                  message = String,
                  messageExpression = String,
                  reason = String
                },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { caBundle = String, service = refs.oneOf."11", url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."37",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."706",
                  objectSelector = refs.oneOf."706",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."37"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."35"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."33"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."31",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."29",
                  paramRef = refs.oneOf."39",
                  policyName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."30",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."28",
                  matchConstraints = refs.oneOf."29",
                  mutations = js2n.array.ArrayOf refs.oneOf."36",
                  paramKind = refs.oneOf."38",
                  reinvocationPolicy = String,
                  variables = js2n.array.ArrayOf refs.oneOf."40"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  applyConfiguration = refs.oneOf."26",
                  jsonPatch = refs.oneOf."27",
                  patchType = String
                },
            required = { patchType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."706"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."52",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."706",
                  objectSelector = refs.oneOf."706",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."52"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."50"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."48"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."46",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."44",
                  paramRef = refs.oneOf."54",
                  policyName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."45",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."43",
                  matchConstraints = refs.oneOf."44",
                  mutations = js2n.array.ArrayOf refs.oneOf."51",
                  paramKind = refs.oneOf."53",
                  reinvocationPolicy = String,
                  variables = js2n.array.ArrayOf refs.oneOf."55"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  applyConfiguration = refs.oneOf."41",
                  jsonPatch = refs.oneOf."42",
                  patchType = String
                },
            required = { patchType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."706"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiServerID = String,
                  decodableVersions = js2n.array.ArrayOf String,
                  encodingVersion = String,
                  servedVersions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageVersion |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."60",
                  status = refs.oneOf."61"
                },
            required = { spec = true, status = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required =
              { message = true, reason = true, status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."57",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageVersionList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties =
              {
                  commonEncodingVersion = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."58",
                  storageVersions = js2n.array.ArrayOf refs.oneOf."56"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  data = refs.oneOf."721",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevision |] ],
                  metadata = refs.oneOf."711",
                  revision = std.number.Integer
                },
            required = { revision = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."62",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevisionList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DaemonSet |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."67",
                  status = refs.oneOf."68"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."64",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DaemonSetList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."706",
                  template = refs.oneOf."340",
                  updateStrategy = refs.oneOf."69"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."65",
                  currentNumberScheduled = std.number.Integer,
                  desiredNumberScheduled = std.number.Integer,
                  numberAvailable = std.number.Integer,
                  numberMisscheduled = std.number.Integer,
                  numberReady = std.number.Integer,
                  numberUnavailable = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  updatedNumberScheduled = std.number.Integer
                },
            required =
              {
                  currentNumberScheduled = true,
                  desiredNumberScheduled = true,
                  numberMisscheduled = true,
                  numberReady = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."81", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Deployment |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."73",
                  status = refs.oneOf."74"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  lastUpdateTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."70",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeploymentList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  paused = Bool,
                  progressDeadlineSeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."706",
                  strategy = refs.oneOf."75",
                  template = refs.oneOf."340"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."71",
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  terminatingReplicas = std.number.Integer,
                  unavailableReplicas = std.number.Integer,
                  updatedReplicas = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."82", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicaSet |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."79",
                  status = refs.oneOf."80"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."76",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicaSetList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  selector = refs.oneOf."706",
                  template = refs.oneOf."340"
                },
            required = { selector = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."77",
                  fullyLabeledReplicas = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  terminatingReplicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxSurge = refs.oneOf."722",
                  maxUnavailable = refs.oneOf."722"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxSurge = refs.oneOf."722",
                  maxUnavailable = refs.oneOf."722"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."722",
                  partition = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StatefulSet |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."89",
                  status = refs.oneOf."90"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."84",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StatefulSetList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { start = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { whenDeleted = String, whenScaled = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  ordinals = refs.oneOf."87",
                  persistentVolumeClaimRetentionPolicy = refs.oneOf."88",
                  podManagementPolicy = String,
                  replicas = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."706",
                  serviceName = String,
                  template = refs.oneOf."340",
                  updateStrategy = refs.oneOf."91",
                  volumeClaimTemplates = js2n.array.ArrayOf refs.oneOf."308"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."85",
                  currentReplicas = std.number.Integer,
                  currentRevision = String,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  updateRevision = String,
                  updatedReplicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."83", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind = String,
                  name = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SelfSubjectReview |] ],
                  metadata = refs.oneOf."711",
                  status = refs.oneOf."94"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { userInfo = refs.oneOf."101" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'TokenRequest |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."96",
                  status = refs.oneOf."97"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audiences = js2n.array.ArrayOf String,
                  boundObjectRef = refs.oneOf."92",
                  expirationSeconds = std.number.Integer
                },
            required = { audiences = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expirationTimestamp = refs.oneOf."719", token = String },
            required = { expirationTimestamp = true, token = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'TokenReview |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."99",
                  status = refs.oneOf."100"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { audiences = js2n.array.ArrayOf String, token = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audiences = js2n.array.ArrayOf String,
                  authenticated = Bool,
                  error = String,
                  user = refs.oneOf."101"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  uid = String,
                  username = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  rawSelector = String,
                  requirements = js2n.array.ArrayOf refs.oneOf."703"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  rawSelector = String,
                  requirements = js2n.array.ArrayOf refs.oneOf."707"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'LocalSubjectAccessReview |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."114",
                  status = refs.oneOf."115"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, verb = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceURLs = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldSelector = refs.oneOf."102",
                  group = String,
                  labelSelector = refs.oneOf."103",
                  name = String,
                  namespace = String,
                  resource = String,
                  subresource = String,
                  verb = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'SelfSubjectAccessReview |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."110",
                  status = refs.oneOf."115"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceAttributes = refs.oneOf."105",
                  resourceAttributes = refs.oneOf."107"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SelfSubjectRulesReview |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."112",
                  status = refs.oneOf."116"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { namespace = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SubjectAccessReview |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."114",
                  status = refs.oneOf."115"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  nonResourceAttributes = refs.oneOf."105",
                  resourceAttributes = refs.oneOf."107",
                  uid = String,
                  user = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowed = Bool,
                  denied = Bool,
                  evaluationError = String,
                  reason = String
                },
            required = { allowed = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  evaluationError = String,
                  incomplete = Bool,
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."106",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."108"
                },
            required =
              {
                  incomplete = true,
                  nonResourceRules = true,
                  resourceRules = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscaler |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."120",
                  status = refs.oneOf."121"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."118",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxReplicas = std.number.Integer,
                  minReplicas = std.number.Integer,
                  scaleTargetRef = refs.oneOf."117",
                  targetCPUUtilizationPercentage = std.number.Integer
                },
            required = { maxReplicas = true, scaleTargetRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  currentCPUUtilizationPercentage = std.number.Integer,
                  currentReplicas = std.number.Integer,
                  desiredReplicas = std.number.Integer,
                  lastScaleTime = refs.oneOf."719",
                  observedGeneration = std.number.Integer
                },
            required = { currentReplicas = true, desiredReplicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Scale |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."123",
                  status = refs.oneOf."124"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { replicas = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { replicas = std.number.Integer, selector = String },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { container = String, name = String, target = refs.oneOf."141" },
            required = { container = true, name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { container = String, current = refs.oneOf."142", name = String },
            required = { container = true, current = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metric = refs.oneOf."138", target = refs.oneOf."141" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."142", metric = refs.oneOf."138" },
            required = { current = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  periodSeconds = std.number.Integer,
                  type = String,
                  value = std.number.Integer
                },
            required = { periodSeconds = true, type = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  policies = js2n.array.ArrayOf refs.oneOf."130",
                  selectPolicy = String,
                  stabilizationWindowSeconds = std.number.Integer,
                  tolerance = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscaler |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."136",
                  status = refs.oneOf."137"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { scaleDown = refs.oneOf."131", scaleUp = refs.oneOf."131" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."132",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  behavior = refs.oneOf."133",
                  maxReplicas = std.number.Integer,
                  metrics = js2n.array.ArrayOf refs.oneOf."139",
                  minReplicas = std.number.Integer,
                  scaleTargetRef = refs.oneOf."127"
                },
            required = { maxReplicas = true, scaleTargetRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."134",
                  currentMetrics = js2n.array.ArrayOf refs.oneOf."140",
                  currentReplicas = std.number.Integer,
                  desiredReplicas = std.number.Integer,
                  lastScaleTime = refs.oneOf."719",
                  observedGeneration = std.number.Integer
                },
            required = { desiredReplicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, selector = refs.oneOf."706" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerResource = refs.oneOf."125",
                  external = refs.oneOf."128",
                  object = refs.oneOf."143",
                  pods = refs.oneOf."145",
                  resource = refs.oneOf."147",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerResource = refs.oneOf."126",
                  external = refs.oneOf."129",
                  object = refs.oneOf."144",
                  pods = refs.oneOf."146",
                  resource = refs.oneOf."148",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  averageUtilization = std.number.Integer,
                  averageValue = std.contract.any_of [ Number, String ],
                  type = String,
                  value = std.contract.any_of [ Number, String ]
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  averageUtilization = std.number.Integer,
                  averageValue = std.contract.any_of [ Number, String ],
                  value = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  describedObject = refs.oneOf."127",
                  metric = refs.oneOf."138",
                  target = refs.oneOf."141"
                },
            required = { describedObject = true, metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  current = refs.oneOf."142",
                  describedObject = refs.oneOf."127",
                  metric = refs.oneOf."138"
                },
            required =
              { current = true, describedObject = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metric = refs.oneOf."138", target = refs.oneOf."141" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."142", metric = refs.oneOf."138" },
            required = { current = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, target = refs.oneOf."141" },
            required = { name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { current = refs.oneOf."142", name = String },
            required = { current = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CronJob |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."151",
                  status = refs.oneOf."152"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."149",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CronJobList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  concurrencyPolicy = String,
                  failedJobsHistoryLimit = std.number.Integer,
                  jobTemplate = refs.oneOf."158",
                  schedule = String,
                  startingDeadlineSeconds = std.number.Integer,
                  successfulJobsHistoryLimit = std.number.Integer,
                  suspend = Bool,
                  timeZone = String
                },
            required = { jobTemplate = true, schedule = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = js2n.array.ArrayOf refs.oneOf."306",
                  lastScheduleTime = refs.oneOf."719",
                  lastSuccessfulTime = refs.oneOf."719"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Job |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."156",
                  status = refs.oneOf."157"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."719",
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."153",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'JobList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  activeDeadlineSeconds = std.number.Integer,
                  backoffLimit = std.number.Integer,
                  backoffLimitPerIndex = std.number.Integer,
                  completionMode = String,
                  completions = std.number.Integer,
                  managedBy = String,
                  manualSelector = Bool,
                  maxFailedIndexes = std.number.Integer,
                  parallelism = std.number.Integer,
                  podFailurePolicy = refs.oneOf."159",
                  podReplacementPolicy = String,
                  selector = refs.oneOf."706",
                  successPolicy = refs.oneOf."163",
                  suspend = Bool,
                  template = refs.oneOf."340",
                  ttlSecondsAfterFinished = std.number.Integer
                },
            required = { template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = std.number.Integer,
                  completedIndexes = String,
                  completionTime = refs.oneOf."719",
                  conditions = js2n.array.ArrayOf refs.oneOf."154",
                  failed = std.number.Integer,
                  failedIndexes = String,
                  ready = std.number.Integer,
                  startTime = refs.oneOf."719",
                  succeeded = std.number.Integer,
                  terminating = std.number.Integer,
                  uncountedTerminatedPods = refs.oneOf."165"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."156" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."162" },
            required = { rules = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerName = String,
                  operator = String,
                  values = js2n.array.ArrayOf std.number.Integer
                },
            required = { operator = true, values = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { status = String, type = String },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  onExitCodes = refs.oneOf."160",
                  onPodConditions = js2n.array.ArrayOf refs.oneOf."161"
                },
            required = { action = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."164" },
            required = { rules = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  succeededCount = std.number.Integer,
                  succeededIndexes = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  failed = js2n.array.ArrayOf String,
                  succeeded = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CertificateSigningRequest |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."169",
                  status = refs.oneOf."170"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  lastUpdateTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."166",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CertificateSigningRequestList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  expirationSeconds = std.number.Integer,
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  request = String,
                  signerName = String,
                  uid = String,
                  usages = js2n.array.ArrayOf String,
                  username = String
                },
            required = { request = true, signerName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  certificate = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."167"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundle |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."173"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."171",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundleList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { signerName = String, trustBundle = String },
            required = { trustBundle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodCertificateRequest |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."176",
                  status = refs.oneOf."177"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."174",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PodCertificateRequestList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxExpirationSeconds = std.number.Integer,
                  nodeName = String,
                  nodeUID = String,
                  pkixPublicKey = String,
                  podName = String,
                  podUID = String,
                  proofOfPossession = String,
                  serviceAccountName = String,
                  serviceAccountUID = String,
                  signerName = String
                },
            required =
              {
                  nodeName = true,
                  nodeUID = true,
                  pkixPublicKey = true,
                  podName = true,
                  podUID = true,
                  proofOfPossession = true,
                  serviceAccountName = true,
                  serviceAccountUID = true,
                  signerName = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  beginRefreshAt = refs.oneOf."719",
                  certificateChain = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  notAfter = refs.oneOf."719",
                  notBefore = refs.oneOf."719"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundle |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."180"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."178",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundleList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { signerName = String, trustBundle = String },
            required = { trustBundle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Lease |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."183"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."181",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  acquireTime = refs.oneOf."710",
                  holderIdentity = String,
                  leaseDurationSeconds = std.number.Integer,
                  leaseTransitions = std.number.Integer,
                  preferredHolder = String,
                  renewTime = refs.oneOf."710",
                  strategy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidate |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."186"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."184",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidateList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  binaryVersion = String,
                  emulationVersion = String,
                  leaseName = String,
                  pingTime = refs.oneOf."710",
                  renewTime = refs.oneOf."710",
                  strategy = String
                },
            required =
              { binaryVersion = true, leaseName = true, strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidate |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."189"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."187",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidateList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  binaryVersion = String,
                  emulationVersion = String,
                  leaseName = String,
                  pingTime = refs.oneOf."710",
                  renewTime = refs.oneOf."710",
                  strategy = String
                },
            required =
              { binaryVersion = true, leaseName = true, strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  partition = std.number.Integer,
                  readOnly = Bool,
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nodeAffinity = refs.oneOf."289",
                  podAffinity = refs.oneOf."320",
                  podAntiAffinity = refs.oneOf."322"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { localhostProfile = String, type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devicePath = String, name = String },
            required = { devicePath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  cachingMode = String,
                  diskName = String,
                  diskURI = String,
                  fsType = String,
                  kind = String,
                  readOnly = Bool
                },
            required = { diskName = true, diskURI = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  readOnly = Bool,
                  secretName = String,
                  secretNamespace = String,
                  shareName = String
                },
            required = { secretName = true, shareName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { readOnly = Bool, secretName = String, shareName = String },
            required = { secretName = true, shareName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Binding |] ],
                  metadata = refs.oneOf."711",
                  target = refs.oneOf."306"
                },
            required = { target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  controllerExpandSecretRef = refs.oneOf."374",
                  controllerPublishSecretRef = refs.oneOf."374",
                  driver = String,
                  fsType = String,
                  nodeExpandSecretRef = refs.oneOf."374",
                  nodePublishSecretRef = refs.oneOf."374",
                  nodeStageSecretRef = refs.oneOf."374",
                  readOnly = Bool,
                  volumeAttributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  volumeHandle = String
                },
            required = { driver = true, volumeHandle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  nodePublishSecretRef = refs.oneOf."278",
                  readOnly = Bool,
                  volumeAttributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  add = js2n.array.ArrayOf String,
                  drop = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  monitors = js2n.array.ArrayOf String,
                  path = String,
                  readOnly = Bool,
                  secretFile = String,
                  secretRef = refs.oneOf."374",
                  user = String
                },
            required = { monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  monitors = js2n.array.ArrayOf String,
                  path = String,
                  readOnly = Bool,
                  secretFile = String,
                  secretRef = refs.oneOf."278",
                  user = String
                },
            required = { monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."374",
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."278",
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { timeoutSeconds = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."706",
                  name = String,
                  "optional" = Bool,
                  path = String,
                  signerName = String
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  error = String,
                  message = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."207",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatus |] ],
                  metadata = refs.oneOf."711"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."208",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatusList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  binaryData =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  data =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  immutable = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ConfigMap |] ],
                  metadata = refs.oneOf."711"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, "optional" = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, name = String, "optional" = Bool },
            required = { key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."210",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ConfigMapList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  kubeletConfigKey = String,
                  name = String,
                  namespace = String,
                  resourceVersion = String,
                  uid = String
                },
            required =
              { kubeletConfigKey = true, name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  items = js2n.array.ArrayOf refs.oneOf."268",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."268",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  args = js2n.array.ArrayOf String,
                  command = js2n.array.ArrayOf String,
                  env = js2n.array.ArrayOf refs.oneOf."241",
                  envFrom = js2n.array.ArrayOf refs.oneOf."240",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."269",
                  livenessProbe = refs.oneOf."344",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."220",
                  readinessProbe = refs.oneOf."344",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."221",
                  resources = refs.oneOf."361",
                  restartPolicy = String,
                  restartPolicyRules = js2n.array.ArrayOf refs.oneOf."222",
                  securityContext = refs.oneOf."376",
                  startupProbe = refs.oneOf."344",
                  stdin = Bool,
                  stdinOnce = Bool,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."399",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."400",
                  workingDir = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerName = String,
                  requestName = String,
                  resourceName = String
                },
            required =
              { containerName = true, requestName = true, resourceName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  names = js2n.array.ArrayOf String,
                  sizeBytes = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerPort = std.number.Integer,
                  hostIP = String,
                  hostPort = std.number.Integer,
                  name = String,
                  protocol = String
                },
            required = { containerPort = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { resourceName = String, restartPolicy = String },
            required = { resourceName = true, restartPolicy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { action = String, exitCodes = refs.oneOf."223" },
            required = { action = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  operator = String,
                  values = js2n.array.ArrayOf std.number.Integer
                },
            required = { operator = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  running = refs.oneOf."225",
                  terminated = refs.oneOf."226",
                  waiting = refs.oneOf."227"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { startedAt = refs.oneOf."719" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerID = String,
                  exitCode = std.number.Integer,
                  finishedAt = refs.oneOf."719",
                  message = String,
                  reason = String,
                  signal = std.number.Integer,
                  startedAt = refs.oneOf."719"
                },
            required = { exitCode = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { message = String, reason = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocatedResources =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  allocatedResourcesStatus =
                    js2n.array.ArrayOf refs.oneOf."362",
                  containerID = String,
                  image = String,
                  imageID = String,
                  lastState = refs.oneOf."224",
                  name = String,
                  ready = Bool,
                  resources = refs.oneOf."361",
                  restartCount = std.number.Integer,
                  started = Bool,
                  state = refs.oneOf."224",
                  stopSignal = String,
                  user = refs.oneOf."229",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."401"
                },
            required =
              {
                  image = true,
                  imageID = true,
                  name = true,
                  ready = true,
                  restartCount = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { linux = refs.oneOf."275" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { Port = std.number.Integer },
            required = { Port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { items = js2n.array.ArrayOf refs.oneOf."232" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldRef = refs.oneOf."305",
                  mode = std.number.Integer,
                  path = String,
                  resourceFieldRef = refs.oneOf."355"
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."232"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  medium = String,
                  sizeLimit = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  nodeName = String,
                  targetRef = refs.oneOf."306"
                },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  port = std.number.Integer,
                  protocol = String
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf refs.oneOf."235",
                  notReadyAddresses = js2n.array.ArrayOf refs.oneOf."235",
                  ports = js2n.array.ArrayOf refs.oneOf."236"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Endpoints |] ],
                  metadata = refs.oneOf."711",
                  subsets = js2n.array.ArrayOf refs.oneOf."237"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."238",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointsList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapRef = refs.oneOf."211",
                  prefix = String,
                  secretRef = refs.oneOf."370"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { name = String, value = String, valueFrom = refs.oneOf."242" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapKeyRef = refs.oneOf."212",
                  fieldRef = refs.oneOf."305",
                  fileKeyRef = refs.oneOf."251",
                  resourceFieldRef = refs.oneOf."355",
                  secretKeyRef = refs.oneOf."371"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  args = js2n.array.ArrayOf String,
                  command = js2n.array.ArrayOf String,
                  env = js2n.array.ArrayOf refs.oneOf."241",
                  envFrom = js2n.array.ArrayOf refs.oneOf."240",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."269",
                  livenessProbe = refs.oneOf."344",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."220",
                  readinessProbe = refs.oneOf."344",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."221",
                  resources = refs.oneOf."361",
                  restartPolicy = String,
                  restartPolicyRules = js2n.array.ArrayOf refs.oneOf."222",
                  securityContext = refs.oneOf."376",
                  startupProbe = refs.oneOf."344",
                  stdin = Bool,
                  stdinOnce = Bool,
                  targetContainerName = String,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."399",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."400",
                  workingDir = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { volumeClaimTemplate = refs.oneOf."313" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  apiVersion = String,
                  count = std.number.Integer,
                  eventTime = refs.oneOf."710",
                  firstTimestamp = refs.oneOf."719",
                  involvedObject = refs.oneOf."306",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  lastTimestamp = refs.oneOf."719",
                  message = String,
                  metadata = refs.oneOf."711",
                  reason = String,
                  related = refs.oneOf."306",
                  reportingComponent = String,
                  reportingInstance = String,
                  series = refs.oneOf."247",
                  source = refs.oneOf."248",
                  type = String
                },
            required = { involvedObject = true, metadata = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."245",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  count = std.number.Integer,
                  lastObservedTime = refs.oneOf."710"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { component = String, host = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { command = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  lun = std.number.Integer,
                  readOnly = Bool,
                  targetWWNs = js2n.array.ArrayOf String,
                  wwids = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  "optional" = Bool,
                  path = String,
                  volumeName = String
                },
            required = { key = true, path = true, volumeName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  options =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  readOnly = Bool,
                  secretRef = refs.oneOf."374"
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  options =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  readOnly = Bool,
                  secretRef = refs.oneOf."278"
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { datasetName = String, datasetUUID = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  partition = std.number.Integer,
                  pdName = String,
                  readOnly = Bool
                },
            required = { pdName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { port = std.number.Integer, service = String },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { directory = String, repository = String, revision = String },
            required = { repository = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  endpoints = String,
                  endpointsNamespace = String,
                  path = String,
                  readOnly = Bool
                },
            required = { endpoints = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { endpoints = String, path = String, readOnly = Bool },
            required = { endpoints = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  host = String,
                  httpHeaders = js2n.array.ArrayOf refs.oneOf."261",
                  path = String,
                  port = refs.oneOf."722",
                  scheme = String
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = { name = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { hostnames = js2n.array.ArrayOf String, ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, type = String },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  chapAuthDiscovery = Bool,
                  chapAuthSession = Bool,
                  fsType = String,
                  initiatorName = String,
                  iqn = String,
                  iscsiInterface = String,
                  lun = std.number.Integer,
                  portals = js2n.array.ArrayOf String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."374",
                  targetPortal = String
                },
            required = { iqn = true, lun = true, targetPortal = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  chapAuthDiscovery = Bool,
                  chapAuthSession = Bool,
                  fsType = String,
                  initiatorName = String,
                  iqn = String,
                  iscsiInterface = String,
                  lun = std.number.Integer,
                  portals = js2n.array.ArrayOf String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."278",
                  targetPortal = String
                },
            required = { iqn = true, lun = true, targetPortal = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { pullPolicy = String, reference = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { key = String, mode = std.number.Integer, path = String },
            required = { key = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  postStart = refs.oneOf."270",
                  preStop = refs.oneOf."270",
                  stopSignal = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."249",
                  httpGet = refs.oneOf."260",
                  sleep = refs.oneOf."386",
                  tcpSocket = refs.oneOf."390"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LimitRange |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."274"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  "default" =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  defaultRequest =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  max =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  maxLimitRequestRatio =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  min =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."271",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LimitRangeList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { limits = js2n.array.ArrayOf refs.oneOf."272" },
            required = { limits = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  gid = std.number.Integer,
                  supplementalGroups = js2n.array.ArrayOf std.number.Integer,
                  uid = std.number.Integer
                },
            required = { gid = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  ipMode = String,
                  ports = js2n.array.ArrayOf refs.oneOf."341"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."276" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fsType = String, path = String },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { status = String, targetVolumeAttributesClassName = String },
            required = { status = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, readOnly = Bool, server = String },
            required = { path = true, server = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Namespace |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."285",
                  status = refs.oneOf."286"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."282",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NamespaceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { finalizers = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."283",
                  phase = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Node |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."301",
                  status = refs.oneOf."302"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { address = String, type = String },
            required = { address = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."343",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    refs.oneOf."298"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastHeartbeatTime = refs.oneOf."719",
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { configMap = refs.oneOf."214" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = refs.oneOf."291",
                  assigned = refs.oneOf."291",
                  error = String,
                  lastKnownGood = refs.oneOf."291"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { kubeletEndpoint = refs.oneOf."230" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { supplementalGroupsPolicy = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."287",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NodeList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { features = refs.oneOf."297", name = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { recursiveReadOnlyMounts = Bool, userNamespaces = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { nodeSelectorTerms = js2n.array.ArrayOf refs.oneOf."300" },
            required = { nodeSelectorTerms = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."299",
                  matchFields = js2n.array.ArrayOf refs.oneOf."299"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configSource = refs.oneOf."291",
                  externalID = String,
                  podCIDR = String,
                  podCIDRs = js2n.array.ArrayOf String,
                  providerID = String,
                  taints = js2n.array.ArrayOf refs.oneOf."391",
                  unschedulable = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf refs.oneOf."288",
                  allocatable =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  conditions = js2n.array.ArrayOf refs.oneOf."290",
                  config = refs.oneOf."292",
                  daemonEndpoints = refs.oneOf."293",
                  features = refs.oneOf."294",
                  images = js2n.array.ArrayOf refs.oneOf."219",
                  nodeInfo = refs.oneOf."304",
                  phase = String,
                  runtimeHandlers = js2n.array.ArrayOf refs.oneOf."296",
                  volumesAttached = js2n.array.ArrayOf refs.oneOf."193",
                  volumesInUse = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { capacity = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  architecture = String,
                  bootID = String,
                  containerRuntimeVersion = String,
                  kernelVersion = String,
                  kubeProxyVersion = String,
                  kubeletVersion = String,
                  machineID = String,
                  operatingSystem = String,
                  osImage = String,
                  swap = refs.oneOf."303",
                  systemUUID = String
                },
            required =
              {
                  architecture = true,
                  bootID = true,
                  containerRuntimeVersion = true,
                  kernelVersion = true,
                  kubeProxyVersion = true,
                  kubeletVersion = true,
                  machineID = true,
                  operatingSystem = true,
                  osImage = true,
                  systemUUID = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, fieldPath = String },
            required = { fieldPath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  fieldPath = String,
                  kind = String,
                  name = String,
                  namespace = String,
                  resourceVersion = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolume |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."316",
                  status = refs.oneOf."317"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolumeClaim |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."311",
                  status = refs.oneOf."312"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."719",
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."308",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PersistentVolumeClaimList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  dataSource = refs.oneOf."396",
                  dataSourceRef = refs.oneOf."397",
                  resources = refs.oneOf."404",
                  selector = refs.oneOf."706",
                  storageClassName = String,
                  volumeAttributesClassName = String,
                  volumeMode = String,
                  volumeName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  allocatedResourceStatuses =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  allocatedResources =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  conditions = js2n.array.ArrayOf refs.oneOf."309",
                  currentVolumeAttributesClassName = String,
                  modifyVolumeStatus = refs.oneOf."280",
                  phase = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."311" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { claimName = String, readOnly = Bool },
            required = { claimName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."307",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolumeList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  awsElasticBlockStore = refs.oneOf."190",
                  azureDisk = refs.oneOf."194",
                  azureFile = refs.oneOf."195",
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  cephfs = refs.oneOf."201",
                  cinder = refs.oneOf."203",
                  claimRef = refs.oneOf."306",
                  csi = refs.oneOf."198",
                  fc = refs.oneOf."250",
                  flexVolume = refs.oneOf."252",
                  flocker = refs.oneOf."254",
                  gcePersistentDisk = refs.oneOf."255",
                  glusterfs = refs.oneOf."258",
                  hostPath = refs.oneOf."264",
                  iscsi = refs.oneOf."265",
                  local = refs.oneOf."279",
                  mountOptions = js2n.array.ArrayOf String,
                  nfs = refs.oneOf."281",
                  nodeAffinity = refs.oneOf."402",
                  persistentVolumeReclaimPolicy = String,
                  photonPersistentDisk = refs.oneOf."318",
                  portworxVolume = refs.oneOf."342",
                  quobyte = refs.oneOf."346",
                  rbd = refs.oneOf."347",
                  scaleIO = refs.oneOf."364",
                  storageClassName = String,
                  storageos = refs.oneOf."387",
                  volumeAttributesClassName = String,
                  volumeMode = String,
                  vsphereVolume = refs.oneOf."405"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastPhaseTransitionTime = refs.oneOf."719",
                  message = String,
                  phase = String,
                  reason = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fsType = String, pdID = String },
            required = { pdID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Pod |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."336",
                  status = refs.oneOf."337"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."406",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."321"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."706",
                  matchLabelKeys = js2n.array.ArrayOf String,
                  mismatchLabelKeys = js2n.array.ArrayOf String,
                  namespaceSelector = refs.oneOf."706",
                  namespaces = js2n.array.ArrayOf String,
                  topologyKey = String
                },
            required = { topologyKey = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."406",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."321"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  certificateChainPath = String,
                  credentialBundlePath = String,
                  keyPath = String,
                  keyType = String,
                  maxExpirationSeconds = std.number.Integer,
                  signerName = String
                },
            required = { keyType = true, signerName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."719",
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nameservers = js2n.array.ArrayOf String,
                  options = js2n.array.ArrayOf refs.oneOf."326",
                  searches = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requestMappings = js2n.array.ArrayOf refs.oneOf."218",
                  resourceClaimName = String
                },
            required = { requestMappings = true, resourceClaimName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."319",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditionType = String },
            required = { conditionType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  resourceClaimName = String,
                  resourceClaimTemplateName = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, resourceClaimName = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appArmorProfile = refs.oneOf."192",
                  fsGroup = std.number.Integer,
                  fsGroupChangePolicy = String,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxChangePolicy = String,
                  seLinuxOptions = refs.oneOf."363",
                  seccompProfile = refs.oneOf."368",
                  supplementalGroups = js2n.array.ArrayOf std.number.Integer,
                  supplementalGroupsPolicy = String,
                  sysctls = js2n.array.ArrayOf refs.oneOf."389",
                  windowsOptions = refs.oneOf."407"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  activeDeadlineSeconds = std.number.Integer,
                  affinity = refs.oneOf."191",
                  automountServiceAccountToken = Bool,
                  containers = js2n.array.ArrayOf refs.oneOf."217",
                  dnsConfig = refs.oneOf."325",
                  dnsPolicy = String,
                  enableServiceLinks = Bool,
                  ephemeralContainers = js2n.array.ArrayOf refs.oneOf."243",
                  hostAliases = js2n.array.ArrayOf refs.oneOf."262",
                  hostIPC = Bool,
                  hostNetwork = Bool,
                  hostPID = Bool,
                  hostUsers = Bool,
                  hostname = String,
                  hostnameOverride = String,
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."278",
                  initContainers = js2n.array.ArrayOf refs.oneOf."217",
                  nodeName = String,
                  nodeSelector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  os = refs.oneOf."330",
                  overhead =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  preemptionPolicy = String,
                  "priority" = std.number.Integer,
                  priorityClassName = String,
                  readinessGates = js2n.array.ArrayOf refs.oneOf."331",
                  resourceClaims = js2n.array.ArrayOf refs.oneOf."332",
                  resources = refs.oneOf."361",
                  restartPolicy = String,
                  runtimeClassName = String,
                  schedulerName = String,
                  schedulingGates = js2n.array.ArrayOf refs.oneOf."334",
                  securityContext = refs.oneOf."335",
                  serviceAccount = String,
                  serviceAccountName = String,
                  setHostnameAsFQDN = Bool,
                  shareProcessNamespace = Bool,
                  subdomain = String,
                  terminationGracePeriodSeconds = std.number.Integer,
                  tolerations = js2n.array.ArrayOf refs.oneOf."392",
                  topologySpreadConstraints =
                    js2n.array.ArrayOf refs.oneOf."395",
                  volumes = js2n.array.ArrayOf refs.oneOf."398"
                },
            required = { containers = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."324",
                  containerStatuses = js2n.array.ArrayOf refs.oneOf."228",
                  ephemeralContainerStatuses =
                    js2n.array.ArrayOf refs.oneOf."228",
                  extendedResourceClaimStatus = refs.oneOf."327",
                  hostIP = String,
                  hostIPs = js2n.array.ArrayOf refs.oneOf."263",
                  initContainerStatuses = js2n.array.ArrayOf refs.oneOf."228",
                  message = String,
                  nominatedNodeName = String,
                  observedGeneration = std.number.Integer,
                  phase = String,
                  podIP = String,
                  podIPs = js2n.array.ArrayOf refs.oneOf."328",
                  qosClass = String,
                  reason = String,
                  resize = String,
                  resourceClaimStatuses = js2n.array.ArrayOf refs.oneOf."333",
                  startTime = refs.oneOf."719"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodTemplate |] ],
                  metadata = refs.oneOf."711",
                  template = refs.oneOf."340"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."338",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodTemplateList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."336" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { error = String, port = std.number.Integer, protocol = String },
            required = { port = true, protocol = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { fsType = String, readOnly = Bool, volumeID = String },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { preference = refs.oneOf."300", weight = std.number.Integer },
            required = { preference = true, weight = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."249",
                  failureThreshold = std.number.Integer,
                  grpc = refs.oneOf."256",
                  httpGet = refs.oneOf."260",
                  initialDelaySeconds = std.number.Integer,
                  periodSeconds = std.number.Integer,
                  successThreshold = std.number.Integer,
                  tcpSocket = refs.oneOf."390",
                  terminationGracePeriodSeconds = std.number.Integer,
                  timeoutSeconds = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  sources = js2n.array.ArrayOf refs.oneOf."403"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  readOnly = Bool,
                  registry = String,
                  tenant = String,
                  user = String,
                  volume = String
                },
            required = { registry = true, volume = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  image = String,
                  keyring = String,
                  monitors = js2n.array.ArrayOf String,
                  pool = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."374",
                  user = String
                },
            required = { image = true, monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  image = String,
                  keyring = String,
                  monitors = js2n.array.ArrayOf String,
                  pool = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."278",
                  user = String
                },
            required = { image = true, monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicationController |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."352",
                  status = refs.oneOf."353"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."349",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ReplicationControllerList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  selector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  template = refs.oneOf."340"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."350",
                  fullyLabeledReplicas = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, request = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerName = String,
                  divisor = std.contract.any_of [ Number, String ],
                  resource = String
                },
            required = { resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { health = String, resourceID = String },
            required = { resourceID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceQuota |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."359",
                  status = refs.oneOf."360"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."357",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceQuotaList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hard =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  scopeSelector = refs.oneOf."366",
                  scopes = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hard =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  used =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  claims = js2n.array.ArrayOf refs.oneOf."354",
                  limits =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  resources = js2n.array.ArrayOf refs.oneOf."356"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { level = String, role = String, type = String, user = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  gateway = String,
                  protectionDomain = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."374",
                  sslEnabled = Bool,
                  storageMode = String,
                  storagePool = String,
                  system = String,
                  volumeName = String
                },
            required = { gateway = true, secretRef = true, system = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  gateway = String,
                  protectionDomain = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."278",
                  sslEnabled = Bool,
                  storageMode = String,
                  storagePool = String,
                  system = String,
                  volumeName = String
                },
            required = { gateway = true, secretRef = true, system = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchExpressions = js2n.array.ArrayOf refs.oneOf."367" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  operator = String,
                  scopeName = String,
                  values = js2n.array.ArrayOf String
                },
            required = { operator = true, scopeName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { localhostProfile = String, type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  data =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  immutable = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Secret |] ],
                  metadata = refs.oneOf."711",
                  stringData =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, "optional" = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, name = String, "optional" = Bool },
            required = { key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."369",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SecretList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  items = js2n.array.ArrayOf refs.oneOf."268",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, namespace = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."268",
                  "optional" = Bool,
                  secretName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowPrivilegeEscalation = Bool,
                  appArmorProfile = refs.oneOf."192",
                  capabilities = refs.oneOf."200",
                  privileged = Bool,
                  procMount = String,
                  readOnlyRootFilesystem = Bool,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxOptions = refs.oneOf."363",
                  seccompProfile = refs.oneOf."368",
                  windowsOptions = refs.oneOf."407"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Service |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."383",
                  status = refs.oneOf."384"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  automountServiceAccountToken = Bool,
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."278",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccount |] ],
                  metadata = refs.oneOf."711",
                  secrets = js2n.array.ArrayOf refs.oneOf."306"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."378",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccountList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audience = String,
                  expirationSeconds = std.number.Integer,
                  path = String
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."377",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  nodePort = std.number.Integer,
                  port = std.number.Integer,
                  protocol = String,
                  targetPort = refs.oneOf."722"
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocateLoadBalancerNodePorts = Bool,
                  clusterIP = String,
                  clusterIPs = js2n.array.ArrayOf String,
                  externalIPs = js2n.array.ArrayOf String,
                  externalName = String,
                  externalTrafficPolicy = String,
                  healthCheckNodePort = std.number.Integer,
                  internalTrafficPolicy = String,
                  ipFamilies = js2n.array.ArrayOf String,
                  ipFamilyPolicy = String,
                  loadBalancerClass = String,
                  loadBalancerIP = String,
                  loadBalancerSourceRanges = js2n.array.ArrayOf String,
                  ports = js2n.array.ArrayOf refs.oneOf."382",
                  publishNotReadyAddresses = Bool,
                  selector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  sessionAffinity = String,
                  sessionAffinityConfig = refs.oneOf."385",
                  trafficDistribution = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  loadBalancer = refs.oneOf."277"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { clientIP = refs.oneOf."205" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { seconds = std.number.Integer },
            required = { seconds = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."306",
                  volumeName = String,
                  volumeNamespace = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."278",
                  volumeName = String,
                  volumeNamespace = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = { name = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { host = String, port = refs.oneOf."722" },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."719",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, values = js2n.array.ArrayOf String },
            required = { key = true, values = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchLabelExpressions = js2n.array.ArrayOf refs.oneOf."393" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."706",
                  matchLabelKeys = js2n.array.ArrayOf String,
                  maxSkew = std.number.Integer,
                  minDomains = std.number.Integer,
                  nodeAffinityPolicy = String,
                  nodeTaintsPolicy = String,
                  topologyKey = String,
                  whenUnsatisfiable = String
                },
            required =
              { maxSkew = true, topologyKey = true, whenUnsatisfiable = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiGroup = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  awsElasticBlockStore = refs.oneOf."190",
                  azureDisk = refs.oneOf."194",
                  azureFile = refs.oneOf."196",
                  cephfs = refs.oneOf."202",
                  cinder = refs.oneOf."204",
                  configMap = refs.oneOf."216",
                  csi = refs.oneOf."199",
                  downwardAPI = refs.oneOf."233",
                  emptyDir = refs.oneOf."234",
                  ephemeral = refs.oneOf."244",
                  fc = refs.oneOf."250",
                  flexVolume = refs.oneOf."253",
                  flocker = refs.oneOf."254",
                  gcePersistentDisk = refs.oneOf."255",
                  gitRepo = refs.oneOf."257",
                  glusterfs = refs.oneOf."259",
                  hostPath = refs.oneOf."264",
                  image = refs.oneOf."267",
                  iscsi = refs.oneOf."266",
                  name = String,
                  nfs = refs.oneOf."281",
                  persistentVolumeClaim = refs.oneOf."314",
                  photonPersistentDisk = refs.oneOf."318",
                  portworxVolume = refs.oneOf."342",
                  projected = refs.oneOf."345",
                  quobyte = refs.oneOf."346",
                  rbd = refs.oneOf."348",
                  scaleIO = refs.oneOf."365",
                  secret = refs.oneOf."375",
                  storageos = refs.oneOf."388",
                  vsphereVolume = refs.oneOf."405"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devicePath = String, name = String },
            required = { devicePath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  mountPath = String,
                  mountPropagation = String,
                  name = String,
                  readOnly = Bool,
                  recursiveReadOnly = String,
                  subPath = String,
                  subPathExpr = String
                },
            required = { mountPath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  mountPath = String,
                  name = String,
                  readOnly = Bool,
                  recursiveReadOnly = String
                },
            required = { mountPath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { required = refs.oneOf."298" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clusterTrustBundle = refs.oneOf."206",
                  configMap = refs.oneOf."215",
                  downwardAPI = refs.oneOf."231",
                  podCertificate = refs.oneOf."323",
                  secret = refs.oneOf."373",
                  serviceAccountToken = refs.oneOf."380"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  limits =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  storagePolicyID = String,
                  storagePolicyName = String,
                  volumePath = String
                },
            required = { volumePath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  podAffinityTerm = refs.oneOf."321",
                  weight = std.number.Integer
                },
            required = { podAffinityTerm = true, weight = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  gmsaCredentialSpec = String,
                  gmsaCredentialSpecName = String,
                  hostProcess = Bool,
                  runAsUserName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf String,
                  conditions = refs.oneOf."409",
                  deprecatedTopology =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  hints = refs.oneOf."410",
                  hostname = String,
                  nodeName = String,
                  targetRef = refs.oneOf."306",
                  zone = String
                },
            required = { addresses = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ready = Bool, serving = Bool, terminating = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  forNodes = js2n.array.ArrayOf refs.oneOf."414",
                  forZones = js2n.array.ArrayOf refs.oneOf."415"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  port = std.number.Integer,
                  protocol = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addressType = String,
                  apiVersion = String,
                  endpoints = js2n.array.ArrayOf refs.oneOf."408",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSlice |] ],
                  metadata = refs.oneOf."711",
                  ports = js2n.array.ArrayOf refs.oneOf."411"
                },
            required = { addressType = true, endpoints = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."412",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSliceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  apiVersion = String,
                  deprecatedCount = std.number.Integer,
                  deprecatedFirstTimestamp = refs.oneOf."719",
                  deprecatedLastTimestamp = refs.oneOf."719",
                  deprecatedSource = refs.oneOf."248",
                  eventTime = refs.oneOf."710",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  metadata = refs.oneOf."711",
                  note = String,
                  reason = String,
                  regarding = refs.oneOf."306",
                  related = refs.oneOf."306",
                  reportingController = String,
                  reportingInstance = String,
                  series = refs.oneOf."418",
                  type = String
                },
            required = { eventTime = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."416",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  count = std.number.Integer,
                  lastObservedTime = refs.oneOf."710"
                },
            required = { count = true, lastObservedTime = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lendablePercent = std.number.Integer,
                  nominalConcurrencyShares = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'FlowSchema |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."424",
                  status = refs.oneOf."425"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."421",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'FlowSchemaList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinguisherMethod = refs.oneOf."420",
                  matchingPrecedence = std.number.Integer,
                  priorityLevelConfiguration = refs.oneOf."434",
                  rules = js2n.array.ArrayOf refs.oneOf."430"
                },
            required = { priorityLevelConfiguration = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."422" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { queuing = refs.oneOf."437", type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  borrowingLimitPercent = std.number.Integer,
                  lendablePercent = std.number.Integer,
                  limitResponse = refs.oneOf."427",
                  nominalConcurrencyShares = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceURLs = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { nonResourceURLs = true, verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."429",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."438",
                  subjects = js2n.array.ArrayOf refs.oneOf."440"
                },
            required = { subjects = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PriorityLevelConfiguration |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."435",
                  status = refs.oneOf."436"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."431",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PriorityLevelConfigurationList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exempt = refs.oneOf."419",
                  limited = refs.oneOf."428",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."432" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  handSize = std.number.Integer,
                  queueLengthLimit = std.number.Integer,
                  queues = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  clusterScope = Bool,
                  namespaces = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { apiGroups = true, resources = true, verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, namespace = String },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = refs.oneOf."426",
                  kind = String,
                  serviceAccount = refs.oneOf."439",
                  user = refs.oneOf."441"
                },
            required = { kind = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { backend = refs.oneOf."449", path = String, pathType = String },
            required = { backend = true, pathType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { paths = js2n.array.ArrayOf refs.oneOf."442" },
            required = { paths = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddress |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."446"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."444",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddressList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { parentRef = refs.oneOf."470" },
            required = { parentRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidr = String, except = js2n.array.ArrayOf String },
            required = { cidr = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Ingress |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."460",
                  status = refs.oneOf."461"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { resource = refs.oneOf."396", service = refs.oneOf."459" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressClass |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."453"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."450",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String,
                  scope = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { controller = String, parameters = refs.oneOf."452" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."448",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  ports = js2n.array.ArrayOf refs.oneOf."457"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."455" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { error = String, port = std.number.Integer, protocol = String },
            required = { port = true, protocol = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { host = String, http = refs.oneOf."443" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, port = refs.oneOf."471" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultBackend = refs.oneOf."449",
                  ingressClassName = String,
                  rules = js2n.array.ArrayOf refs.oneOf."458",
                  tls = js2n.array.ArrayOf refs.oneOf."462"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { loadBalancer = refs.oneOf."456" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { hosts = js2n.array.ArrayOf String, secretName = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NetworkPolicy |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."469"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ports = js2n.array.ArrayOf refs.oneOf."468",
                  to = js2n.array.ArrayOf refs.oneOf."467"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  from = js2n.array.ArrayOf refs.oneOf."467",
                  ports = js2n.array.ArrayOf refs.oneOf."468"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."463",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NetworkPolicyList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ipBlock = refs.oneOf."447",
                  namespaceSelector = refs.oneOf."706",
                  podSelector = refs.oneOf."706"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  endPort = std.number.Integer,
                  port = refs.oneOf."722",
                  protocol = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  egress = js2n.array.ArrayOf refs.oneOf."464",
                  ingress = js2n.array.ArrayOf refs.oneOf."465",
                  podSelector = refs.oneOf."706",
                  policyTypes = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  name = String,
                  namespace = String,
                  resource = String
                },
            required = { name = true, resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, number = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDR |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."474",
                  status = refs.oneOf."475"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."472",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDRList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidrs = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."701" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddress |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."478"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."476",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddressList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { parentRef = refs.oneOf."479" },
            required = { parentRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  name = String,
                  namespace = String,
                  resource = String
                },
            required = { name = true, resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDR |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."482",
                  status = refs.oneOf."483"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."480",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDRList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidrs = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."701" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  podFixed =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  handler = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RuntimeClass |] ],
                  metadata = refs.oneOf."711",
                  overhead = refs.oneOf."484",
                  scheduling = refs.oneOf."487"
                },
            required = { handler = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."485",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RuntimeClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nodeSelector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  tolerations = js2n.array.ArrayOf refs.oneOf."392"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  deleteOptions = refs.oneOf."702",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Eviction |] ],
                  metadata = refs.oneOf."711"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodDisruptionBudget |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."491",
                  status = refs.oneOf."492"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."489",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PodDisruptionBudgetList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."722",
                  minAvailable = refs.oneOf."722",
                  selector = refs.oneOf."706",
                  unhealthyPodEvictionPolicy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  currentHealthy = std.number.Integer,
                  desiredHealthy = std.number.Integer,
                  disruptedPods =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."719"
                        },
                  disruptionsAllowed = std.number.Integer,
                  expectedPods = std.number.Integer,
                  observedGeneration = std.number.Integer
                },
            required =
              {
                  currentHealthy = true,
                  desiredHealthy = true,
                  disruptionsAllowed = true,
                  expectedPods = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { clusterRoleSelectors = js2n.array.ArrayOf refs.oneOf."706" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  aggregationRule = refs.oneOf."493",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRole |] ],
                  metadata = refs.oneOf."711",
                  rules = js2n.array.ArrayOf refs.oneOf."498"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleBinding |] ],
                  metadata = refs.oneOf."711",
                  roleRef = refs.oneOf."503",
                  subjects = js2n.array.ArrayOf refs.oneOf."504"
                },
            required = { roleRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."495",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleBindingList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."494",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  nonResourceURLs = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Role |] ],
                  metadata = refs.oneOf."711",
                  rules = js2n.array.ArrayOf refs.oneOf."498"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleBinding |] ],
                  metadata = refs.oneOf."711",
                  roleRef = refs.oneOf."503",
                  subjects = js2n.array.ArrayOf refs.oneOf."504"
                },
            required = { roleRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."500",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleBindingList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."499",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiGroup = String, kind = String, name = String },
            required = { apiGroup = true, kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  data = refs.oneOf."721",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."533",
                  pool = String,
                  shareID = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationTimestamp = refs.oneOf."719",
                  devices = refs.oneOf."515",
                  nodeSelector = refs.oneOf."298"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  "default" = std.contract.any_of [ Number, String ],
                  validRange = refs.oneOf."509",
                  validValues =
                    js2n.array.ArrayOf (std.contract.any_of [ Number, String ])
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  max = std.contract.any_of [ Number, String ],
                  min = std.contract.any_of [ Number, String ],
                  step = std.contract.any_of [ Number, String ]
                },
            required = { min = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."511"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  allowMultipleAllocations = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."516"
                        },
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  bindsToNode = Bool,
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."517"
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."525",
                  name = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  taints = js2n.array.ArrayOf refs.oneOf."530"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."534",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."514",
                  results = js2n.array.ArrayOf refs.oneOf."527"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requestPolicy = refs.oneOf."508",
                  value = std.contract.any_of [ Number, String ]
                },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."519",
                  constraints = js2n.array.ArrayOf refs.oneOf."524",
                  requests = js2n.array.ArrayOf refs.oneOf."526"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."534",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."523"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."534" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."520",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."521",
                  extendedResourceName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."528"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinctAttribute = String,
                  matchAttribute = String,
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."511"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exactly = refs.oneOf."532",
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."529",
                  name = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  consumedCapacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  shareID = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."531"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."507" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  capacity = refs.oneOf."510",
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."528",
                  tolerations = js2n.array.ArrayOf refs.oneOf."531"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."719",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  capacity = refs.oneOf."510",
                  count = std.number.Integer,
                  deviceClassName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."528",
                  tolerations = js2n.array.ArrayOf refs.oneOf."531"
                },
            required = { deviceClassName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."721" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."538",
                  status = refs.oneOf."539"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."535",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."518" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."506",
                  devices = js2n.array.ArrayOf refs.oneOf."505",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."536"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."542"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."540",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."538" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."546"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."544",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."513",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."543",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."512"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."547" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."719",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceTaintRule |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."552"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."550",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceTaintRuleList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { deviceSelector = refs.oneOf."553", taint = refs.oneOf."549" },
            required = { taint = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  device = String,
                  deviceClassName = String,
                  driver = String,
                  pool = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."548"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  data = refs.oneOf."721",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."582",
                  pool = String,
                  shareID = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationTimestamp = refs.oneOf."719",
                  devices = refs.oneOf."565",
                  nodeSelector = refs.oneOf."298"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  allowMultipleAllocations = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."566"
                        },
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  bindsToNode = Bool,
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."567"
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."575",
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  taints = js2n.array.ArrayOf refs.oneOf."580"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  "default" = std.contract.any_of [ Number, String ],
                  validRange = refs.oneOf."559",
                  validValues =
                    js2n.array.ArrayOf (std.contract.any_of [ Number, String ])
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  max = std.contract.any_of [ Number, String ],
                  min = std.contract.any_of [ Number, String ],
                  step = std.contract.any_of [ Number, String ]
                },
            required = { min = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."561"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { basic = refs.oneOf."556", name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."583",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."564",
                  results = js2n.array.ArrayOf refs.oneOf."577"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requestPolicy = refs.oneOf."558",
                  value = std.contract.any_of [ Number, String ]
                },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."569",
                  constraints = js2n.array.ArrayOf refs.oneOf."574",
                  requests = js2n.array.ArrayOf refs.oneOf."576"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."583",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."573"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."583" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."570",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."571",
                  extendedResourceName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."578"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinctAttribute = String,
                  matchAttribute = String,
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."561"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  capacity = refs.oneOf."560",
                  count = std.number.Integer,
                  deviceClassName = String,
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."579",
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."578",
                  tolerations = js2n.array.ArrayOf refs.oneOf."581"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  consumedCapacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  shareID = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."581"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."557" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  capacity = refs.oneOf."560",
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."578",
                  tolerations = js2n.array.ArrayOf refs.oneOf."581"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."719",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."721" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."587",
                  status = refs.oneOf."588"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."584",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."568" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."555",
                  devices = js2n.array.ArrayOf refs.oneOf."554",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."585"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."591"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."589",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."587" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."595"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."593",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."563",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."592",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."562"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."701",
                  data = refs.oneOf."721",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."624",
                  pool = String,
                  shareID = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationTimestamp = refs.oneOf."719",
                  devices = refs.oneOf."606",
                  nodeSelector = refs.oneOf."298"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  "default" = std.contract.any_of [ Number, String ],
                  validRange = refs.oneOf."600",
                  validValues =
                    js2n.array.ArrayOf (std.contract.any_of [ Number, String ])
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  max = std.contract.any_of [ Number, String ],
                  min = std.contract.any_of [ Number, String ],
                  step = std.contract.any_of [ Number, String ]
                },
            required = { min = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."602"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  allowMultipleAllocations = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."607"
                        },
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  bindsToNode = Bool,
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."608"
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."616",
                  name = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  taints = js2n.array.ArrayOf refs.oneOf."621"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."625",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."605",
                  results = js2n.array.ArrayOf refs.oneOf."618"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  requestPolicy = refs.oneOf."599",
                  value = std.contract.any_of [ Number, String ]
                },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."610",
                  constraints = js2n.array.ArrayOf refs.oneOf."615",
                  requests = js2n.array.ArrayOf refs.oneOf."617"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."625",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."614"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."625" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."611",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."612",
                  extendedResourceName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."619"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinctAttribute = String,
                  matchAttribute = String,
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."602"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exactly = refs.oneOf."623",
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."620",
                  name = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  bindingConditions = js2n.array.ArrayOf String,
                  bindingFailureConditions = js2n.array.ArrayOf String,
                  consumedCapacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  shareID = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."622"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."598" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  capacity = refs.oneOf."601",
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."619",
                  tolerations = js2n.array.ArrayOf refs.oneOf."622"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."719",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  capacity = refs.oneOf."601",
                  count = std.number.Integer,
                  deviceClassName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."619",
                  tolerations = js2n.array.ArrayOf refs.oneOf."622"
                },
            required = { deviceClassName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."721" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."629",
                  status = refs.oneOf."630"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."626",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."609" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."597",
                  devices = js2n.array.ArrayOf refs.oneOf."596",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."627"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."633"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."631",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."711", spec = refs.oneOf."629" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."637"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."635",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."604",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."298",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."634",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."603"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  description = String,
                  globalDefault = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PriorityClass |] ],
                  metadata = refs.oneOf."711",
                  preemptionPolicy = String,
                  value = std.number.Integer
                },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."638",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PriorityClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIDriver |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."642"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."640",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIDriverList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attachRequired = Bool,
                  fsGroupPolicy = String,
                  nodeAllocatableUpdatePeriodSeconds = std.number.Integer,
                  podInfoOnMount = Bool,
                  requiresRepublish = Bool,
                  seLinuxMount = Bool,
                  storageCapacity = Bool,
                  tokenRequests = js2n.array.ArrayOf refs.oneOf."651",
                  volumeLifecycleModes = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSINode |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."646"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocatable = refs.oneOf."660",
                  name = String,
                  nodeID = String,
                  topologyKeys = js2n.array.ArrayOf String
                },
            required = { name = true, nodeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."643",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSINodeList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { drivers = js2n.array.ArrayOf refs.oneOf."644" },
            required = { drivers = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  capacity = std.contract.any_of [ Number, String ],
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIStorageCapacity |] ],
                  maximumVolumeSize = std.contract.any_of [ Number, String ],
                  metadata = refs.oneOf."711",
                  nodeTopology = refs.oneOf."706",
                  storageClassName = String
                },
            required = { storageClassName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."647",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIStorageCapacityList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowVolumeExpansion = Bool,
                  allowedTopologies = js2n.array.ArrayOf refs.oneOf."394",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClass |] ],
                  metadata = refs.oneOf."711",
                  mountOptions = js2n.array.ArrayOf String,
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  provisioner = String,
                  reclaimPolicy = String,
                  volumeBindingMode = String
                },
            required = { provisioner = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."649",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClassList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { audience = String, expirationSeconds = std.number.Integer },
            required = { audience = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttachment |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."655",
                  status = refs.oneOf."656"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."652",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttachmentList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  inlineVolumeSpec = refs.oneOf."316",
                  persistentVolumeName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attacher = String,
                  nodeName = String,
                  source = refs.oneOf."654"
                },
            required = { attacher = true, nodeName = true, source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attachError = refs.oneOf."659",
                  attached = Bool,
                  attachmentMetadata =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  detachError = refs.oneOf."659"
                },
            required = { attached = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  driverName = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttributesClass |] ],
                  metadata = refs.oneOf."711",
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driverName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."657",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  errorCode = std.number.Integer,
                  message = String,
                  time = refs.oneOf."719"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { count = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  driverName = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttributesClass |] ],
                  metadata = refs.oneOf."711",
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driverName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."661",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  driverName = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttributesClass |] ],
                  metadata = refs.oneOf."711",
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driverName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."663",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { group = String, resource = String, version = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastUpdateTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'StorageVersionMigration |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."669",
                  status = refs.oneOf."670"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."667",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'StorageVersionMigrationList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { continueToken = String, resource = refs.oneOf."665" },
            required = { resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."666",
                  resourceVersion = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  description = String,
                  format = String,
                  jsonPath = String,
                  name = String,
                  "priority" = std.number.Integer,
                  type = String
                },
            required = { jsonPath = true, name = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { strategy = String, webhook = refs.oneOf."694" },
            required = { strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CustomResourceDefinition |]
                        ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."677",
                  status = refs.oneOf."678"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."673",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CustomResourceDefinitionList |]
                        ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  categories = js2n.array.ArrayOf String,
                  kind = String,
                  listKind = String,
                  plural = String,
                  shortNames = js2n.array.ArrayOf String,
                  singular = String
                },
            required = { kind = true, plural = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conversion = refs.oneOf."672",
                  group = String,
                  names = refs.oneOf."676",
                  preserveUnknownFields = Bool,
                  scope = String,
                  versions = js2n.array.ArrayOf refs.oneOf."679"
                },
            required =
              { group = true, names = true, scope = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  acceptedNames = refs.oneOf."676",
                  conditions = js2n.array.ArrayOf refs.oneOf."674",
                  storedVersions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  additionalPrinterColumns =
                    js2n.array.ArrayOf refs.oneOf."671",
                  deprecated = Bool,
                  deprecationWarning = String,
                  name = String,
                  schema = refs.oneOf."683",
                  selectableFields = js2n.array.ArrayOf refs.oneOf."690",
                  served = Bool,
                  storage = Bool,
                  subresources = refs.oneOf."682"
                },
            required = { name = true, served = true, storage = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelectorPath = String,
                  specReplicasPath = String,
                  statusReplicasPath = String
                },
            required = { specReplicasPath = true, statusReplicasPath = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties =
              { scale = refs.oneOf."680", status = refs.oneOf."681" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { openAPIV3Schema = refs.oneOf."686" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { description = String, url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        js2n.record.Record
          {
            properties =
              {
                  "$ref" = String,
                  "$schema" = String,
                  additionalItems =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  additionalProperties =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  allOf = js2n.array.ArrayOf refs.oneOf."686",
                  anyOf = js2n.array.ArrayOf refs.oneOf."686",
                  "default" =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  definitions =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."686"
                        },
                  dependencies =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some
                                (std.contract.any_of
                                  [
                                    js2n.Null,
                                    Bool,
                                    { _ | Dyn },
                                    Array Dyn,
                                    Number,
                                    String
                                  ])
                        },
                  description = String,
                  enum =
                    js2n.array.ArrayOf
                        (std.contract.any_of
                          [
                            js2n.Null,
                            Bool,
                            { _ | Dyn },
                            Array Dyn,
                            Number,
                            String
                          ]),
                  example =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  exclusiveMaximum = Bool,
                  exclusiveMinimum = Bool,
                  externalDocs = refs.oneOf."684",
                  format = String,
                  id = String,
                  items =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  maxItems = std.number.Integer,
                  maxLength = std.number.Integer,
                  maxProperties = std.number.Integer,
                  maximum = Number,
                  minItems = std.number.Integer,
                  minLength = std.number.Integer,
                  minProperties = std.number.Integer,
                  minimum = Number,
                  multipleOf = Number,
                  not = refs.oneOf."686",
                  nullable = Bool,
                  oneOf = js2n.array.ArrayOf refs.oneOf."686",
                  pattern = String,
                  patternProperties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."686"
                        },
                  properties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."686"
                        },
                  required = js2n.array.ArrayOf String,
                  title = String,
                  type = String,
                  uniqueItems = Bool,
                  x-kubernetes-embedded-resource = Bool,
                  x-kubernetes-int-or-string = Bool,
                  x-kubernetes-list-map-keys = js2n.array.ArrayOf String,
                  x-kubernetes-list-type = String,
                  x-kubernetes-map-type = String,
                  x-kubernetes-preserve-unknown-fields = Bool,
                  x-kubernetes-validations = js2n.array.ArrayOf refs.oneOf."692"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        js2n.record.Record
          {
            properties = { jsonPath = String },
            required = { jsonPath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  path = String,
                  port = std.number.Integer
                },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldPath = String,
                  message = String,
                  messageExpression = String,
                  optionalOldSelf = Bool,
                  reason = String,
                  rule = String
                },
            required = { rule = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { caBundle = String, service = refs.oneOf."691", url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clientConfig = refs.oneOf."693",
                  conversionReviewVersions = js2n.array.ArrayOf String
                },
            required = { conversionReviewVersions = true },
            patterns = {},
            additional = 'None
          },
        std.contract.any_of [ Number, String ],
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIGroup |] ],
                  name = String,
                  preferredVersion = refs.oneOf."705",
                  serverAddressByClientCIDRs =
                    js2n.array.ArrayOf refs.oneOf."715",
                  versions = js2n.array.ArrayOf refs.oneOf."705"
                },
            required = { name = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  groups = js2n.array.ArrayOf refs.oneOf."696",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIGroupList |] ]
                },
            required = { groups = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  categories = js2n.array.ArrayOf String,
                  group = String,
                  kind = String,
                  name = String,
                  namespaced = Bool,
                  shortNames = js2n.array.ArrayOf String,
                  singularName = String,
                  storageVersionHash = String,
                  verbs = js2n.array.ArrayOf String,
                  version = String
                },
            required =
              {
                  kind = true,
                  name = true,
                  namespaced = true,
                  singularName = true,
                  verbs = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  groupVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIResourceList |] ],
                  resources = js2n.array.ArrayOf refs.oneOf."698"
                },
            required = { groupVersion = true, resources = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIVersions |] ],
                  serverAddressByClientCIDRs =
                    js2n.array.ArrayOf refs.oneOf."715",
                  versions = js2n.array.ArrayOf String
                },
            required = { serverAddressByClientCIDRs = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required =
              {
                  lastTransitionTime = true,
                  message = true,
                  reason = true,
                  status = true,
                  type = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  dryRun = js2n.array.ArrayOf String,
                  gracePeriodSeconds = std.number.Integer,
                  ignoreStoreReadErrorWithClusterBreakingPotential = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeleteOptions |] ],
                  orphanDependents = Bool,
                  preconditions = refs.oneOf."714",
                  propagationPolicy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties = { groupVersion = String, version = String },
            required = { groupVersion = true, version = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."707",
                  matchLabels =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  continue = String,
                  remainingItemCount = std.number.Integer,
                  resourceVersion = String,
                  selfLink = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  fieldsType = String,
                  fieldsV1 = refs.oneOf."704",
                  manager = String,
                  operation = String,
                  subresource = String,
                  time = refs.oneOf."719"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        String,
        js2n.record.Record
          {
            properties =
              {
                  annotations =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  creationTimestamp = refs.oneOf."719",
                  deletionGracePeriodSeconds = std.number.Integer,
                  deletionTimestamp = refs.oneOf."719",
                  finalizers = js2n.array.ArrayOf String,
                  generateName = String,
                  generation = std.number.Integer,
                  labels =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  managedFields = js2n.array.ArrayOf refs.oneOf."709",
                  name = String,
                  namespace = String,
                  ownerReferences = js2n.array.ArrayOf refs.oneOf."712",
                  resourceVersion = String,
                  selfLink = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  blockOwnerDeletion = Bool,
                  controller = Bool,
                  kind = String,
                  name = String,
                  uid = String
                },
            required =
              { apiVersion = true, kind = true, name = true, uid = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties = { resourceVersion = String, uid = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { clientCIDR = String, serverAddress = String },
            required = { clientCIDR = true, serverAddress = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  code = std.number.Integer,
                  details = refs.oneOf."718",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Status |] ],
                  message = String,
                  metadata = refs.oneOf."708",
                  reason = String,
                  status = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { field = String, message = String, reason = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  causes = js2n.array.ArrayOf refs.oneOf."717",
                  group = String,
                  kind = String,
                  name = String,
                  retryAfterSeconds = std.number.Integer,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        String,
        js2n.record.Record
          {
            properties = { object = refs.oneOf."721", type = String },
            required = { object = true, type = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        std.contract.any_of [ String, std.number.Integer ],
        js2n.record.Record
          {
            properties =
              {
                  buildDate = String,
                  compiler = String,
                  emulationMajor = String,
                  emulationMinor = String,
                  gitCommit = String,
                  gitTreeState = String,
                  gitVersion = String,
                  goVersion = String,
                  major = String,
                  minCompatibilityMajor = String,
                  minCompatibilityMinor = String,
                  minor = String,
                  platform = String
                },
            required =
              {
                  buildDate = true,
                  compiler = true,
                  gitCommit = true,
                  gitTreeState = true,
                  gitVersion = true,
                  goVersion = true,
                  major = true,
                  minor = true,
                  platform = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIService |] ],
                  metadata = refs.oneOf."711",
                  spec = refs.oneOf."727",
                  status = refs.oneOf."728"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."719",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."724",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIServiceList |] ],
                  metadata = refs.oneOf."708"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  caBundle = String,
                  group = String,
                  groupPriorityMinimum = std.number.Integer,
                  insecureSkipTLSVerify = Bool,
                  service = refs.oneOf."729",
                  version = String,
                  versionPriority = std.number.Integer
                },
            required = { groupPriorityMinimum = true, versionPriority = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."725" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { name = String, namespace = String, port = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          }
      ]