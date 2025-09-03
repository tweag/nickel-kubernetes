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
      oneOf."101" =
        { audiences | Array String | optional, token | String | optional },
      oneOf."102" =
        {
            audiences | Array String | optional,
            authenticated | Bool | optional,
            error | String | optional,
            user | refs.oneOf."103" | { _ | Dyn } | optional
          },
      oneOf."103" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            uid | String | optional,
            username | String | optional
          },
      oneOf."105" = { userInfo | refs.oneOf."103" | { _ | Dyn } | optional },
      oneOf."106" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."611", { _ | Dyn } ])
              | optional
          },
      oneOf."107" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."615", { _ | Dyn } ])
              | optional
          },
      oneOf."109" = { path | String | optional, verb | String | optional },
      oneOf."11" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."110" =
        { nonResourceURLs | Array String | optional, verbs | Array String },
      oneOf."111" =
        {
            fieldSelector | refs.oneOf."106" | { _ | Dyn } | optional,
            group | String | optional,
            labelSelector | refs.oneOf."107" | { _ | Dyn } | optional,
            name | String | optional,
            namespace | String | optional,
            resource | String | optional,
            subresource | String | optional,
            verb | String | optional,
            version | String | optional
          },
      oneOf."112" =
        {
            apiGroups | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."114" =
        {
            nonResourceAttributes | refs.oneOf."109" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."111" | { _ | Dyn } | optional
          },
      oneOf."116" = { namespace | String | optional },
      oneOf."118" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            nonResourceAttributes | refs.oneOf."109" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."111" | { _ | Dyn } | optional,
            uid | String | optional,
            user | String | optional
          },
      oneOf."119" =
        {
            allowed | Bool,
            denied | Bool | optional,
            evaluationError | String | optional,
            reason | String | optional
          },
      oneOf."12" =
        {
            expressionWarnings
              | Array (std.contract.Sequence [ refs.oneOf."1", { _ | Dyn } ])
              | optional
          },
      oneOf."120" =
        {
            evaluationError | String | optional,
            incomplete | Bool,
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."110", { _ | Dyn } ]),
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."112", { _ | Dyn } ])
          },
      oneOf."121" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."122" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."124" | { _ | Dyn } | optional,
            status | refs.oneOf."125" | { _ | Dyn } | optional
          },
      oneOf."124" =
        {
            maxReplicas | std.number.Integer,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."121" | { _ | Dyn },
            targetCPUUtilizationPercentage | std.number.Integer | optional
          },
      oneOf."125" =
        {
            currentCPUUtilizationPercentage | std.number.Integer | optional,
            currentReplicas | std.number.Integer,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."627" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."127" = { replicas | std.number.Integer | optional },
      oneOf."128" =
        { replicas | std.number.Integer, selector | String | optional },
      oneOf."129" =
        {
            container | String,
            name | String,
            target | refs.oneOf."145" | { _ | Dyn }
          },
      oneOf."13" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."18" | { _ | Dyn } | optional,
            status | refs.oneOf."19" | { _ | Dyn } | optional
          },
      oneOf."130" =
        {
            container | String,
            current | refs.oneOf."146" | { _ | Dyn },
            name | String
          },
      oneOf."131" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."132" =
        {
            metric | refs.oneOf."142" | { _ | Dyn },
            target | refs.oneOf."145" | { _ | Dyn }
          },
      oneOf."133" =
        {
            current | refs.oneOf."146" | { _ | Dyn },
            metric | refs.oneOf."142" | { _ | Dyn }
          },
      oneOf."134" =
        {
            periodSeconds | std.number.Integer,
            type | String,
            value | std.number.Integer
          },
      oneOf."135" =
        {
            policies
              | Array (std.contract.Sequence [ refs.oneOf."134", { _ | Dyn } ])
              | optional,
            selectPolicy | String | optional,
            stabilizationWindowSeconds | std.number.Integer | optional
          },
      oneOf."136" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."140" | { _ | Dyn } | optional,
            status | refs.oneOf."141" | { _ | Dyn } | optional
          },
      oneOf."137" =
        {
            scaleDown | refs.oneOf."135" | { _ | Dyn } | optional,
            scaleUp | refs.oneOf."135" | { _ | Dyn } | optional
          },
      oneOf."138" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."14" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."16" | { _ | Dyn } | optional
          },
      oneOf."140" =
        {
            behavior | refs.oneOf."137" | { _ | Dyn } | optional,
            maxReplicas | std.number.Integer,
            metrics
              | Array (std.contract.Sequence [ refs.oneOf."143", { _ | Dyn } ])
              | optional,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."131" | { _ | Dyn }
          },
      oneOf."141" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."138", { _ | Dyn } ])
              | optional,
            currentMetrics
              | Array (std.contract.Sequence [ refs.oneOf."144", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."627" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."142" =
        { name | String, selector | refs.oneOf."614" | { _ | Dyn } | optional },
      oneOf."143" =
        {
            containerResource | refs.oneOf."129" | { _ | Dyn } | optional,
            external | refs.oneOf."132" | { _ | Dyn } | optional,
            object | refs.oneOf."147" | { _ | Dyn } | optional,
            pods | refs.oneOf."149" | { _ | Dyn } | optional,
            resource | refs.oneOf."151" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."144" =
        {
            containerResource | refs.oneOf."130" | { _ | Dyn } | optional,
            external | refs.oneOf."133" | { _ | Dyn } | optional,
            object | refs.oneOf."148" | { _ | Dyn } | optional,
            pods | refs.oneOf."150" | { _ | Dyn } | optional,
            resource | refs.oneOf."152" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."145" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."603" | optional,
            type | String,
            value | refs.oneOf."603" | optional
          },
      oneOf."146" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."603" | optional,
            value | refs.oneOf."603" | optional
          },
      oneOf."147" =
        {
            describedObject | refs.oneOf."131" | { _ | Dyn },
            metric | refs.oneOf."142" | { _ | Dyn },
            target | refs.oneOf."145" | { _ | Dyn }
          },
      oneOf."148" =
        {
            current | refs.oneOf."146" | { _ | Dyn },
            describedObject | refs.oneOf."131" | { _ | Dyn },
            metric | refs.oneOf."142" | { _ | Dyn }
          },
      oneOf."149" =
        {
            metric | refs.oneOf."142" | { _ | Dyn },
            target | refs.oneOf."145" | { _ | Dyn }
          },
      oneOf."150" =
        {
            current | refs.oneOf."146" | { _ | Dyn },
            metric | refs.oneOf."142" | { _ | Dyn }
          },
      oneOf."151" = { name | String, target | refs.oneOf."145" | { _ | Dyn } },
      oneOf."152" = { current | refs.oneOf."146" | { _ | Dyn }, name | String },
      oneOf."153" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CronJob |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."155" | { _ | Dyn } | optional,
            status | refs.oneOf."156" | { _ | Dyn } | optional
          },
      oneOf."155" =
        {
            concurrencyPolicy | String | optional,
            failedJobsHistoryLimit | std.number.Integer | optional,
            jobTemplate | refs.oneOf."162" | { _ | Dyn },
            schedule | String,
            startingDeadlineSeconds | std.number.Integer | optional,
            successfulJobsHistoryLimit | std.number.Integer | optional,
            suspend | Bool | optional,
            timeZone | String | optional
          },
      oneOf."156" =
        {
            active
              | Array (std.contract.Sequence [ refs.oneOf."295", { _ | Dyn } ])
              | optional,
            lastScheduleTime | refs.oneOf."627" | String | optional,
            lastSuccessfulTime | refs.oneOf."627" | String | optional
          },
      oneOf."157" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Job |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."160" | { _ | Dyn } | optional,
            status | refs.oneOf."161" | { _ | Dyn } | optional
          },
      oneOf."158" =
        {
            lastProbeTime | refs.oneOf."627" | String | optional,
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
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
            activeDeadlineSeconds | std.number.Integer | optional,
            backoffLimit | std.number.Integer | optional,
            backoffLimitPerIndex | std.number.Integer | optional,
            completionMode | String | optional,
            completions | std.number.Integer | optional,
            managedBy | String | optional,
            manualSelector | Bool | optional,
            maxFailedIndexes | std.number.Integer | optional,
            parallelism | std.number.Integer | optional,
            podFailurePolicy | refs.oneOf."163" | { _ | Dyn } | optional,
            podReplacementPolicy | String | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional,
            successPolicy | refs.oneOf."167" | { _ | Dyn } | optional,
            suspend | Bool | optional,
            template | refs.oneOf."327" | { _ | Dyn },
            ttlSecondsAfterFinished | std.number.Integer | optional
          },
      oneOf."161" =
        {
            active | std.number.Integer | optional,
            completedIndexes | String | optional,
            completionTime | refs.oneOf."627" | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."158", { _ | Dyn } ])
              | optional,
            failed | std.number.Integer | optional,
            failedIndexes | String | optional,
            ready | std.number.Integer | optional,
            startTime | refs.oneOf."627" | String | optional,
            succeeded | std.number.Integer | optional,
            terminating | std.number.Integer | optional,
            uncountedTerminatedPods | refs.oneOf."169" | { _ | Dyn } | optional
          },
      oneOf."162" =
        {
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."160" | { _ | Dyn } | optional
          },
      oneOf."163" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."166", { _ | Dyn } ])
          },
      oneOf."164" =
        {
            containerName | String | optional,
            operator | String,
            values | Array std.number.Integer
          },
      oneOf."165" = { status | String, type | String },
      oneOf."166" =
        {
            action | String,
            onExitCodes | refs.oneOf."164" | { _ | Dyn } | optional,
            onPodConditions
              | Array (std.contract.Sequence [ refs.oneOf."165", { _ | Dyn } ])
              | optional
          },
      oneOf."167" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."168", { _ | Dyn } ])
          },
      oneOf."168" =
        {
            succeededCount | std.number.Integer | optional,
            succeededIndexes | String | optional
          },
      oneOf."169" =
        {
            failed | Array String | optional,
            succeeded | Array String | optional
          },
      oneOf."170" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CertificateSigningRequest |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."173" | { _ | Dyn },
            status | refs.oneOf."174" | { _ | Dyn } | optional
          },
      oneOf."171" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            lastUpdateTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."173" =
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
      oneOf."174" =
        {
            certificate | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."171", { _ | Dyn } ])
              | optional
          },
      oneOf."175" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterTrustBundle |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."177" | { _ | Dyn }
          },
      oneOf."177" = { signerName | String | optional, trustBundle | String },
      oneOf."178" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Lease |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."180" | { _ | Dyn } | optional
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
      oneOf."180" =
        {
            acquireTime | refs.oneOf."618" | String | optional,
            holderIdentity | String | optional,
            leaseDurationSeconds | std.number.Integer | optional,
            leaseTransitions | std.number.Integer | optional,
            preferredHolder | String | optional,
            renewTime | refs.oneOf."618" | String | optional,
            strategy | String | optional
          },
      oneOf."181" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LeaseCandidate |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."183" | { _ | Dyn } | optional
          },
      oneOf."183" =
        {
            binaryVersion | String,
            emulationVersion | String | optional,
            leaseName | String,
            pingTime | refs.oneOf."618" | String | optional,
            renewTime | refs.oneOf."618" | String | optional,
            strategy | String
          },
      oneOf."184" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."185" =
        {
            nodeAffinity | refs.oneOf."279" | { _ | Dyn } | optional,
            podAffinity | refs.oneOf."309" | { _ | Dyn } | optional,
            podAntiAffinity | refs.oneOf."311" | { _ | Dyn } | optional
          },
      oneOf."186" = { localhostProfile | String | optional, type | String },
      oneOf."187" = { devicePath | String, name | String },
      oneOf."188" =
        {
            cachingMode | String | optional,
            diskName | String,
            diskURI | String,
            fsType | String | optional,
            kind | String | optional,
            readOnly | Bool | optional
          },
      oneOf."189" =
        {
            readOnly | Bool | optional,
            secretName | String,
            secretNamespace | String | optional,
            shareName | String
          },
      oneOf."19" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            typeChecking | refs.oneOf."12" | { _ | Dyn } | optional
          },
      oneOf."190" =
        { readOnly | Bool | optional, secretName | String, shareName | String },
      oneOf."192" =
        {
            controllerExpandSecretRef
              | refs.oneOf."361"
              | { _ | Dyn }
              | optional,
            controllerPublishSecretRef
              | refs.oneOf."361"
              | { _ | Dyn }
              | optional,
            driver | String,
            fsType | String | optional,
            nodeExpandSecretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            nodePublishSecretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            nodeStageSecretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional,
            volumeHandle | String
          },
      oneOf."193" =
        {
            driver | String,
            fsType | String | optional,
            nodePublishSecretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional
          },
      oneOf."194" =
        { add | Array String | optional, drop | Array String | optional },
      oneOf."195" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."196" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."197" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."198" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."199" = { timeoutSeconds | std.number.Integer | optional },
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
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."200" =
        {
            labelSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            name | String | optional,
            "optional" | Bool | optional,
            path | String,
            signerName | String | optional
          },
      oneOf."201" =
        {
            error | String | optional,
            message | String | optional,
            status | String,
            type | String
          },
      oneOf."202" =
        {
            apiVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."201", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ComponentStatus |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional
          },
      oneOf."204" =
        {
            apiVersion | String | optional,
            binaryData | { _ | String } | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'ConfigMap |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional
          },
      oneOf."205" = { name | String | optional, "optional" | Bool | optional },
      oneOf."206" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."208" =
        {
            kubeletConfigKey | String,
            name | String,
            namespace | String,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."209" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."258", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."21" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."20", { _ | Dyn } ])
              | optional
          },
      oneOf."210" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."258", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."211" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."232", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."231", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."259" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."213", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."214", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."348" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            securityContext | refs.oneOf."363" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."386", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."387", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."212" =
        {
            names | Array String | optional,
            sizeBytes | std.number.Integer | optional
          },
      oneOf."213" =
        {
            containerPort | std.number.Integer,
            hostIP | String | optional,
            hostPort | std.number.Integer | optional,
            name | String | optional,
            protocol | String | optional
          },
      oneOf."214" = { resourceName | String, restartPolicy | String },
      oneOf."215" =
        {
            running | refs.oneOf."216" | { _ | Dyn } | optional,
            terminated | refs.oneOf."217" | { _ | Dyn } | optional,
            waiting | refs.oneOf."218" | { _ | Dyn } | optional
          },
      oneOf."216" = { startedAt | refs.oneOf."627" | String | optional },
      oneOf."217" =
        {
            containerID | String | optional,
            exitCode | std.number.Integer,
            finishedAt | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            signal | std.number.Integer | optional,
            startedAt | refs.oneOf."627" | String | optional
          },
      oneOf."218" = { message | String | optional, reason | String | optional },
      oneOf."219" =
        {
            allocatedResources | { _ | refs.oneOf."603" } | optional,
            allocatedResourcesStatus
              | Array (std.contract.Sequence [ refs.oneOf."349", { _ | Dyn } ])
              | optional,
            containerID | String | optional,
            image | String,
            imageID | String,
            lastState | refs.oneOf."215" | { _ | Dyn } | optional,
            name | String,
            ready | Bool,
            resources | refs.oneOf."348" | { _ | Dyn } | optional,
            restartCount | std.number.Integer,
            started | Bool | optional,
            state | refs.oneOf."215" | { _ | Dyn } | optional,
            user | refs.oneOf."220" | { _ | Dyn } | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."388", { _ | Dyn } ])
              | optional
          },
      oneOf."220" = { linux | refs.oneOf."265" | { _ | Dyn } | optional },
      oneOf."221" = { Port | std.number.Integer },
      oneOf."222" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."223", { _ | Dyn } ])
              | optional
          },
      oneOf."223" =
        {
            fieldRef | refs.oneOf."294" | { _ | Dyn } | optional,
            mode | std.number.Integer | optional,
            path | String,
            resourceFieldRef | refs.oneOf."342" | { _ | Dyn } | optional
          },
      oneOf."224" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."223", { _ | Dyn } ])
              | optional
          },
      oneOf."225" =
        { medium | String | optional, sizeLimit | refs.oneOf."603" | optional },
      oneOf."226" =
        {
            hostname | String | optional,
            ip | String,
            nodeName | String | optional,
            targetRef | refs.oneOf."295" | { _ | Dyn } | optional
          },
      oneOf."227" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer,
            protocol | String | optional
          },
      oneOf."228" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."226", { _ | Dyn } ])
              | optional,
            notReadyAddresses
              | Array (std.contract.Sequence [ refs.oneOf."226", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."227", { _ | Dyn } ])
              | optional
          },
      oneOf."229" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Endpoints |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            subsets
              | Array (std.contract.Sequence [ refs.oneOf."228", { _ | Dyn } ])
              | optional
          },
      oneOf."23" =
        {
            expression | String,
            message | String | optional,
            messageExpression | String | optional,
            reason | String | optional
          },
      oneOf."231" =
        {
            configMapRef | refs.oneOf."205" | { _ | Dyn } | optional,
            prefix | String | optional,
            secretRef | refs.oneOf."357" | { _ | Dyn } | optional
          },
      oneOf."232" =
        {
            name | String,
            value | String | optional,
            valueFrom | refs.oneOf."233" | { _ | Dyn } | optional
          },
      oneOf."233" =
        {
            configMapKeyRef | refs.oneOf."206" | { _ | Dyn } | optional,
            fieldRef | refs.oneOf."294" | { _ | Dyn } | optional,
            resourceFieldRef | refs.oneOf."342" | { _ | Dyn } | optional,
            secretKeyRef | refs.oneOf."358" | { _ | Dyn } | optional
          },
      oneOf."234" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."232", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."231", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."259" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."213", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."214", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."348" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            securityContext | refs.oneOf."363" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."331" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            targetContainerName | String | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."386", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."387", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."235" =
        { volumeClaimTemplate | refs.oneOf."302" | { _ | Dyn } | optional },
      oneOf."236" =
        {
            action | String | optional,
            apiVersion | String | optional,
            count | std.number.Integer | optional,
            eventTime | refs.oneOf."618" | String | optional,
            firstTimestamp | refs.oneOf."627" | String | optional,
            involvedObject | refs.oneOf."295" | { _ | Dyn },
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            lastTimestamp | refs.oneOf."627" | String | optional,
            message | String | optional,
            metadata | refs.oneOf."619" | { _ | Dyn },
            reason | String | optional,
            related | refs.oneOf."295" | { _ | Dyn } | optional,
            reportingComponent | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."238" | { _ | Dyn } | optional,
            source | refs.oneOf."239" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."238" =
        {
            count | std.number.Integer | optional,
            lastObservedTime | refs.oneOf."618" | String | optional
          },
      oneOf."239" = { component | String | optional, host | String | optional },
      oneOf."24" = { expression | String, name | String },
      oneOf."240" = { command | Array String | optional },
      oneOf."241" =
        {
            fsType | String | optional,
            lun | std.number.Integer | optional,
            readOnly | Bool | optional,
            targetWWNs | Array String | optional,
            wwids | Array String | optional
          },
      oneOf."242" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."361" | { _ | Dyn } | optional
          },
      oneOf."243" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional
          },
      oneOf."244" =
        { datasetName | String | optional, datasetUUID | String | optional },
      oneOf."245" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            pdName | String,
            readOnly | Bool | optional
          },
      oneOf."246" = { port | std.number.Integer, service | String | optional },
      oneOf."247" =
        {
            directory | String | optional,
            repository | String,
            revision | String | optional
          },
      oneOf."248" =
        {
            endpoints | String,
            endpointsNamespace | String | optional,
            path | String,
            readOnly | Bool | optional
          },
      oneOf."249" =
        { endpoints | String, path | String, readOnly | Bool | optional },
      oneOf."25" =
        {
            caBundle | String | optional,
            service | refs.oneOf."11" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."250" =
        {
            host | String | optional,
            httpHeaders
              | Array (std.contract.Sequence [ refs.oneOf."251", { _ | Dyn } ])
              | optional,
            path | String | optional,
            port | refs.oneOf."630",
            scheme | String | optional
          },
      oneOf."251" = { name | String, value | String },
      oneOf."252" = { hostnames | Array String | optional, ip | String },
      oneOf."253" = { ip | String },
      oneOf."254" = { path | String, type | String | optional },
      oneOf."255" =
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
            secretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."256" =
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
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."257" =
        { pullPolicy | String | optional, reference | String | optional },
      oneOf."258" =
        { key | String, mode | std.number.Integer | optional, path | String },
      oneOf."259" =
        {
            postStart | refs.oneOf."260" | { _ | Dyn } | optional,
            preStop | refs.oneOf."260" | { _ | Dyn } | optional
          },
      oneOf."26" = { expression | String | optional },
      oneOf."260" =
        {
            exec | refs.oneOf."240" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."250" | { _ | Dyn } | optional,
            sleep | refs.oneOf."373" | { _ | Dyn } | optional,
            tcpSocket | refs.oneOf."377" | { _ | Dyn } | optional
          },
      oneOf."261" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LimitRange |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."264" | { _ | Dyn } | optional
          },
      oneOf."262" =
        {
            "default" | { _ | refs.oneOf."603" } | optional,
            defaultRequest | { _ | refs.oneOf."603" } | optional,
            max | { _ | refs.oneOf."603" } | optional,
            maxLimitRequestRatio | { _ | refs.oneOf."603" } | optional,
            min | { _ | refs.oneOf."603" } | optional,
            type | String
          },
      oneOf."264" =
        {
            limits
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
          },
      oneOf."265" =
        {
            gid | std.number.Integer,
            supplementalGroups | Array std.number.Integer | optional,
            uid | std.number.Integer
          },
      oneOf."266" =
        {
            hostname | String | optional,
            ip | String | optional,
            ipMode | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."328", { _ | Dyn } ])
              | optional
          },
      oneOf."267" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."266", { _ | Dyn } ])
              | optional
          },
      oneOf."268" = { name | String | optional },
      oneOf."269" = { fsType | String | optional, path | String },
      oneOf."27" = { expression | String | optional },
      oneOf."270" =
        {
            status | String,
            targetVolumeAttributesClassName | String | optional
          },
      oneOf."271" =
        { path | String, readOnly | Bool | optional, server | String },
      oneOf."272" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Namespace |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."275" | { _ | Dyn } | optional,
            status | refs.oneOf."276" | { _ | Dyn } | optional
          },
      oneOf."273" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."275" = { finalizers | Array String | optional },
      oneOf."276" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."273", { _ | Dyn } ])
              | optional,
            phase | String | optional
          },
      oneOf."277" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Node |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."291" | { _ | Dyn } | optional,
            status | refs.oneOf."292" | { _ | Dyn } | optional
          },
      oneOf."278" = { address | String, type | String },
      oneOf."279" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."330", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | refs.oneOf."288"
              | { _ | Dyn }
              | optional
          },
      oneOf."28" = { expression | String, name | String },
      oneOf."280" =
        {
            lastHeartbeatTime | refs.oneOf."627" | String | optional,
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."281" = { configMap | refs.oneOf."208" | { _ | Dyn } | optional },
      oneOf."282" =
        {
            active | refs.oneOf."281" | { _ | Dyn } | optional,
            assigned | refs.oneOf."281" | { _ | Dyn } | optional,
            error | String | optional,
            lastKnownGood | refs.oneOf."281" | { _ | Dyn } | optional
          },
      oneOf."283" =
        { kubeletEndpoint | refs.oneOf."221" | { _ | Dyn } | optional },
      oneOf."284" = { supplementalGroupsPolicy | Bool | optional },
      oneOf."286" =
        {
            features | refs.oneOf."287" | { _ | Dyn } | optional,
            name | String | optional
          },
      oneOf."287" =
        {
            recursiveReadOnlyMounts | Bool | optional,
            userNamespaces | Bool | optional
          },
      oneOf."288" =
        {
            nodeSelectorTerms
              | Array (std.contract.Sequence [ refs.oneOf."290", { _ | Dyn } ])
          },
      oneOf."289" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."29" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional
          },
      oneOf."290" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."289", { _ | Dyn } ])
              | optional,
            matchFields
              | Array (std.contract.Sequence [ refs.oneOf."289", { _ | Dyn } ])
              | optional
          },
      oneOf."291" =
        {
            configSource | refs.oneOf."281" | { _ | Dyn } | optional,
            externalID | String | optional,
            podCIDR | String | optional,
            podCIDRs | Array String | optional,
            providerID | String | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."378", { _ | Dyn } ])
              | optional,
            unschedulable | Bool | optional
          },
      oneOf."292" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."278", { _ | Dyn } ])
              | optional,
            allocatable | { _ | refs.oneOf."603" } | optional,
            capacity | { _ | refs.oneOf."603" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."280", { _ | Dyn } ])
              | optional,
            config | refs.oneOf."282" | { _ | Dyn } | optional,
            daemonEndpoints | refs.oneOf."283" | { _ | Dyn } | optional,
            features | refs.oneOf."284" | { _ | Dyn } | optional,
            images
              | Array (std.contract.Sequence [ refs.oneOf."212", { _ | Dyn } ])
              | optional,
            nodeInfo | refs.oneOf."293" | { _ | Dyn } | optional,
            phase | String | optional,
            runtimeHandlers
              | Array (std.contract.Sequence [ refs.oneOf."286", { _ | Dyn } ])
              | optional,
            volumesAttached
              | Array (std.contract.Sequence [ refs.oneOf."187", { _ | Dyn } ])
              | optional,
            volumesInUse | Array String | optional
          },
      oneOf."293" =
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
            systemUUID | String
          },
      oneOf."294" = { apiVersion | String | optional, fieldPath | String },
      oneOf."295" =
        {
            apiVersion | String | optional,
            fieldPath | String | optional,
            kind | String | optional,
            name | String | optional,
            namespace | String | optional,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."296" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PersistentVolume |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."305" | { _ | Dyn } | optional,
            status | refs.oneOf."306" | { _ | Dyn } | optional
          },
      oneOf."297" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PersistentVolumeClaim |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."300" | { _ | Dyn } | optional,
            status | refs.oneOf."301" | { _ | Dyn } | optional
          },
      oneOf."298" =
        {
            lastProbeTime | refs.oneOf."627" | String | optional,
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."3" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."7", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."614" | { _ | Dyn } | optional,
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
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."35" | { _ | Dyn } | optional
          },
      oneOf."300" =
        {
            accessModes | Array String | optional,
            dataSource | refs.oneOf."383" | { _ | Dyn } | optional,
            dataSourceRef | refs.oneOf."384" | { _ | Dyn } | optional,
            resources | refs.oneOf."391" | { _ | Dyn } | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            volumeName | String | optional
          },
      oneOf."301" =
        {
            accessModes | Array String | optional,
            allocatedResourceStatuses | { _ | String } | optional,
            allocatedResources | { _ | refs.oneOf."603" } | optional,
            capacity | { _ | refs.oneOf."603" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."298", { _ | Dyn } ])
              | optional,
            currentVolumeAttributesClassName | String | optional,
            modifyVolumeStatus | refs.oneOf."270" | { _ | Dyn } | optional,
            phase | String | optional
          },
      oneOf."302" =
        {
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."300" | { _ | Dyn }
          },
      oneOf."303" = { claimName | String, readOnly | Bool | optional },
      oneOf."305" =
        {
            accessModes | Array String | optional,
            awsElasticBlockStore | refs.oneOf."184" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."188" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."189" | { _ | Dyn } | optional,
            capacity | { _ | refs.oneOf."603" } | optional,
            cephfs | refs.oneOf."195" | { _ | Dyn } | optional,
            cinder | refs.oneOf."197" | { _ | Dyn } | optional,
            claimRef | refs.oneOf."295" | { _ | Dyn } | optional,
            csi | refs.oneOf."192" | { _ | Dyn } | optional,
            fc | refs.oneOf."241" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."242" | { _ | Dyn } | optional,
            flocker | refs.oneOf."244" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."245" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."248" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."254" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."255" | { _ | Dyn } | optional,
            local | refs.oneOf."269" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            nfs | refs.oneOf."271" | { _ | Dyn } | optional,
            nodeAffinity | refs.oneOf."389" | { _ | Dyn } | optional,
            persistentVolumeReclaimPolicy | String | optional,
            photonPersistentDisk | refs.oneOf."307" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."329" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."333" | { _ | Dyn } | optional,
            rbd | refs.oneOf."334" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."351" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            storageos | refs.oneOf."374" | { _ | Dyn } | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            vsphereVolume | refs.oneOf."392" | { _ | Dyn } | optional
          },
      oneOf."306" =
        {
            lastPhaseTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            phase | String | optional,
            reason | String | optional
          },
      oneOf."307" = { fsType | String | optional, pdID | String },
      oneOf."308" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Pod |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."323" | { _ | Dyn } | optional,
            status | refs.oneOf."324" | { _ | Dyn } | optional
          },
      oneOf."309" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."393", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."310", { _ | Dyn } ])
              | optional
          },
      oneOf."31" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."33" | { _ | Dyn } | optional
          },
      oneOf."310" =
        {
            labelSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            mismatchLabelKeys | Array String | optional,
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            namespaces | Array String | optional,
            topologyKey | String
          },
      oneOf."311" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."393", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."310", { _ | Dyn } ])
              | optional
          },
      oneOf."312" =
        {
            lastProbeTime | refs.oneOf."627" | String | optional,
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."313" =
        {
            nameservers | Array String | optional,
            options
              | Array (std.contract.Sequence [ refs.oneOf."314", { _ | Dyn } ])
              | optional,
            searches | Array String | optional
          },
      oneOf."314" = { name | String | optional, value | String | optional },
      oneOf."315" = { ip | String },
      oneOf."317" = { name | String },
      oneOf."318" = { conditionType | String },
      oneOf."319" =
        {
            name | String,
            resourceClaimName | String | optional,
            resourceClaimTemplateName | String | optional
          },
      oneOf."320" = { name | String, resourceClaimName | String | optional },
      oneOf."321" = { name | String },
      oneOf."322" =
        {
            appArmorProfile | refs.oneOf."186" | { _ | Dyn } | optional,
            fsGroup | std.number.Integer | optional,
            fsGroupChangePolicy | String | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxChangePolicy | String | optional,
            seLinuxOptions | refs.oneOf."350" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."355" | { _ | Dyn } | optional,
            supplementalGroups | Array std.number.Integer | optional,
            supplementalGroupsPolicy | String | optional,
            sysctls
              | Array (std.contract.Sequence [ refs.oneOf."376", { _ | Dyn } ])
              | optional,
            windowsOptions | refs.oneOf."394" | { _ | Dyn } | optional
          },
      oneOf."323" =
        {
            activeDeadlineSeconds | std.number.Integer | optional,
            affinity | refs.oneOf."185" | { _ | Dyn } | optional,
            automountServiceAccountToken | Bool | optional,
            containers
              | Array (std.contract.Sequence [ refs.oneOf."211", { _ | Dyn } ]),
            dnsConfig | refs.oneOf."313" | { _ | Dyn } | optional,
            dnsPolicy | String | optional,
            enableServiceLinks | Bool | optional,
            ephemeralContainers
              | Array (std.contract.Sequence [ refs.oneOf."234", { _ | Dyn } ])
              | optional,
            hostAliases
              | Array (std.contract.Sequence [ refs.oneOf."252", { _ | Dyn } ])
              | optional,
            hostIPC | Bool | optional,
            hostNetwork | Bool | optional,
            hostPID | Bool | optional,
            hostUsers | Bool | optional,
            hostname | String | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            initContainers
              | Array (std.contract.Sequence [ refs.oneOf."211", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | { _ | String } | optional,
            os | refs.oneOf."317" | { _ | Dyn } | optional,
            overhead | { _ | refs.oneOf."603" } | optional,
            preemptionPolicy | String | optional,
            "priority" | std.number.Integer | optional,
            priorityClassName | String | optional,
            readinessGates
              | Array (std.contract.Sequence [ refs.oneOf."318", { _ | Dyn } ])
              | optional,
            resourceClaims
              | Array (std.contract.Sequence [ refs.oneOf."319", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."348" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            runtimeClassName | String | optional,
            schedulerName | String | optional,
            schedulingGates
              | Array (std.contract.Sequence [ refs.oneOf."321", { _ | Dyn } ])
              | optional,
            securityContext | refs.oneOf."322" | { _ | Dyn } | optional,
            serviceAccount | String | optional,
            serviceAccountName | String | optional,
            setHostnameAsFQDN | Bool | optional,
            shareProcessNamespace | Bool | optional,
            subdomain | String | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."379", { _ | Dyn } ])
              | optional,
            topologySpreadConstraints
              | Array (std.contract.Sequence [ refs.oneOf."382", { _ | Dyn } ])
              | optional,
            volumes
              | Array (std.contract.Sequence [ refs.oneOf."385", { _ | Dyn } ])
              | optional
          },
      oneOf."324" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."312", { _ | Dyn } ])
              | optional,
            containerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."219", { _ | Dyn } ])
              | optional,
            ephemeralContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."219", { _ | Dyn } ])
              | optional,
            hostIP | String | optional,
            hostIPs
              | Array (std.contract.Sequence [ refs.oneOf."253", { _ | Dyn } ])
              | optional,
            initContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."219", { _ | Dyn } ])
              | optional,
            message | String | optional,
            nominatedNodeName | String | optional,
            phase | String | optional,
            podIP | String | optional,
            podIPs
              | Array (std.contract.Sequence [ refs.oneOf."315", { _ | Dyn } ])
              | optional,
            qosClass | String | optional,
            reason | String | optional,
            resize | String | optional,
            resourceClaimStatuses
              | Array (std.contract.Sequence [ refs.oneOf."320", { _ | Dyn } ])
              | optional,
            startTime | refs.oneOf."627" | String | optional
          },
      oneOf."325" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodTemplate |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            template | refs.oneOf."327" | { _ | Dyn } | optional
          },
      oneOf."327" =
        {
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."323" | { _ | Dyn } | optional
          },
      oneOf."328" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."329" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."33" =
        {
            matchResources | refs.oneOf."29" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."39" | { _ | Dyn } | optional,
            policyName | String | optional
          },
      oneOf."330" =
        {
            preference | refs.oneOf."290" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."331" =
        {
            exec | refs.oneOf."240" | { _ | Dyn } | optional,
            failureThreshold | std.number.Integer | optional,
            grpc | refs.oneOf."246" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."250" | { _ | Dyn } | optional,
            initialDelaySeconds | std.number.Integer | optional,
            periodSeconds | std.number.Integer | optional,
            successThreshold | std.number.Integer | optional,
            tcpSocket | refs.oneOf."377" | { _ | Dyn } | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."332" =
        {
            defaultMode | std.number.Integer | optional,
            sources
              | Array (std.contract.Sequence [ refs.oneOf."390", { _ | Dyn } ])
              | optional
          },
      oneOf."333" =
        {
            group | String | optional,
            readOnly | Bool | optional,
            registry | String,
            tenant | String | optional,
            user | String | optional,
            volume | String
          },
      oneOf."334" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."361" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."335" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."336" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ReplicationController |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."339" | { _ | Dyn } | optional,
            status | refs.oneOf."340" | { _ | Dyn } | optional
          },
      oneOf."337" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."339" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | { _ | String } | optional,
            template | refs.oneOf."327" | { _ | Dyn } | optional
          },
      oneOf."340" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."337", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer
          },
      oneOf."341" = { name | String, request | String | optional },
      oneOf."342" =
        {
            containerName | String | optional,
            divisor | refs.oneOf."603" | optional,
            resource | String
          },
      oneOf."343" = { health | String | optional, resourceID | String },
      oneOf."344" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceQuota |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."346" | { _ | Dyn } | optional,
            status | refs.oneOf."347" | { _ | Dyn } | optional
          },
      oneOf."346" =
        {
            hard | { _ | refs.oneOf."603" } | optional,
            scopeSelector | refs.oneOf."353" | { _ | Dyn } | optional,
            scopes | Array String | optional
          },
      oneOf."347" =
        {
            hard | { _ | refs.oneOf."603" } | optional,
            used | { _ | refs.oneOf."603" } | optional
          },
      oneOf."348" =
        {
            claims
              | Array (std.contract.Sequence [ refs.oneOf."341", { _ | Dyn } ])
              | optional,
            limits | { _ | refs.oneOf."603" } | optional,
            requests | { _ | refs.oneOf."603" } | optional
          },
      oneOf."349" =
        {
            name | String,
            resources
              | Array (std.contract.Sequence [ refs.oneOf."343", { _ | Dyn } ])
              | optional
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
            level | String | optional,
            role | String | optional,
            type | String | optional,
            user | String | optional
          },
      oneOf."351" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."361" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."352" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."353" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."354", { _ | Dyn } ])
              | optional
          },
      oneOf."354" =
        {
            operator | String,
            scopeName | String,
            values | Array String | optional
          },
      oneOf."355" = { localhostProfile | String | optional, type | String },
      oneOf."356" =
        {
            apiVersion | String | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'Secret |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            stringData | { _ | String } | optional,
            type | String | optional
          },
      oneOf."357" = { name | String | optional, "optional" | Bool | optional },
      oneOf."358" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."36" =
        {
            applyConfiguration | refs.oneOf."26" | { _ | Dyn } | optional,
            jsonPatch | refs.oneOf."27" | { _ | Dyn } | optional,
            patchType | String
          },
      oneOf."360" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."258", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."361" = { name | String | optional, namespace | String | optional },
      oneOf."362" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."258", { _ | Dyn } ])
              | optional,
            "optional" | Bool | optional,
            secretName | String | optional
          },
      oneOf."363" =
        {
            allowPrivilegeEscalation | Bool | optional,
            appArmorProfile | refs.oneOf."186" | { _ | Dyn } | optional,
            capabilities | refs.oneOf."194" | { _ | Dyn } | optional,
            privileged | Bool | optional,
            procMount | String | optional,
            readOnlyRootFilesystem | Bool | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxOptions | refs.oneOf."350" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."355" | { _ | Dyn } | optional,
            windowsOptions | refs.oneOf."394" | { _ | Dyn } | optional
          },
      oneOf."364" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Service |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."370" | { _ | Dyn } | optional,
            status | refs.oneOf."371" | { _ | Dyn } | optional
          },
      oneOf."365" =
        {
            apiVersion | String | optional,
            automountServiceAccountToken | Bool | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."268", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ServiceAccount |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            secrets
              | Array (std.contract.Sequence [ refs.oneOf."295", { _ | Dyn } ])
              | optional
          },
      oneOf."367" =
        {
            audience | String | optional,
            expirationSeconds | std.number.Integer | optional,
            path | String
          },
      oneOf."369" =
        {
            appProtocol | String | optional,
            name | String | optional,
            nodePort | std.number.Integer | optional,
            port | std.number.Integer,
            protocol | String | optional,
            targetPort | refs.oneOf."630" | optional
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
      oneOf."370" =
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
              | Array (std.contract.Sequence [ refs.oneOf."369", { _ | Dyn } ])
              | optional,
            publishNotReadyAddresses | Bool | optional,
            selector | { _ | String } | optional,
            sessionAffinity | String | optional,
            sessionAffinityConfig | refs.oneOf."372" | { _ | Dyn } | optional,
            trafficDistribution | String | optional,
            type | String | optional
          },
      oneOf."371" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            loadBalancer | refs.oneOf."267" | { _ | Dyn } | optional
          },
      oneOf."372" = { clientIP | refs.oneOf."199" | { _ | Dyn } | optional },
      oneOf."373" = { seconds | std.number.Integer },
      oneOf."374" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."295" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."375" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."268" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."376" = { name | String, value | String },
      oneOf."377" = { host | String | optional, port | refs.oneOf."630" },
      oneOf."378" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."627" | String | optional,
            value | String | optional
          },
      oneOf."379" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."38" = { apiVersion | String | optional, kind | String | optional },
      oneOf."380" = { key | String, values | Array String },
      oneOf."381" =
        {
            matchLabelExpressions
              | Array (std.contract.Sequence [ refs.oneOf."380", { _ | Dyn } ])
              | optional
          },
      oneOf."382" =
        {
            labelSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            maxSkew | std.number.Integer,
            minDomains | std.number.Integer | optional,
            nodeAffinityPolicy | String | optional,
            nodeTaintsPolicy | String | optional,
            topologyKey | String,
            whenUnsatisfiable | String
          },
      oneOf."383" =
        { apiGroup | String | optional, kind | String, name | String },
      oneOf."384" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."385" =
        {
            awsElasticBlockStore | refs.oneOf."184" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."188" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."190" | { _ | Dyn } | optional,
            cephfs | refs.oneOf."196" | { _ | Dyn } | optional,
            cinder | refs.oneOf."198" | { _ | Dyn } | optional,
            configMap | refs.oneOf."210" | { _ | Dyn } | optional,
            csi | refs.oneOf."193" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."224" | { _ | Dyn } | optional,
            emptyDir | refs.oneOf."225" | { _ | Dyn } | optional,
            ephemeral | refs.oneOf."235" | { _ | Dyn } | optional,
            fc | refs.oneOf."241" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."243" | { _ | Dyn } | optional,
            flocker | refs.oneOf."244" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."245" | { _ | Dyn } | optional,
            gitRepo | refs.oneOf."247" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."249" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."254" | { _ | Dyn } | optional,
            image | refs.oneOf."257" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."256" | { _ | Dyn } | optional,
            name | String,
            nfs | refs.oneOf."271" | { _ | Dyn } | optional,
            persistentVolumeClaim | refs.oneOf."303" | { _ | Dyn } | optional,
            photonPersistentDisk | refs.oneOf."307" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."329" | { _ | Dyn } | optional,
            projected | refs.oneOf."332" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."333" | { _ | Dyn } | optional,
            rbd | refs.oneOf."335" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."352" | { _ | Dyn } | optional,
            secret | refs.oneOf."362" | { _ | Dyn } | optional,
            storageos | refs.oneOf."375" | { _ | Dyn } | optional,
            vsphereVolume | refs.oneOf."392" | { _ | Dyn } | optional
          },
      oneOf."386" = { devicePath | String, name | String },
      oneOf."387" =
        {
            mountPath | String,
            mountPropagation | String | optional,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional,
            subPath | String | optional,
            subPathExpr | String | optional
          },
      oneOf."388" =
        {
            mountPath | String,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional
          },
      oneOf."389" = { required | refs.oneOf."288" | { _ | Dyn } | optional },
      oneOf."39" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional
          },
      oneOf."390" =
        {
            clusterTrustBundle | refs.oneOf."200" | { _ | Dyn } | optional,
            configMap | refs.oneOf."209" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."222" | { _ | Dyn } | optional,
            secret | refs.oneOf."360" | { _ | Dyn } | optional,
            serviceAccountToken | refs.oneOf."367" | { _ | Dyn } | optional
          },
      oneOf."391" =
        {
            limits | { _ | refs.oneOf."603" } | optional,
            requests | { _ | refs.oneOf."603" } | optional
          },
      oneOf."392" =
        {
            fsType | String | optional,
            storagePolicyID | String | optional,
            storagePolicyName | String | optional,
            volumePath | String
          },
      oneOf."393" =
        {
            podAffinityTerm | refs.oneOf."310" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."394" =
        {
            gmsaCredentialSpec | String | optional,
            gmsaCredentialSpecName | String | optional,
            hostProcess | Bool | optional,
            runAsUserName | String | optional
          },
      oneOf."395" =
        {
            addresses | Array String,
            conditions | refs.oneOf."396" | { _ | Dyn } | optional,
            deprecatedTopology | { _ | String } | optional,
            hints | refs.oneOf."397" | { _ | Dyn } | optional,
            hostname | String | optional,
            nodeName | String | optional,
            targetRef | refs.oneOf."295" | { _ | Dyn } | optional,
            zone | String | optional
          },
      oneOf."396" =
        {
            ready | Bool | optional,
            serving | Bool | optional,
            terminating | Bool | optional
          },
      oneOf."397" =
        {
            forZones
              | Array (std.contract.Sequence [ refs.oneOf."401", { _ | Dyn } ])
              | optional
          },
      oneOf."398" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer | optional,
            protocol | String | optional
          },
      oneOf."399" =
        {
            addressType | String,
            apiVersion | String | optional,
            endpoints
              | Array (std.contract.Sequence [ refs.oneOf."395", { _ | Dyn } ]),
            kind | std.enum.TagOrString | [| 'EndpointSlice |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."398", { _ | Dyn } ])
              | optional
          },
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
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."40" = { expression | String, name | String },
      oneOf."401" = { name | String },
      oneOf."402" =
        {
            action | String | optional,
            apiVersion | String | optional,
            deprecatedCount | std.number.Integer | optional,
            deprecatedFirstTimestamp | refs.oneOf."627" | String | optional,
            deprecatedLastTimestamp | refs.oneOf."627" | String | optional,
            deprecatedSource | refs.oneOf."239" | { _ | Dyn } | optional,
            eventTime | refs.oneOf."618" | String,
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            note | String | optional,
            reason | String | optional,
            regarding | refs.oneOf."295" | { _ | Dyn } | optional,
            related | refs.oneOf."295" | { _ | Dyn } | optional,
            reportingController | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."404" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."404" =
        {
            count | std.number.Integer,
            lastObservedTime | refs.oneOf."618" | String
          },
      oneOf."405" =
        {
            lendablePercent | std.number.Integer | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."406" = { type | String },
      oneOf."407" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'FlowSchema |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."410" | { _ | Dyn } | optional,
            status | refs.oneOf."411" | { _ | Dyn } | optional
          },
      oneOf."408" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."41" = { key | String, valueExpression | String },
      oneOf."410" =
        {
            distinguisherMethod | refs.oneOf."406" | { _ | Dyn } | optional,
            matchingPrecedence | std.number.Integer | optional,
            priorityLevelConfiguration | refs.oneOf."420" | { _ | Dyn },
            rules
              | Array (std.contract.Sequence [ refs.oneOf."416", { _ | Dyn } ])
              | optional
          },
      oneOf."411" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."408", { _ | Dyn } ])
              | optional
          },
      oneOf."412" = { name | String },
      oneOf."413" =
        { queuing | refs.oneOf."423" | { _ | Dyn } | optional, type | String },
      oneOf."414" =
        {
            borrowingLimitPercent | std.number.Integer | optional,
            lendablePercent | std.number.Integer | optional,
            limitResponse | refs.oneOf."413" | { _ | Dyn } | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."415" = { nonResourceURLs | Array String, verbs | Array String },
      oneOf."416" =
        {
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."415", { _ | Dyn } ])
              | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."424", { _ | Dyn } ])
              | optional,
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."426", { _ | Dyn } ])
          },
      oneOf."417" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PriorityLevelConfiguration |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."421" | { _ | Dyn } | optional,
            status | refs.oneOf."422" | { _ | Dyn } | optional
          },
      oneOf."418" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."42" = { fieldRef | String, warning | String },
      oneOf."420" = { name | String },
      oneOf."421" =
        {
            exempt | refs.oneOf."405" | { _ | Dyn } | optional,
            limited | refs.oneOf."414" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."422" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."418", { _ | Dyn } ])
              | optional
          },
      oneOf."423" =
        {
            handSize | std.number.Integer | optional,
            queueLengthLimit | std.number.Integer | optional,
            queues | std.number.Integer | optional
          },
      oneOf."424" =
        {
            apiGroups | Array String,
            clusterScope | Bool | optional,
            namespaces | Array String | optional,
            resources | Array String,
            verbs | Array String
          },
      oneOf."425" = { name | String, namespace | String },
      oneOf."426" =
        {
            group | refs.oneOf."412" | { _ | Dyn } | optional,
            kind | String,
            serviceAccount | refs.oneOf."425" | { _ | Dyn } | optional,
            user | refs.oneOf."427" | { _ | Dyn } | optional
          },
      oneOf."427" = { name | String },
      oneOf."428" =
        {
            backend | refs.oneOf."432" | { _ | Dyn },
            path | String | optional,
            pathType | String
          },
      oneOf."429" =
        {
            paths
              | Array (std.contract.Sequence [ refs.oneOf."428", { _ | Dyn } ])
          },
      oneOf."43" = { expression | String, name | String },
      oneOf."430" = { cidr | String, except | Array String | optional },
      oneOf."431" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Ingress |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."443" | { _ | Dyn } | optional,
            status | refs.oneOf."444" | { _ | Dyn } | optional
          },
      oneOf."432" =
        {
            resource | refs.oneOf."383" | { _ | Dyn } | optional,
            service | refs.oneOf."442" | { _ | Dyn } | optional
          },
      oneOf."433" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IngressClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."436" | { _ | Dyn } | optional
          },
      oneOf."435" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional,
            scope | String | optional
          },
      oneOf."436" =
        {
            controller | String | optional,
            parameters | refs.oneOf."435" | { _ | Dyn } | optional
          },
      oneOf."438" =
        {
            hostname | String | optional,
            ip | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."440", { _ | Dyn } ])
              | optional
          },
      oneOf."439" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."438", { _ | Dyn } ])
              | optional
          },
      oneOf."44" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."45", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."45", { _ | Dyn } ])
              | optional
          },
      oneOf."440" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."441" =
        {
            host | String | optional,
            http | refs.oneOf."429" | { _ | Dyn } | optional
          },
      oneOf."442" =
        { name | String, port | refs.oneOf."453" | { _ | Dyn } | optional },
      oneOf."443" =
        {
            defaultBackend | refs.oneOf."432" | { _ | Dyn } | optional,
            ingressClassName | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."441", { _ | Dyn } ])
              | optional,
            tls
              | Array (std.contract.Sequence [ refs.oneOf."445", { _ | Dyn } ])
              | optional
          },
      oneOf."444" =
        { loadBalancer | refs.oneOf."439" | { _ | Dyn } | optional },
      oneOf."445" =
        { hosts | Array String | optional, secretName | String | optional },
      oneOf."446" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'NetworkPolicy |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."452" | { _ | Dyn } | optional
          },
      oneOf."447" =
        {
            ports
              | Array (std.contract.Sequence [ refs.oneOf."451", { _ | Dyn } ])
              | optional,
            to
              | Array (std.contract.Sequence [ refs.oneOf."450", { _ | Dyn } ])
              | optional
          },
      oneOf."448" =
        {
            from
              | Array (std.contract.Sequence [ refs.oneOf."450", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."451", { _ | Dyn } ])
              | optional
          },
      oneOf."45" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."450" =
        {
            ipBlock | refs.oneOf."430" | { _ | Dyn } | optional,
            namespaceSelector | refs.oneOf."614" | { _ | Dyn } | optional,
            podSelector | refs.oneOf."614" | { _ | Dyn } | optional
          },
      oneOf."451" =
        {
            endPort | std.number.Integer | optional,
            port | refs.oneOf."630" | optional,
            protocol | String | optional
          },
      oneOf."452" =
        {
            egress
              | Array (std.contract.Sequence [ refs.oneOf."447", { _ | Dyn } ])
              | optional,
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."448", { _ | Dyn } ])
              | optional,
            podSelector | refs.oneOf."614" | { _ | Dyn },
            policyTypes | Array String | optional
          },
      oneOf."453" =
        { name | String | optional, number | std.number.Integer | optional },
      oneOf."454" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IPAddress |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."456" | { _ | Dyn } | optional
          },
      oneOf."456" = { parentRef | refs.oneOf."457" | { _ | Dyn } },
      oneOf."457" =
        {
            group | String | optional,
            name | String,
            namespace | String | optional,
            resource | String
          },
      oneOf."458" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ServiceCIDR |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."460" | { _ | Dyn } | optional,
            status | refs.oneOf."461" | { _ | Dyn } | optional
          },
      oneOf."46" = { apiVersion | String | optional, kind | String | optional },
      oneOf."460" = { cidrs | Array String | optional },
      oneOf."461" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional
          },
      oneOf."462" = { podFixed | { _ | refs.oneOf."603" } | optional },
      oneOf."463" =
        {
            apiVersion | String | optional,
            handler | String,
            kind | std.enum.TagOrString | [| 'RuntimeClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            overhead | refs.oneOf."462" | { _ | Dyn } | optional,
            scheduling | refs.oneOf."465" | { _ | Dyn } | optional
          },
      oneOf."465" =
        {
            nodeSelector | { _ | String } | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."379", { _ | Dyn } ])
              | optional
          },
      oneOf."467" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodDisruptionBudget |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."469" | { _ | Dyn } | optional,
            status | refs.oneOf."470" | { _ | Dyn } | optional
          },
      oneOf."469" =
        {
            maxUnavailable | refs.oneOf."630" | optional,
            minAvailable | refs.oneOf."630" | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional,
            unhealthyPodEvictionPolicy | String | optional
          },
      oneOf."47" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional
          },
      oneOf."470" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            currentHealthy | std.number.Integer,
            desiredHealthy | std.number.Integer,
            disruptedPods
              | { _ | std.contract.Sequence [ refs.oneOf."627", String ] }
              | optional,
            disruptionsAllowed | std.number.Integer,
            expectedPods | std.number.Integer,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."471" =
        {
            clusterRoleSelectors
              | Array (std.contract.Sequence [ refs.oneOf."614", { _ | Dyn } ])
              | optional
          },
      oneOf."472" =
        {
            aggregationRule | refs.oneOf."471" | { _ | Dyn } | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRole |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."476", { _ | Dyn } ])
              | optional
          },
      oneOf."473" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRoleBinding |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."481" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."482", { _ | Dyn } ])
              | optional
          },
      oneOf."476" =
        {
            apiGroups | Array String | optional,
            nonResourceURLs | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."477" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Role |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."476", { _ | Dyn } ])
              | optional
          },
      oneOf."478" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'RoleBinding |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."481" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."482", { _ | Dyn } ])
              | optional
          },
      oneOf."48" =
        {
            expressionWarnings
              | Array (std.contract.Sequence [ refs.oneOf."42", { _ | Dyn } ])
              | optional
          },
      oneOf."481" = { apiGroup | String, kind | String, name | String },
      oneOf."482" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."483" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."629" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."501" | { _ | Dyn } | optional,
            pool | String
          },
      oneOf."484" =
        {
            devices | refs.oneOf."489" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."288" | { _ | Dyn } | optional
          },
      oneOf."485" =
        {
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."490", { _ | Dyn } ] }
              | optional,
            capacity | { _ | refs.oneOf."603" } | optional
          },
      oneOf."486" = { expression | String },
      oneOf."487" =
        { basic | refs.oneOf."485" | { _ | Dyn } | optional, name | String },
      oneOf."488" =
        {
            opaque | refs.oneOf."502" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."489" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."488", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."499", { _ | Dyn } ])
              | optional
          },
      oneOf."49" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."54" | { _ | Dyn } | optional,
            status | refs.oneOf."55" | { _ | Dyn } | optional
          },
      oneOf."490" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."491" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."492", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."497", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."498", { _ | Dyn } ])
              | optional
          },
      oneOf."492" =
        {
            opaque | refs.oneOf."502" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."493" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."496" | { _ | Dyn }
          },
      oneOf."494" = { opaque | refs.oneOf."502" | { _ | Dyn } | optional },
      oneOf."496" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."494", { _ | Dyn } ])
              | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."500", { _ | Dyn } ])
              | optional
          },
      oneOf."497" =
        {
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."498" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."500", { _ | Dyn } ])
              | optional
          },
      oneOf."499" =
        {
            adminAccess | Bool | optional,
            device | String,
            driver | String,
            pool | String,
            request | String
          },
      oneOf."5" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."4", { _ | Dyn } ])
              | optional
          },
      oneOf."50" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."52" | { _ | Dyn } | optional
          },
      oneOf."500" = { cel | refs.oneOf."486" | { _ | Dyn } | optional },
      oneOf."501" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."502" =
        { driver | String, parameters | refs.oneOf."629" | { _ | Dyn } },
      oneOf."503" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."506" | { _ | Dyn },
            status | refs.oneOf."507" | { _ | Dyn } | optional
          },
      oneOf."504" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."506" = { devices | refs.oneOf."491" | { _ | Dyn } | optional },
      oneOf."507" =
        {
            allocation | refs.oneOf."484" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."483", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."504", { _ | Dyn } ])
              | optional
          },
      oneOf."508" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."510" | { _ | Dyn }
          },
      oneOf."510" =
        {
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."506" | { _ | Dyn }
          },
      oneOf."511" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."512" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."514" | { _ | Dyn }
          },
      oneOf."514" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."487", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."288" | { _ | Dyn } | optional,
            pool | refs.oneOf."511" | { _ | Dyn }
          },
      oneOf."515" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."629" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."534" | { _ | Dyn } | optional,
            pool | String
          },
      oneOf."516" =
        {
            devices | refs.oneOf."521" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."288" | { _ | Dyn } | optional
          },
      oneOf."517" =
        {
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."522", { _ | Dyn } ] }
              | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."523", { _ | Dyn } ] }
              | optional
          },
      oneOf."518" = { expression | String },
      oneOf."519" =
        { basic | refs.oneOf."517" | { _ | Dyn } | optional, name | String },
      oneOf."52" =
        {
            matchResources | refs.oneOf."44" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."47" | { _ | Dyn } | optional,
            policyName | String | optional,
            validationActions | Array String | optional
          },
      oneOf."520" =
        {
            opaque | refs.oneOf."535" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."521" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."520", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."532", { _ | Dyn } ])
              | optional
          },
      oneOf."522" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."523" = { value | refs.oneOf."603" },
      oneOf."524" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."525", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."530", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."531", { _ | Dyn } ])
              | optional
          },
      oneOf."525" =
        {
            opaque | refs.oneOf."535" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."526" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."529" | { _ | Dyn }
          },
      oneOf."527" = { opaque | refs.oneOf."535" | { _ | Dyn } | optional },
      oneOf."529" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."527", { _ | Dyn } ])
              | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."533", { _ | Dyn } ])
              | optional
          },
      oneOf."530" =
        {
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."531" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."533", { _ | Dyn } ])
              | optional
          },
      oneOf."532" =
        {
            adminAccess | Bool | optional,
            device | String,
            driver | String,
            pool | String,
            request | String
          },
      oneOf."533" = { cel | refs.oneOf."518" | { _ | Dyn } | optional },
      oneOf."534" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."535" =
        { driver | String, parameters | refs.oneOf."629" | { _ | Dyn } },
      oneOf."536" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."539" | { _ | Dyn },
            status | refs.oneOf."540" | { _ | Dyn } | optional
          },
      oneOf."537" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."539" = { devices | refs.oneOf."524" | { _ | Dyn } | optional },
      oneOf."54" =
        {
            auditAnnotations
              | Array (std.contract.Sequence [ refs.oneOf."41", { _ | Dyn } ])
              | optional,
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."43", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."44" | { _ | Dyn } | optional,
            paramKind | refs.oneOf."46" | { _ | Dyn } | optional,
            validations
              | Array (std.contract.Sequence [ refs.oneOf."56", { _ | Dyn } ])
              | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."57", { _ | Dyn } ])
              | optional
          },
      oneOf."540" =
        {
            allocation | refs.oneOf."516" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."515", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."537", { _ | Dyn } ])
              | optional
          },
      oneOf."541" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."543" | { _ | Dyn }
          },
      oneOf."543" =
        {
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."539" | { _ | Dyn }
          },
      oneOf."544" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."545" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."547" | { _ | Dyn }
          },
      oneOf."547" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."519", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."288" | { _ | Dyn } | optional,
            pool | refs.oneOf."544" | { _ | Dyn }
          },
      oneOf."548" =
        {
            apiVersion | String | optional,
            description | String | optional,
            globalDefault | Bool | optional,
            kind | std.enum.TagOrString | [| 'PriorityClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            preemptionPolicy | String | optional,
            value | std.number.Integer
          },
      oneOf."55" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."609", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            typeChecking | refs.oneOf."48" | { _ | Dyn } | optional
          },
      oneOf."550" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSIDriver |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."552" | { _ | Dyn }
          },
      oneOf."552" =
        {
            attachRequired | Bool | optional,
            fsGroupPolicy | String | optional,
            podInfoOnMount | Bool | optional,
            requiresRepublish | Bool | optional,
            seLinuxMount | Bool | optional,
            storageCapacity | Bool | optional,
            tokenRequests
              | Array (std.contract.Sequence [ refs.oneOf."561", { _ | Dyn } ])
              | optional,
            volumeLifecycleModes | Array String | optional
          },
      oneOf."553" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSINode |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."556" | { _ | Dyn }
          },
      oneOf."554" =
        {
            allocatable | refs.oneOf."568" | { _ | Dyn } | optional,
            name | String,
            nodeID | String,
            topologyKeys | Array String | optional
          },
      oneOf."556" =
        {
            drivers
              | Array (std.contract.Sequence [ refs.oneOf."554", { _ | Dyn } ])
          },
      oneOf."557" =
        {
            apiVersion | String | optional,
            capacity | refs.oneOf."603" | optional,
            kind | std.enum.TagOrString | [| 'CSIStorageCapacity |] | optional,
            maximumVolumeSize | refs.oneOf."603" | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            nodeTopology | refs.oneOf."614" | { _ | Dyn } | optional,
            storageClassName | String
          },
      oneOf."559" =
        {
            allowVolumeExpansion | Bool | optional,
            allowedTopologies
              | Array (std.contract.Sequence [ refs.oneOf."381", { _ | Dyn } ])
              | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageClass |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            parameters | { _ | String } | optional,
            provisioner | String,
            reclaimPolicy | String | optional,
            volumeBindingMode | String | optional
          },
      oneOf."56" =
        {
            expression | String,
            message | String | optional,
            messageExpression | String | optional,
            reason | String | optional
          },
      oneOf."561" =
        {
            audience | String,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."562" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'VolumeAttachment |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."565" | { _ | Dyn },
            status | refs.oneOf."566" | { _ | Dyn } | optional
          },
      oneOf."564" =
        {
            inlineVolumeSpec | refs.oneOf."305" | { _ | Dyn } | optional,
            persistentVolumeName | String | optional
          },
      oneOf."565" =
        {
            attacher | String,
            nodeName | String,
            source | refs.oneOf."564" | { _ | Dyn }
          },
      oneOf."566" =
        {
            attachError | refs.oneOf."567" | { _ | Dyn } | optional,
            attached | Bool,
            attachmentMetadata | { _ | String } | optional,
            detachError | refs.oneOf."567" | { _ | Dyn } | optional
          },
      oneOf."567" =
        {
            message | String | optional,
            time | refs.oneOf."627" | String | optional
          },
      oneOf."568" = { count | std.number.Integer | optional },
      oneOf."569" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."57" = { expression | String, name | String },
      oneOf."571" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."573" =
        {
            group | String | optional,
            resource | String | optional,
            version | String | optional
          },
      oneOf."574" =
        {
            lastUpdateTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."575" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'StorageVersionMigration |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."577" | { _ | Dyn } | optional,
            status | refs.oneOf."578" | { _ | Dyn } | optional
          },
      oneOf."577" =
        {
            continueToken | String | optional,
            resource | refs.oneOf."573" | { _ | Dyn }
          },
      oneOf."578" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."574", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional
          },
      oneOf."579" =
        {
            description | String | optional,
            format | String | optional,
            jsonPath | String,
            name | String,
            "priority" | std.number.Integer | optional,
            type | String
          },
      oneOf."58" =
        {
            apiServerID | String | optional,
            decodableVersions | Array String | optional,
            encodingVersion | String | optional,
            servedVersions | Array String | optional
          },
      oneOf."580" =
        {
            strategy | String,
            webhook | refs.oneOf."602" | { _ | Dyn } | optional
          },
      oneOf."581" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CustomResourceDefinition |]
              | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."585" | { _ | Dyn },
            status | refs.oneOf."586" | { _ | Dyn } | optional
          },
      oneOf."582" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."584" =
        {
            categories | Array String | optional,
            kind | String,
            listKind | String | optional,
            plural | String,
            shortNames | Array String | optional,
            singular | String | optional
          },
      oneOf."585" =
        {
            conversion | refs.oneOf."580" | { _ | Dyn } | optional,
            group | String,
            names | refs.oneOf."584" | { _ | Dyn },
            preserveUnknownFields | Bool | optional,
            scope | String,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."587", { _ | Dyn } ])
          },
      oneOf."586" =
        {
            acceptedNames | refs.oneOf."584" | { _ | Dyn } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."582", { _ | Dyn } ])
              | optional,
            storedVersions | Array String | optional
          },
      oneOf."587" =
        {
            additionalPrinterColumns
              | Array (std.contract.Sequence [ refs.oneOf."579", { _ | Dyn } ])
              | optional,
            deprecated | Bool | optional,
            deprecationWarning | String | optional,
            name | String,
            schema | refs.oneOf."591" | { _ | Dyn } | optional,
            selectableFields
              | Array (std.contract.Sequence [ refs.oneOf."598", { _ | Dyn } ])
              | optional,
            served | Bool,
            storage | Bool,
            subresources | refs.oneOf."590" | { _ | Dyn } | optional
          },
      oneOf."588" =
        {
            labelSelectorPath | String | optional,
            specReplicasPath | String,
            statusReplicasPath | String
          },
      oneOf."589" = { _ | Dyn },
      oneOf."59" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageVersion |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."62" | { _ | Dyn },
            status | refs.oneOf."63" | { _ | Dyn }
          },
      oneOf."590" =
        {
            scale | refs.oneOf."588" | { _ | Dyn } | optional,
            status | refs.oneOf."589" | { _ | Dyn } | optional
          },
      oneOf."591" =
        { openAPIV3Schema | refs.oneOf."594" | { _ | Dyn } | optional },
      oneOf."592" =
        { description | String | optional, url | String | optional },
      oneOf."593" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."594" =
        {
            "$ref" | String | optional,
            "$schema" | String | optional,
            additionalItems | refs.oneOf."596" | optional,
            additionalProperties | refs.oneOf."596" | optional,
            allOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            anyOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            "default" | refs.oneOf."593" | optional,
            definitions
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            dependencies | { _ | refs.oneOf."597" } | optional,
            description | String | optional,
            enum | Array refs.oneOf."593" | optional,
            example | refs.oneOf."593" | optional,
            exclusiveMaximum | Bool | optional,
            exclusiveMinimum | Bool | optional,
            externalDocs | refs.oneOf."592" | { _ | Dyn } | optional,
            format | String | optional,
            id | String | optional,
            items | refs.oneOf."595" | optional,
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
              | Array (std.contract.Sequence [ refs.oneOf."600", { _ | Dyn } ])
              | optional
          },
      oneOf."595" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."596" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."597" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."598" = { jsonPath | String },
      oneOf."599" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."60" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."600" =
        {
            fieldPath | String | optional,
            message | String | optional,
            messageExpression | String | optional,
            optionalOldSelf | Bool | optional,
            reason | String | optional,
            rule | String
          },
      oneOf."601" =
        {
            caBundle | String | optional,
            service | refs.oneOf."599" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."602" =
        {
            clientConfig | refs.oneOf."601" | { _ | Dyn } | optional,
            conversionReviewVersions | Array String
          },
      oneOf."603" = std.contract.any_of [ Number, String ],
      oneOf."604" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIGroup |] | optional,
            name | String,
            preferredVersion | refs.oneOf."613" | { _ | Dyn } | optional,
            serverAddressByClientCIDRs
              | Array (std.contract.Sequence [ refs.oneOf."623", { _ | Dyn } ])
              | optional,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."613", { _ | Dyn } ])
          },
      oneOf."606" =
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
      oneOf."609" =
        {
            lastTransitionTime | refs.oneOf."627" | String,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."610" =
        {
            apiVersion | String | optional,
            dryRun | Array String | optional,
            gracePeriodSeconds | std.number.Integer | optional,
            ignoreStoreReadErrorWithClusterBreakingPotential | Bool | optional,
            kind | std.enum.TagOrString | [| 'DeleteOptions |] | optional,
            orphanDependents | Bool | optional,
            preconditions | refs.oneOf."622" | { _ | Dyn } | optional,
            propagationPolicy | String | optional
          },
      oneOf."611" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."612" = { _ | Dyn },
      oneOf."613" = { groupVersion | String, version | String },
      oneOf."614" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."615", { _ | Dyn } ])
              | optional,
            matchLabels | { _ | String } | optional
          },
      oneOf."615" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."616" =
        {
            continue | String | optional,
            remainingItemCount | std.number.Integer | optional,
            resourceVersion | String | optional,
            selfLink | String | optional
          },
      oneOf."617" =
        {
            apiVersion | String | optional,
            fieldsType | String | optional,
            fieldsV1 | refs.oneOf."612" | { _ | Dyn } | optional,
            manager | String | optional,
            operation | String | optional,
            subresource | String | optional,
            time | refs.oneOf."627" | String | optional
          },
      oneOf."618" = String,
      oneOf."619" =
        {
            annotations | { _ | String } | optional,
            creationTimestamp | refs.oneOf."627" | String | optional,
            deletionGracePeriodSeconds | std.number.Integer | optional,
            deletionTimestamp | refs.oneOf."627" | String | optional,
            finalizers | Array String | optional,
            generateName | String | optional,
            generation | std.number.Integer | optional,
            labels | { _ | String } | optional,
            managedFields
              | Array (std.contract.Sequence [ refs.oneOf."617", { _ | Dyn } ])
              | optional,
            name | String | optional,
            namespace | String | optional,
            ownerReferences
              | Array (std.contract.Sequence [ refs.oneOf."620", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional,
            selfLink | String | optional,
            uid | String | optional
          },
      oneOf."62" = { _ | Dyn },
      oneOf."620" =
        {
            apiVersion | String,
            blockOwnerDeletion | Bool | optional,
            controller | Bool | optional,
            kind | String,
            name | String,
            uid | String
          },
      oneOf."622" =
        { resourceVersion | String | optional, uid | String | optional },
      oneOf."623" = { clientCIDR | String, serverAddress | String },
      oneOf."625" =
        {
            field | String | optional,
            message | String | optional,
            reason | String | optional
          },
      oneOf."626" =
        {
            causes
              | Array (std.contract.Sequence [ refs.oneOf."625", { _ | Dyn } ])
              | optional,
            group | String | optional,
            kind | String | optional,
            name | String | optional,
            retryAfterSeconds | std.number.Integer | optional,
            uid | String | optional
          },
      oneOf."627" = String,
      oneOf."629" = { _ | Dyn },
      oneOf."63" =
        {
            commonEncodingVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."60", { _ | Dyn } ])
              | optional,
            storageVersions
              | Array (std.contract.Sequence [ refs.oneOf."58", { _ | Dyn } ])
              | optional
          },
      oneOf."630" = std.contract.any_of [ String, std.number.Integer ],
      oneOf."632" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIService |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."635" | { _ | Dyn } | optional,
            status | refs.oneOf."636" | { _ | Dyn } | optional
          },
      oneOf."633" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."635" =
        {
            caBundle | String | optional,
            group | String | optional,
            groupPriorityMinimum | std.number.Integer,
            insecureSkipTLSVerify | Bool | optional,
            service | refs.oneOf."637" | { _ | Dyn } | optional,
            version | String | optional,
            versionPriority | std.number.Integer
          },
      oneOf."636" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."633", { _ | Dyn } ])
              | optional
          },
      oneOf."637" =
        {
            name | String | optional,
            namespace | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."64" =
        {
            apiVersion | String | optional,
            data | refs.oneOf."629" | { _ | Dyn } | optional,
            kind | std.enum.TagOrString | [| 'ControllerRevision |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            revision | std.number.Integer
          },
      oneOf."66" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DaemonSet |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."69" | { _ | Dyn } | optional,
            status | refs.oneOf."70" | { _ | Dyn } | optional
          },
      oneOf."67" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."69" =
        {
            minReadySeconds | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."614" | { _ | Dyn },
            template | refs.oneOf."327" | { _ | Dyn },
            updateStrategy | refs.oneOf."71" | { _ | Dyn } | optional
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
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."67", { _ | Dyn } ])
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
      oneOf."71" =
        {
            rollingUpdate | refs.oneOf."83" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."72" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Deployment |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."75" | { _ | Dyn } | optional,
            status | refs.oneOf."76" | { _ | Dyn } | optional
          },
      oneOf."73" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            lastUpdateTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."75" =
        {
            minReadySeconds | std.number.Integer | optional,
            paused | Bool | optional,
            progressDeadlineSeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."614" | { _ | Dyn },
            strategy | refs.oneOf."77" | { _ | Dyn } | optional,
            template | refs.oneOf."327" | { _ | Dyn }
          },
      oneOf."76" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."73", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            unavailableReplicas | std.number.Integer | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."77" =
        {
            rollingUpdate | refs.oneOf."84" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."78" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ReplicaSet |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."81" | { _ | Dyn } | optional,
            status | refs.oneOf."82" | { _ | Dyn } | optional
          },
      oneOf."79" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."8" = { apiVersion | String | optional, kind | String | optional },
      oneOf."81" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | refs.oneOf."614" | { _ | Dyn },
            template | refs.oneOf."327" | { _ | Dyn } | optional
          },
      oneOf."82" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."79", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer
          },
      oneOf."83" =
        {
            maxSurge | refs.oneOf."630" | optional,
            maxUnavailable | refs.oneOf."630" | optional
          },
      oneOf."84" =
        {
            maxSurge | refs.oneOf."630" | optional,
            maxUnavailable | refs.oneOf."630" | optional
          },
      oneOf."85" =
        {
            maxUnavailable | refs.oneOf."630" | optional,
            partition | std.number.Integer | optional
          },
      oneOf."86" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StatefulSet |] | optional,
            metadata | refs.oneOf."619" | { _ | Dyn } | optional,
            spec | refs.oneOf."91" | { _ | Dyn } | optional,
            status | refs.oneOf."92" | { _ | Dyn } | optional
          },
      oneOf."87" =
        {
            lastTransitionTime | refs.oneOf."627" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."89" = { start | std.number.Integer | optional },
      oneOf."9" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."614" | { _ | Dyn } | optional
          },
      oneOf."90" =
        { whenDeleted | String | optional, whenScaled | String | optional },
      oneOf."91" =
        {
            minReadySeconds | std.number.Integer | optional,
            ordinals | refs.oneOf."89" | { _ | Dyn } | optional,
            persistentVolumeClaimRetentionPolicy
              | refs.oneOf."90"
              | { _ | Dyn }
              | optional,
            podManagementPolicy | String | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."614" | { _ | Dyn },
            serviceName | String,
            template | refs.oneOf."327" | { _ | Dyn },
            updateStrategy | refs.oneOf."93" | { _ | Dyn } | optional,
            volumeClaimTemplates
              | Array (std.contract.Sequence [ refs.oneOf."297", { _ | Dyn } ])
              | optional
          },
      oneOf."92" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."87", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            currentRevision | String | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer,
            updateRevision | String | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."93" =
        {
            rollingUpdate | refs.oneOf."85" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."94" =
        {
            apiVersion | String | optional,
            kind | String | optional,
            name | String | optional,
            uid | String | optional
          },
      oneOf."96" = { userInfo | refs.oneOf."103" | { _ | Dyn } | optional },
      oneOf."98" =
        {
            audiences | Array String,
            boundObjectRef | refs.oneOf."94" | { _ | Dyn } | optional,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."99" =
        { expirationTimestamp | refs.oneOf."627" | String, token | String }
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
                  namespaceSelector = refs.oneOf."614",
                  objectSelector = refs.oneOf."614",
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
                  namespaceSelector = refs.oneOf."614",
                  objectSelector = refs.oneOf."614",
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."616"
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
                  selector = refs.oneOf."614"
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."616"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
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
                  namespaceSelector = refs.oneOf."614",
                  objectSelector = refs.oneOf."614",
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."616"
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
                  namespaceSelector = refs.oneOf."614",
                  objectSelector = refs.oneOf."614",
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."619",
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
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."616"
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
                  selector = refs.oneOf."614"
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
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."45",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."614",
                  objectSelector = refs.oneOf."614",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."45"
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
                  selector = refs.oneOf."614"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expressionWarnings = js2n.array.ArrayOf refs.oneOf."42" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."54",
                  status = refs.oneOf."55"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."52"
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
                  items = js2n.array.ArrayOf refs.oneOf."50",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  paramRef = refs.oneOf."47",
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
                  items = js2n.array.ArrayOf refs.oneOf."49",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  auditAnnotations = js2n.array.ArrayOf refs.oneOf."41",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."43",
                  matchConstraints = refs.oneOf."44",
                  paramKind = refs.oneOf."46",
                  validations = js2n.array.ArrayOf refs.oneOf."56",
                  variables = js2n.array.ArrayOf refs.oneOf."57"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
                  observedGeneration = std.number.Integer,
                  typeChecking = refs.oneOf."48"
                },
            required = {},
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."62",
                  status = refs.oneOf."63"
                },
            required = { spec = true, status = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."59",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageVersionList |] ],
                  metadata = refs.oneOf."616"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."60",
                  storageVersions = js2n.array.ArrayOf refs.oneOf."58"
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
                  data = refs.oneOf."629",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevision |] ],
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."64",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevisionList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."69",
                  status = refs.oneOf."70"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."66",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DaemonSetList |] ],
                  metadata = refs.oneOf."616"
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
                  selector = refs.oneOf."614",
                  template = refs.oneOf."327",
                  updateStrategy = refs.oneOf."71"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."67",
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
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Deployment |] ],
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."75",
                  status = refs.oneOf."76"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
                  lastUpdateTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."72",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeploymentList |] ],
                  metadata = refs.oneOf."616"
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
                  selector = refs.oneOf."614",
                  strategy = refs.oneOf."77",
                  template = refs.oneOf."327"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."73",
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  unavailableReplicas = std.number.Integer,
                  updatedReplicas = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."84", type = String },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."81",
                  status = refs.oneOf."82"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."78",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicaSetList |] ],
                  metadata = refs.oneOf."616"
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
                  selector = refs.oneOf."614",
                  template = refs.oneOf."327"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."79",
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
            properties =
              {
                  maxSurge = refs.oneOf."630",
                  maxUnavailable = refs.oneOf."630"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxSurge = refs.oneOf."630",
                  maxUnavailable = refs.oneOf."630"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."630",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."91",
                  status = refs.oneOf."92"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."86",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StatefulSetList |] ],
                  metadata = refs.oneOf."616"
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
                  ordinals = refs.oneOf."89",
                  persistentVolumeClaimRetentionPolicy = refs.oneOf."90",
                  podManagementPolicy = String,
                  replicas = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."614",
                  serviceName = String,
                  template = refs.oneOf."327",
                  updateStrategy = refs.oneOf."93",
                  volumeClaimTemplates = js2n.array.ArrayOf refs.oneOf."297"
                },
            required = { selector = true, serviceName = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."87",
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
            properties = { rollingUpdate = refs.oneOf."85", type = String },
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
                  metadata = refs.oneOf."619",
                  status = refs.oneOf."96"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { userInfo = refs.oneOf."103" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."98",
                  status = refs.oneOf."99"
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
                  boundObjectRef = refs.oneOf."94",
                  expirationSeconds = std.number.Integer
                },
            required = { audiences = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expirationTimestamp = refs.oneOf."627", token = String },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."101",
                  status = refs.oneOf."102"
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
                  user = refs.oneOf."103"
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
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SelfSubjectReview |] ],
                  metadata = refs.oneOf."619",
                  status = refs.oneOf."105"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { userInfo = refs.oneOf."103" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  rawSelector = String,
                  requirements = js2n.array.ArrayOf refs.oneOf."611"
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
                  requirements = js2n.array.ArrayOf refs.oneOf."615"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."118",
                  status = refs.oneOf."119"
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
                  fieldSelector = refs.oneOf."106",
                  group = String,
                  labelSelector = refs.oneOf."107",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."114",
                  status = refs.oneOf."119"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceAttributes = refs.oneOf."109",
                  resourceAttributes = refs.oneOf."111"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."116",
                  status = refs.oneOf."120"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."118",
                  status = refs.oneOf."119"
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
                  nonResourceAttributes = refs.oneOf."109",
                  resourceAttributes = refs.oneOf."111",
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
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."110",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."112"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."124",
                  status = refs.oneOf."125"
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
                  items = js2n.array.ArrayOf refs.oneOf."122",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  scaleTargetRef = refs.oneOf."121",
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
                  lastScaleTime = refs.oneOf."627",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."127",
                  status = refs.oneOf."128"
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
              { container = String, name = String, target = refs.oneOf."145" },
            required = { container = true, name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { container = String, current = refs.oneOf."146", name = String },
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
              { metric = refs.oneOf."142", target = refs.oneOf."145" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."146", metric = refs.oneOf."142" },
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
                  policies = js2n.array.ArrayOf refs.oneOf."134",
                  selectPolicy = String,
                  stabilizationWindowSeconds = std.number.Integer
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."140",
                  status = refs.oneOf."141"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { scaleDown = refs.oneOf."135", scaleUp = refs.oneOf."135" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."136",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  behavior = refs.oneOf."137",
                  maxReplicas = std.number.Integer,
                  metrics = js2n.array.ArrayOf refs.oneOf."143",
                  minReplicas = std.number.Integer,
                  scaleTargetRef = refs.oneOf."131"
                },
            required = { maxReplicas = true, scaleTargetRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."138",
                  currentMetrics = js2n.array.ArrayOf refs.oneOf."144",
                  currentReplicas = std.number.Integer,
                  desiredReplicas = std.number.Integer,
                  lastScaleTime = refs.oneOf."627",
                  observedGeneration = std.number.Integer
                },
            required = { desiredReplicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, selector = refs.oneOf."614" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerResource = refs.oneOf."129",
                  external = refs.oneOf."132",
                  object = refs.oneOf."147",
                  pods = refs.oneOf."149",
                  resource = refs.oneOf."151",
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
                  containerResource = refs.oneOf."130",
                  external = refs.oneOf."133",
                  object = refs.oneOf."148",
                  pods = refs.oneOf."150",
                  resource = refs.oneOf."152",
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
                  describedObject = refs.oneOf."131",
                  metric = refs.oneOf."142",
                  target = refs.oneOf."145"
                },
            required = { describedObject = true, metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  current = refs.oneOf."146",
                  describedObject = refs.oneOf."131",
                  metric = refs.oneOf."142"
                },
            required =
              { current = true, describedObject = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metric = refs.oneOf."142", target = refs.oneOf."145" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."146", metric = refs.oneOf."142" },
            required = { current = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, target = refs.oneOf."145" },
            required = { name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { current = refs.oneOf."146", name = String },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."155",
                  status = refs.oneOf."156"
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
                  items = js2n.array.ArrayOf refs.oneOf."153",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CronJobList |] ],
                  metadata = refs.oneOf."616"
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
                  jobTemplate = refs.oneOf."162",
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
                  active = js2n.array.ArrayOf refs.oneOf."295",
                  lastScheduleTime = refs.oneOf."627",
                  lastSuccessfulTime = refs.oneOf."627"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."160",
                  status = refs.oneOf."161"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."627",
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."157",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'JobList |] ],
                  metadata = refs.oneOf."616"
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
                  podFailurePolicy = refs.oneOf."163",
                  podReplacementPolicy = String,
                  selector = refs.oneOf."614",
                  successPolicy = refs.oneOf."167",
                  suspend = Bool,
                  template = refs.oneOf."327",
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
                  completionTime = refs.oneOf."627",
                  conditions = js2n.array.ArrayOf refs.oneOf."158",
                  failed = std.number.Integer,
                  failedIndexes = String,
                  ready = std.number.Integer,
                  startTime = refs.oneOf."627",
                  succeeded = std.number.Integer,
                  terminating = std.number.Integer,
                  uncountedTerminatedPods = refs.oneOf."169"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."619", spec = refs.oneOf."160" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."166" },
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
                  onExitCodes = refs.oneOf."164",
                  onPodConditions = js2n.array.ArrayOf refs.oneOf."165"
                },
            required = { action = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."168" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."173",
                  status = refs.oneOf."174"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
                  lastUpdateTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."170",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CertificateSigningRequestList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."171"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."177"
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
                  items = js2n.array.ArrayOf refs.oneOf."175",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundleList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."180"
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
                  items = js2n.array.ArrayOf refs.oneOf."178",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  acquireTime = refs.oneOf."618",
                  holderIdentity = String,
                  leaseDurationSeconds = std.number.Integer,
                  leaseTransitions = std.number.Integer,
                  preferredHolder = String,
                  renewTime = refs.oneOf."618",
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
                  metadata = refs.oneOf."619",
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
                        [ std.enum.TagOrString, [| 'LeaseCandidateList |] ],
                  metadata = refs.oneOf."616"
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
                  pingTime = refs.oneOf."618",
                  renewTime = refs.oneOf."618",
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
                  nodeAffinity = refs.oneOf."279",
                  podAffinity = refs.oneOf."309",
                  podAntiAffinity = refs.oneOf."311"
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
                  metadata = refs.oneOf."619",
                  target = refs.oneOf."295"
                },
            required = { target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  controllerExpandSecretRef = refs.oneOf."361",
                  controllerPublishSecretRef = refs.oneOf."361",
                  driver = String,
                  fsType = String,
                  nodeExpandSecretRef = refs.oneOf."361",
                  nodePublishSecretRef = refs.oneOf."361",
                  nodeStageSecretRef = refs.oneOf."361",
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
                  nodePublishSecretRef = refs.oneOf."268",
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
                  secretRef = refs.oneOf."361",
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
                  secretRef = refs.oneOf."268",
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
                  secretRef = refs.oneOf."361",
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
                  secretRef = refs.oneOf."268",
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
                  labelSelector = refs.oneOf."614",
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
                  conditions = js2n.array.ArrayOf refs.oneOf."201",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatus |] ],
                  metadata = refs.oneOf."619"
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
                  items = js2n.array.ArrayOf refs.oneOf."202",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatusList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619"
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
                  items = js2n.array.ArrayOf refs.oneOf."204",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ConfigMapList |] ],
                  metadata = refs.oneOf."616"
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
                  items = js2n.array.ArrayOf refs.oneOf."258",
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
                  items = js2n.array.ArrayOf refs.oneOf."258",
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
                  env = js2n.array.ArrayOf refs.oneOf."232",
                  envFrom = js2n.array.ArrayOf refs.oneOf."231",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."259",
                  livenessProbe = refs.oneOf."331",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."213",
                  readinessProbe = refs.oneOf."331",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."214",
                  resources = refs.oneOf."348",
                  restartPolicy = String,
                  securityContext = refs.oneOf."363",
                  startupProbe = refs.oneOf."331",
                  stdin = Bool,
                  stdinOnce = Bool,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."386",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."387",
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
            properties =
              {
                  running = refs.oneOf."216",
                  terminated = refs.oneOf."217",
                  waiting = refs.oneOf."218"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { startedAt = refs.oneOf."627" },
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
                  finishedAt = refs.oneOf."627",
                  message = String,
                  reason = String,
                  signal = std.number.Integer,
                  startedAt = refs.oneOf."627"
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
                    js2n.array.ArrayOf refs.oneOf."349",
                  containerID = String,
                  image = String,
                  imageID = String,
                  lastState = refs.oneOf."215",
                  name = String,
                  ready = Bool,
                  resources = refs.oneOf."348",
                  restartCount = std.number.Integer,
                  started = Bool,
                  state = refs.oneOf."215",
                  user = refs.oneOf."220",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."388"
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
            properties = { linux = refs.oneOf."265" },
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
            properties = { items = js2n.array.ArrayOf refs.oneOf."223" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldRef = refs.oneOf."294",
                  mode = std.number.Integer,
                  path = String,
                  resourceFieldRef = refs.oneOf."342"
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
                  items = js2n.array.ArrayOf refs.oneOf."223"
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
                  targetRef = refs.oneOf."295"
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
                  addresses = js2n.array.ArrayOf refs.oneOf."226",
                  notReadyAddresses = js2n.array.ArrayOf refs.oneOf."226",
                  ports = js2n.array.ArrayOf refs.oneOf."227"
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
                  metadata = refs.oneOf."619",
                  subsets = js2n.array.ArrayOf refs.oneOf."228"
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
                  items = js2n.array.ArrayOf refs.oneOf."229",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointsList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapRef = refs.oneOf."205",
                  prefix = String,
                  secretRef = refs.oneOf."357"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { name = String, value = String, valueFrom = refs.oneOf."233" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapKeyRef = refs.oneOf."206",
                  fieldRef = refs.oneOf."294",
                  resourceFieldRef = refs.oneOf."342",
                  secretKeyRef = refs.oneOf."358"
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
                  env = js2n.array.ArrayOf refs.oneOf."232",
                  envFrom = js2n.array.ArrayOf refs.oneOf."231",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."259",
                  livenessProbe = refs.oneOf."331",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."213",
                  readinessProbe = refs.oneOf."331",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."214",
                  resources = refs.oneOf."348",
                  restartPolicy = String,
                  securityContext = refs.oneOf."363",
                  startupProbe = refs.oneOf."331",
                  stdin = Bool,
                  stdinOnce = Bool,
                  targetContainerName = String,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."386",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."387",
                  workingDir = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { volumeClaimTemplate = refs.oneOf."302" },
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
                  eventTime = refs.oneOf."618",
                  firstTimestamp = refs.oneOf."627",
                  involvedObject = refs.oneOf."295",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  lastTimestamp = refs.oneOf."627",
                  message = String,
                  metadata = refs.oneOf."619",
                  reason = String,
                  related = refs.oneOf."295",
                  reportingComponent = String,
                  reportingInstance = String,
                  series = refs.oneOf."238",
                  source = refs.oneOf."239",
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
                  items = js2n.array.ArrayOf refs.oneOf."236",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."616"
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
                  lastObservedTime = refs.oneOf."618"
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
                  secretRef = refs.oneOf."361"
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
                  secretRef = refs.oneOf."268"
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
                  httpHeaders = js2n.array.ArrayOf refs.oneOf."251",
                  path = String,
                  port = refs.oneOf."630",
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
                  secretRef = refs.oneOf."361",
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
                  secretRef = refs.oneOf."268",
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
              { postStart = refs.oneOf."260", preStop = refs.oneOf."260" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."240",
                  httpGet = refs.oneOf."250",
                  sleep = refs.oneOf."373",
                  tcpSocket = refs.oneOf."377"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."264"
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
                  items = js2n.array.ArrayOf refs.oneOf."261",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LimitRangeList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { limits = js2n.array.ArrayOf refs.oneOf."262" },
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
                  ports = js2n.array.ArrayOf refs.oneOf."328"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."266" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."275",
                  status = refs.oneOf."276"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."272",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NamespaceList |] ],
                  metadata = refs.oneOf."616"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."273",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."291",
                  status = refs.oneOf."292"
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
                    js2n.array.ArrayOf refs.oneOf."330",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    refs.oneOf."288"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastHeartbeatTime = refs.oneOf."627",
                  lastTransitionTime = refs.oneOf."627",
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
            properties = { configMap = refs.oneOf."208" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = refs.oneOf."281",
                  assigned = refs.oneOf."281",
                  error = String,
                  lastKnownGood = refs.oneOf."281"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { kubeletEndpoint = refs.oneOf."221" },
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
                  items = js2n.array.ArrayOf refs.oneOf."277",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NodeList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { features = refs.oneOf."287", name = String },
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
              { nodeSelectorTerms = js2n.array.ArrayOf refs.oneOf."290" },
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
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."289",
                  matchFields = js2n.array.ArrayOf refs.oneOf."289"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configSource = refs.oneOf."281",
                  externalID = String,
                  podCIDR = String,
                  podCIDRs = js2n.array.ArrayOf String,
                  providerID = String,
                  taints = js2n.array.ArrayOf refs.oneOf."378",
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
                  addresses = js2n.array.ArrayOf refs.oneOf."278",
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
                  conditions = js2n.array.ArrayOf refs.oneOf."280",
                  config = refs.oneOf."282",
                  daemonEndpoints = refs.oneOf."283",
                  features = refs.oneOf."284",
                  images = js2n.array.ArrayOf refs.oneOf."212",
                  nodeInfo = refs.oneOf."293",
                  phase = String,
                  runtimeHandlers = js2n.array.ArrayOf refs.oneOf."286",
                  volumesAttached = js2n.array.ArrayOf refs.oneOf."187",
                  volumesInUse = js2n.array.ArrayOf String
                },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."305",
                  status = refs.oneOf."306"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."300",
                  status = refs.oneOf."301"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."627",
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."297",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PersistentVolumeClaimList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  dataSource = refs.oneOf."383",
                  dataSourceRef = refs.oneOf."384",
                  resources = refs.oneOf."391",
                  selector = refs.oneOf."614",
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
                  conditions = js2n.array.ArrayOf refs.oneOf."298",
                  currentVolumeAttributesClassName = String,
                  modifyVolumeStatus = refs.oneOf."270",
                  phase = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."619", spec = refs.oneOf."300" },
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
                  items = js2n.array.ArrayOf refs.oneOf."296",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolumeList |] ],
                  metadata = refs.oneOf."616"
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
                  awsElasticBlockStore = refs.oneOf."184",
                  azureDisk = refs.oneOf."188",
                  azureFile = refs.oneOf."189",
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  cephfs = refs.oneOf."195",
                  cinder = refs.oneOf."197",
                  claimRef = refs.oneOf."295",
                  csi = refs.oneOf."192",
                  fc = refs.oneOf."241",
                  flexVolume = refs.oneOf."242",
                  flocker = refs.oneOf."244",
                  gcePersistentDisk = refs.oneOf."245",
                  glusterfs = refs.oneOf."248",
                  hostPath = refs.oneOf."254",
                  iscsi = refs.oneOf."255",
                  local = refs.oneOf."269",
                  mountOptions = js2n.array.ArrayOf String,
                  nfs = refs.oneOf."271",
                  nodeAffinity = refs.oneOf."389",
                  persistentVolumeReclaimPolicy = String,
                  photonPersistentDisk = refs.oneOf."307",
                  portworxVolume = refs.oneOf."329",
                  quobyte = refs.oneOf."333",
                  rbd = refs.oneOf."334",
                  scaleIO = refs.oneOf."351",
                  storageClassName = String,
                  storageos = refs.oneOf."374",
                  volumeAttributesClassName = String,
                  volumeMode = String,
                  vsphereVolume = refs.oneOf."392"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastPhaseTransitionTime = refs.oneOf."627",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."323",
                  status = refs.oneOf."324"
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
                    js2n.array.ArrayOf refs.oneOf."393",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."310"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."614",
                  matchLabelKeys = js2n.array.ArrayOf String,
                  mismatchLabelKeys = js2n.array.ArrayOf String,
                  namespaceSelector = refs.oneOf."614",
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
                    js2n.array.ArrayOf refs.oneOf."393",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."310"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."627",
                  lastTransitionTime = refs.oneOf."627",
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
                  nameservers = js2n.array.ArrayOf String,
                  options = js2n.array.ArrayOf refs.oneOf."314",
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
                  items = js2n.array.ArrayOf refs.oneOf."308",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodList |] ],
                  metadata = refs.oneOf."616"
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
                  appArmorProfile = refs.oneOf."186",
                  fsGroup = std.number.Integer,
                  fsGroupChangePolicy = String,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxChangePolicy = String,
                  seLinuxOptions = refs.oneOf."350",
                  seccompProfile = refs.oneOf."355",
                  supplementalGroups = js2n.array.ArrayOf std.number.Integer,
                  supplementalGroupsPolicy = String,
                  sysctls = js2n.array.ArrayOf refs.oneOf."376",
                  windowsOptions = refs.oneOf."394"
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
                  affinity = refs.oneOf."185",
                  automountServiceAccountToken = Bool,
                  containers = js2n.array.ArrayOf refs.oneOf."211",
                  dnsConfig = refs.oneOf."313",
                  dnsPolicy = String,
                  enableServiceLinks = Bool,
                  ephemeralContainers = js2n.array.ArrayOf refs.oneOf."234",
                  hostAliases = js2n.array.ArrayOf refs.oneOf."252",
                  hostIPC = Bool,
                  hostNetwork = Bool,
                  hostPID = Bool,
                  hostUsers = Bool,
                  hostname = String,
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."268",
                  initContainers = js2n.array.ArrayOf refs.oneOf."211",
                  nodeName = String,
                  nodeSelector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  os = refs.oneOf."317",
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
                  readinessGates = js2n.array.ArrayOf refs.oneOf."318",
                  resourceClaims = js2n.array.ArrayOf refs.oneOf."319",
                  resources = refs.oneOf."348",
                  restartPolicy = String,
                  runtimeClassName = String,
                  schedulerName = String,
                  schedulingGates = js2n.array.ArrayOf refs.oneOf."321",
                  securityContext = refs.oneOf."322",
                  serviceAccount = String,
                  serviceAccountName = String,
                  setHostnameAsFQDN = Bool,
                  shareProcessNamespace = Bool,
                  subdomain = String,
                  terminationGracePeriodSeconds = std.number.Integer,
                  tolerations = js2n.array.ArrayOf refs.oneOf."379",
                  topologySpreadConstraints =
                    js2n.array.ArrayOf refs.oneOf."382",
                  volumes = js2n.array.ArrayOf refs.oneOf."385"
                },
            required = { containers = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."312",
                  containerStatuses = js2n.array.ArrayOf refs.oneOf."219",
                  ephemeralContainerStatuses =
                    js2n.array.ArrayOf refs.oneOf."219",
                  hostIP = String,
                  hostIPs = js2n.array.ArrayOf refs.oneOf."253",
                  initContainerStatuses = js2n.array.ArrayOf refs.oneOf."219",
                  message = String,
                  nominatedNodeName = String,
                  phase = String,
                  podIP = String,
                  podIPs = js2n.array.ArrayOf refs.oneOf."315",
                  qosClass = String,
                  reason = String,
                  resize = String,
                  resourceClaimStatuses = js2n.array.ArrayOf refs.oneOf."320",
                  startTime = refs.oneOf."627"
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
                  metadata = refs.oneOf."619",
                  template = refs.oneOf."327"
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
                  items = js2n.array.ArrayOf refs.oneOf."325",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodTemplateList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."619", spec = refs.oneOf."323" },
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
              { preference = refs.oneOf."290", weight = std.number.Integer },
            required = { preference = true, weight = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."240",
                  failureThreshold = std.number.Integer,
                  grpc = refs.oneOf."246",
                  httpGet = refs.oneOf."250",
                  initialDelaySeconds = std.number.Integer,
                  periodSeconds = std.number.Integer,
                  successThreshold = std.number.Integer,
                  tcpSocket = refs.oneOf."377",
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
                  sources = js2n.array.ArrayOf refs.oneOf."390"
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
                  secretRef = refs.oneOf."361",
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
                  secretRef = refs.oneOf."268",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."339",
                  status = refs.oneOf."340"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."336",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ReplicationControllerList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  template = refs.oneOf."327"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."337",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."346",
                  status = refs.oneOf."347"
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
                  items = js2n.array.ArrayOf refs.oneOf."344",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceQuotaList |] ],
                  metadata = refs.oneOf."616"
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
                  scopeSelector = refs.oneOf."353",
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
                  claims = js2n.array.ArrayOf refs.oneOf."341",
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
                  resources = js2n.array.ArrayOf refs.oneOf."343"
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
                  secretRef = refs.oneOf."361",
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
                  secretRef = refs.oneOf."268",
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
              { matchExpressions = js2n.array.ArrayOf refs.oneOf."354" },
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
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."356",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SecretList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  items = js2n.array.ArrayOf refs.oneOf."258",
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
                  items = js2n.array.ArrayOf refs.oneOf."258",
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
                  appArmorProfile = refs.oneOf."186",
                  capabilities = refs.oneOf."194",
                  privileged = Bool,
                  procMount = String,
                  readOnlyRootFilesystem = Bool,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxOptions = refs.oneOf."350",
                  seccompProfile = refs.oneOf."355",
                  windowsOptions = refs.oneOf."394"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."370",
                  status = refs.oneOf."371"
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
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."268",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccount |] ],
                  metadata = refs.oneOf."619",
                  secrets = js2n.array.ArrayOf refs.oneOf."295"
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
                  items = js2n.array.ArrayOf refs.oneOf."365",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccountList |] ],
                  metadata = refs.oneOf."616"
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
                  items = js2n.array.ArrayOf refs.oneOf."364",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceList |] ],
                  metadata = refs.oneOf."616"
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
                  targetPort = refs.oneOf."630"
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
                  ports = js2n.array.ArrayOf refs.oneOf."369",
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
                  sessionAffinityConfig = refs.oneOf."372",
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
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
                  loadBalancer = refs.oneOf."267"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { clientIP = refs.oneOf."199" },
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
                  secretRef = refs.oneOf."295",
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
                  secretRef = refs.oneOf."268",
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
            properties = { host = String, port = refs.oneOf."630" },
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
                  timeAdded = refs.oneOf."627",
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
              { matchLabelExpressions = js2n.array.ArrayOf refs.oneOf."380" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."614",
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
                  awsElasticBlockStore = refs.oneOf."184",
                  azureDisk = refs.oneOf."188",
                  azureFile = refs.oneOf."190",
                  cephfs = refs.oneOf."196",
                  cinder = refs.oneOf."198",
                  configMap = refs.oneOf."210",
                  csi = refs.oneOf."193",
                  downwardAPI = refs.oneOf."224",
                  emptyDir = refs.oneOf."225",
                  ephemeral = refs.oneOf."235",
                  fc = refs.oneOf."241",
                  flexVolume = refs.oneOf."243",
                  flocker = refs.oneOf."244",
                  gcePersistentDisk = refs.oneOf."245",
                  gitRepo = refs.oneOf."247",
                  glusterfs = refs.oneOf."249",
                  hostPath = refs.oneOf."254",
                  image = refs.oneOf."257",
                  iscsi = refs.oneOf."256",
                  name = String,
                  nfs = refs.oneOf."271",
                  persistentVolumeClaim = refs.oneOf."303",
                  photonPersistentDisk = refs.oneOf."307",
                  portworxVolume = refs.oneOf."329",
                  projected = refs.oneOf."332",
                  quobyte = refs.oneOf."333",
                  rbd = refs.oneOf."335",
                  scaleIO = refs.oneOf."352",
                  secret = refs.oneOf."362",
                  storageos = refs.oneOf."375",
                  vsphereVolume = refs.oneOf."392"
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
            properties = { required = refs.oneOf."288" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clusterTrustBundle = refs.oneOf."200",
                  configMap = refs.oneOf."209",
                  downwardAPI = refs.oneOf."222",
                  secret = refs.oneOf."360",
                  serviceAccountToken = refs.oneOf."367"
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
                  podAffinityTerm = refs.oneOf."310",
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
                  conditions = refs.oneOf."396",
                  deprecatedTopology =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  hints = refs.oneOf."397",
                  hostname = String,
                  nodeName = String,
                  targetRef = refs.oneOf."295",
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
            properties = { forZones = js2n.array.ArrayOf refs.oneOf."401" },
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
                  endpoints = js2n.array.ArrayOf refs.oneOf."395",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSlice |] ],
                  metadata = refs.oneOf."619",
                  ports = js2n.array.ArrayOf refs.oneOf."398"
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
                  items = js2n.array.ArrayOf refs.oneOf."399",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSliceList |] ],
                  metadata = refs.oneOf."616"
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
                  action = String,
                  apiVersion = String,
                  deprecatedCount = std.number.Integer,
                  deprecatedFirstTimestamp = refs.oneOf."627",
                  deprecatedLastTimestamp = refs.oneOf."627",
                  deprecatedSource = refs.oneOf."239",
                  eventTime = refs.oneOf."618",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  metadata = refs.oneOf."619",
                  note = String,
                  reason = String,
                  regarding = refs.oneOf."295",
                  related = refs.oneOf."295",
                  reportingController = String,
                  reportingInstance = String,
                  series = refs.oneOf."404",
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
                  items = js2n.array.ArrayOf refs.oneOf."402",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."616"
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
                  lastObservedTime = refs.oneOf."618"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."410",
                  status = refs.oneOf."411"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."407",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'FlowSchemaList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinguisherMethod = refs.oneOf."406",
                  matchingPrecedence = std.number.Integer,
                  priorityLevelConfiguration = refs.oneOf."420",
                  rules = js2n.array.ArrayOf refs.oneOf."416"
                },
            required = { priorityLevelConfiguration = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."408" },
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
            properties = { queuing = refs.oneOf."423", type = String },
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
                  limitResponse = refs.oneOf."413",
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
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."415",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."424",
                  subjects = js2n.array.ArrayOf refs.oneOf."426"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."421",
                  status = refs.oneOf."422"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."417",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PriorityLevelConfigurationList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  exempt = refs.oneOf."405",
                  limited = refs.oneOf."414",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."418" },
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
                  group = refs.oneOf."412",
                  kind = String,
                  serviceAccount = refs.oneOf."425",
                  user = refs.oneOf."427"
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
              { backend = refs.oneOf."432", path = String, pathType = String },
            required = { backend = true, pathType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { paths = js2n.array.ArrayOf refs.oneOf."428" },
            required = { paths = true },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."443",
                  status = refs.oneOf."444"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { resource = refs.oneOf."383", service = refs.oneOf."442" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."436"
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
                  items = js2n.array.ArrayOf refs.oneOf."433",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressClassList |] ],
                  metadata = refs.oneOf."616"
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
            properties = { controller = String, parameters = refs.oneOf."435" },
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
                        [ std.enum.TagOrString, [| 'IngressList |] ],
                  metadata = refs.oneOf."616"
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
                  ports = js2n.array.ArrayOf refs.oneOf."440"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."438" },
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
            properties = { host = String, http = refs.oneOf."429" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, port = refs.oneOf."453" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultBackend = refs.oneOf."432",
                  ingressClassName = String,
                  rules = js2n.array.ArrayOf refs.oneOf."441",
                  tls = js2n.array.ArrayOf refs.oneOf."445"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { loadBalancer = refs.oneOf."439" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."452"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ports = js2n.array.ArrayOf refs.oneOf."451",
                  to = js2n.array.ArrayOf refs.oneOf."450"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  from = js2n.array.ArrayOf refs.oneOf."450",
                  ports = js2n.array.ArrayOf refs.oneOf."451"
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
                  items = js2n.array.ArrayOf refs.oneOf."446",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NetworkPolicyList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ipBlock = refs.oneOf."430",
                  namespaceSelector = refs.oneOf."614",
                  podSelector = refs.oneOf."614"
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
                  port = refs.oneOf."630",
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
                  egress = js2n.array.ArrayOf refs.oneOf."447",
                  ingress = js2n.array.ArrayOf refs.oneOf."448",
                  podSelector = refs.oneOf."614",
                  policyTypes = js2n.array.ArrayOf String
                },
            required = { podSelector = true },
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
                        [ std.enum.TagOrString, [| 'IPAddress |] ],
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."456"
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
                  items = js2n.array.ArrayOf refs.oneOf."454",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddressList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { parentRef = refs.oneOf."457" },
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
                  metadata = refs.oneOf."619",
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
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."458",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDRList |] ],
                  metadata = refs.oneOf."616"
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
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."609" },
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
                  metadata = refs.oneOf."619",
                  overhead = refs.oneOf."462",
                  scheduling = refs.oneOf."465"
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
                  items = js2n.array.ArrayOf refs.oneOf."463",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RuntimeClassList |] ],
                  metadata = refs.oneOf."616"
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
                  tolerations = js2n.array.ArrayOf refs.oneOf."379"
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
                  deleteOptions = refs.oneOf."610",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Eviction |] ],
                  metadata = refs.oneOf."619"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."469",
                  status = refs.oneOf."470"
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
                  items = js2n.array.ArrayOf refs.oneOf."467",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PodDisruptionBudgetList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."630",
                  minAvailable = refs.oneOf."630",
                  selector = refs.oneOf."614",
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
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
                  currentHealthy = std.number.Integer,
                  desiredHealthy = std.number.Integer,
                  disruptedPods =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."627"
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
              { clusterRoleSelectors = js2n.array.ArrayOf refs.oneOf."614" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  aggregationRule = refs.oneOf."471",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRole |] ],
                  metadata = refs.oneOf."619",
                  rules = js2n.array.ArrayOf refs.oneOf."476"
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
                  metadata = refs.oneOf."619",
                  roleRef = refs.oneOf."481",
                  subjects = js2n.array.ArrayOf refs.oneOf."482"
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
                  items = js2n.array.ArrayOf refs.oneOf."473",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleBindingList |] ],
                  metadata = refs.oneOf."616"
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
                  items = js2n.array.ArrayOf refs.oneOf."472",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
                  rules = js2n.array.ArrayOf refs.oneOf."476"
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
                  metadata = refs.oneOf."619",
                  roleRef = refs.oneOf."481",
                  subjects = js2n.array.ArrayOf refs.oneOf."482"
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
                  items = js2n.array.ArrayOf refs.oneOf."478",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleBindingList |] ],
                  metadata = refs.oneOf."616"
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
                  items = js2n.array.ArrayOf refs.oneOf."477",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleList |] ],
                  metadata = refs.oneOf."616"
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
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
                  data = refs.oneOf."629",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."501",
                  pool = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { devices = refs.oneOf."489", nodeSelector = refs.oneOf."288" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."490"
                        },
                  capacity =
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
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { basic = refs.oneOf."485", name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."502",
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
                  config = js2n.array.ArrayOf refs.oneOf."488",
                  results = js2n.array.ArrayOf refs.oneOf."499"
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
                  config = js2n.array.ArrayOf refs.oneOf."492",
                  constraints = js2n.array.ArrayOf refs.oneOf."497",
                  requests = js2n.array.ArrayOf refs.oneOf."498"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."502",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."496"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."502" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."493",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."494",
                  selectors = js2n.array.ArrayOf refs.oneOf."500"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchAttribute = String, requests = js2n.array.ArrayOf String },
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
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."500"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  device = String,
                  driver = String,
                  pool = String,
                  request = String
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."486" },
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
            properties = { driver = String, parameters = refs.oneOf."629" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."506",
                  status = refs.oneOf."507"
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
                  items = js2n.array.ArrayOf refs.oneOf."503",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."491" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."484",
                  devices = js2n.array.ArrayOf refs.oneOf."483",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."504"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."510"
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
                  items = js2n.array.ArrayOf refs.oneOf."508",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."619", spec = refs.oneOf."506" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."514"
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
                  items = js2n.array.ArrayOf refs.oneOf."512",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."616"
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
                  devices = js2n.array.ArrayOf refs.oneOf."487",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."288",
                  pool = refs.oneOf."511"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."609",
                  data = refs.oneOf."629",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."534",
                  pool = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { devices = refs.oneOf."521", nodeSelector = refs.oneOf."288" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."522"
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."523"
                        }
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
            properties = { basic = refs.oneOf."517", name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."535",
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
                  config = js2n.array.ArrayOf refs.oneOf."520",
                  results = js2n.array.ArrayOf refs.oneOf."532"
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
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."525",
                  constraints = js2n.array.ArrayOf refs.oneOf."530",
                  requests = js2n.array.ArrayOf refs.oneOf."531"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."535",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."529"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."535" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."526",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."527",
                  selectors = js2n.array.ArrayOf refs.oneOf."533"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchAttribute = String, requests = js2n.array.ArrayOf String },
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
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."533"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  device = String,
                  driver = String,
                  pool = String,
                  request = String
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."518" },
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
            properties = { driver = String, parameters = refs.oneOf."629" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."539",
                  status = refs.oneOf."540"
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
                  items = js2n.array.ArrayOf refs.oneOf."536",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."524" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."516",
                  devices = js2n.array.ArrayOf refs.oneOf."515",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."537"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."543"
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
                  items = js2n.array.ArrayOf refs.oneOf."541",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."619", spec = refs.oneOf."539" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."547"
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
                  items = js2n.array.ArrayOf refs.oneOf."545",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."616"
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
                  devices = js2n.array.ArrayOf refs.oneOf."519",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."288",
                  pool = refs.oneOf."544"
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
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."548",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PriorityClassList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
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
                        [ std.enum.TagOrString, [| 'CSIDriverList |] ],
                  metadata = refs.oneOf."616"
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
                  podInfoOnMount = Bool,
                  requiresRepublish = Bool,
                  seLinuxMount = Bool,
                  storageCapacity = Bool,
                  tokenRequests = js2n.array.ArrayOf refs.oneOf."561",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."556"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocatable = refs.oneOf."568",
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
                  items = js2n.array.ArrayOf refs.oneOf."553",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSINodeList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { drivers = js2n.array.ArrayOf refs.oneOf."554" },
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
                  metadata = refs.oneOf."619",
                  nodeTopology = refs.oneOf."614",
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
                  items = js2n.array.ArrayOf refs.oneOf."557",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIStorageCapacityList |] ],
                  metadata = refs.oneOf."616"
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
                  allowedTopologies = js2n.array.ArrayOf refs.oneOf."381",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClass |] ],
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."559",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClassList |] ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."565",
                  status = refs.oneOf."566"
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
                  items = js2n.array.ArrayOf refs.oneOf."562",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttachmentList |] ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  inlineVolumeSpec = refs.oneOf."305",
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
                  source = refs.oneOf."564"
                },
            required = { attacher = true, nodeName = true, source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attachError = refs.oneOf."567",
                  attached = Bool,
                  attachmentMetadata =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  detachError = refs.oneOf."567"
                },
            required = { attached = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { message = String, time = refs.oneOf."627" },
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
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."569",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  metadata = refs.oneOf."619",
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
                  items = js2n.array.ArrayOf refs.oneOf."571",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  lastUpdateTime = refs.oneOf."627",
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."577",
                  status = refs.oneOf."578"
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
                  items = js2n.array.ArrayOf refs.oneOf."575",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'StorageVersionMigrationList |]
                        ],
                  metadata = refs.oneOf."616"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { continueToken = String, resource = refs.oneOf."573" },
            required = { resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."574",
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
            properties = { strategy = String, webhook = refs.oneOf."602" },
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."585",
                  status = refs.oneOf."586"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."581",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CustomResourceDefinitionList |]
                        ],
                  metadata = refs.oneOf."616"
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
                  conversion = refs.oneOf."580",
                  group = String,
                  names = refs.oneOf."584",
                  preserveUnknownFields = Bool,
                  scope = String,
                  versions = js2n.array.ArrayOf refs.oneOf."587"
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
                  acceptedNames = refs.oneOf."584",
                  conditions = js2n.array.ArrayOf refs.oneOf."582",
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
                    js2n.array.ArrayOf refs.oneOf."579",
                  deprecated = Bool,
                  deprecationWarning = String,
                  name = String,
                  schema = refs.oneOf."591",
                  selectableFields = js2n.array.ArrayOf refs.oneOf."598",
                  served = Bool,
                  storage = Bool,
                  subresources = refs.oneOf."590"
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
              { scale = refs.oneOf."588", status = refs.oneOf."589" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { openAPIV3Schema = refs.oneOf."594" },
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
                  allOf = js2n.array.ArrayOf refs.oneOf."594",
                  anyOf = js2n.array.ArrayOf refs.oneOf."594",
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
                          additional = 'Some refs.oneOf."594"
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
                  externalDocs = refs.oneOf."592",
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
                  not = refs.oneOf."594",
                  nullable = Bool,
                  oneOf = js2n.array.ArrayOf refs.oneOf."594",
                  pattern = String,
                  patternProperties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."594"
                        },
                  properties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."594"
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
                  x-kubernetes-validations = js2n.array.ArrayOf refs.oneOf."600"
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
              { caBundle = String, service = refs.oneOf."599", url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clientConfig = refs.oneOf."601",
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
                  preferredVersion = refs.oneOf."613",
                  serverAddressByClientCIDRs =
                    js2n.array.ArrayOf refs.oneOf."623",
                  versions = js2n.array.ArrayOf refs.oneOf."613"
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
                  groups = js2n.array.ArrayOf refs.oneOf."604",
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
                  resources = js2n.array.ArrayOf refs.oneOf."606"
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
                    js2n.array.ArrayOf refs.oneOf."623",
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
                  lastTransitionTime = refs.oneOf."627",
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
                  preconditions = refs.oneOf."622",
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
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."615",
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
                  fieldsV1 = refs.oneOf."612",
                  manager = String,
                  operation = String,
                  subresource = String,
                  time = refs.oneOf."627"
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
                  creationTimestamp = refs.oneOf."627",
                  deletionGracePeriodSeconds = std.number.Integer,
                  deletionTimestamp = refs.oneOf."627",
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
                  managedFields = js2n.array.ArrayOf refs.oneOf."617",
                  name = String,
                  namespace = String,
                  ownerReferences = js2n.array.ArrayOf refs.oneOf."620",
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
                  details = refs.oneOf."626",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Status |] ],
                  message = String,
                  metadata = refs.oneOf."616",
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
                  causes = js2n.array.ArrayOf refs.oneOf."625",
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
            properties = { object = refs.oneOf."629", type = String },
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
                  gitCommit = String,
                  gitTreeState = String,
                  gitVersion = String,
                  goVersion = String,
                  major = String,
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
                  metadata = refs.oneOf."619",
                  spec = refs.oneOf."635",
                  status = refs.oneOf."636"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."627",
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
                  items = js2n.array.ArrayOf refs.oneOf."632",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIServiceList |] ],
                  metadata = refs.oneOf."616"
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
                  service = refs.oneOf."637",
                  version = String,
                  versionPriority = std.number.Integer
                },
            required = { groupPriorityMinimum = true, versionPriority = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."633" },
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