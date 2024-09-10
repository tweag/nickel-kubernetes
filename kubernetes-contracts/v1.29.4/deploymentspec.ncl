# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let predicates =
{
    allOf
      : Array (Dyn -> { success: Bool, error: String }) -> Dyn -> {
        success: Bool,
        error: String
      }
      | doc m%"
      `allOf preds` succeeds if all of the predicates in `preds` succeed
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.1]
      "%
      = fun preds x => std.array.fold_right
          (fun pred acc => let result = pred x in
            if !result.success then result else acc)
          { error = "", success = true, }
          preds,
    always : Dyn -> { success: Bool, error: String }
      = std.function.const { error = "", success = true, },
    anyOf
      : Array (Dyn -> { success: Bool, error: String }) -> Dyn -> {
        success: Bool,
        error: String
      }
      | doc m%"
      `anyOf preds` succeeds if at least one of the predicates in `preds` succeeds
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.2]
      "%
      = fun preds x => (fun result => if result.success then
            { error = "", success = true, }
            else
            {
              error = m%"
                  anyOf: none of the options matched%{std.string.join "\n"
                  result.errors}
                  "%,
              success = false,
            })
          (std.array.fold_right
          (fun pred acc => let result = pred x in
            if result.success || acc.success then
            { errors = [  ], success = true, }
            else
            {
              errors = [
                      m%"
                      - %{result.error}
                      "%
                    ] @
                    acc.errors,
              success = false,
            })
          { errors = [  ], success = false, }
          preds),
    arrays = {
          additionalItems
            : (Dyn -> { success: Bool, error: String }) -> Number -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.2]
            "%
            = fun pred start x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (let x  | Array Dyn = x in
                let value_length = std.array.length x in
                if start >= value_length then
                { error = "", success = true, }
                else
                (arrayOf pred ((std.array.slice start value_length x) | Dyn))),
          arrayOf
            : (Dyn -> { success: Bool, error: String }) -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            Apply a predicate to all elements of an array, succeeding if all
            applications succeed. If the value isn't an array, fail.
            "%
            = fun pred x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (let x  | Array Dyn = x in
                std.array.fold_right
                (fun x acc => let result = pred x in
                  if !result.success then result else acc)
                { error = "", success = true, }
                x),
          contains
            : (Dyn -> { success: Bool, error: String }) -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.6]
            "%
            = fun pred x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (let x  | Array Dyn = x in
                (fun result => if result.success then
                  { error = "", success = true, }
                  else
                  {
                    error = m%"
                        contains: no elements matched%{std.string.join "\n"
                        result.errors}
                        "%,
                    success = false,
                  })
                (std.array.fold_right
                (fun x acc => let result = pred x in
                  if result.success || acc.success then
                  { errors = [  ], success = true, }
                  else
                  {
                    errors = [
                            m%"
                            - %{result.error}
                            "%
                          ] @
                          acc.errors,
                    success = false,
                  })
                { errors = [  ], success = false, }
                x)),
          items
            : Array (Dyn -> { success: Bool, error: String }) -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.1]
            "%
            = fun preds x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (let x  | Array Dyn = x in
                let length_to_check =
                std.number.min (std.array.length preds) (std.array.length x)
                in
                
                std.array.fold_right
                (fun i acc => let result =
                  std.array.at i preds (std.array.at i x)
                  in
                  
                  if !result.success then result else acc)
                { error = "", success = true, }
                (std.array.range 0 length_to_check)),
          maxItems
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            `maxItems n x` fails if `x` is an array of length strictly greater than `n` and succeeds otherwise.
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.3]
            "%
            = fun n x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (if (std.array.length (x | Array Dyn)) > n then
                {
                    error = m%"
                        array is longer than %{std.string.from_number n} items
                        "%,
                    success = false,
                  }
                else
                { error = "", success = true, }),
          minItems
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            `minItems n x` fails if `x` is an array of length strictly smaller than `n` and succeeds otherwise.
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.4]
            "%
            = fun n x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (if (std.array.length (x | Array Dyn)) < n then
                {
                    error = m%"
                        array is shorter than %{std.string.from_number n} items
                        "%,
                    success = false,
                  }
                else
                { error = "", success = true, }),
          uniqueItems
            : Dyn -> { success: Bool, error: String }
            | doc m%"
            Succeeds for any array if its elements are pairwise distinct.
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.5]
            "%
            = let find_duplicate 
                : Array Dyn -> {
                  has_duplicate: Bool,
                  duplicate: Dyn,
                  seen: { _ : Bool }
                } =
              std.array.fold_right
                (fun elt acc => if acc.has_duplicate then acc else
                  (let index = std.serialize 'Json elt in
                  if std.record.has_field index acc.seen then
                  { duplicate = elt, has_duplicate = true, seen = acc.seen, }
                  else
                  {
                    duplicate = null,
                    has_duplicate = false,
                    seen = std.record.insert index true acc.seen,
                  }))
                { duplicate = null, has_duplicate = false, seen = {  }, }
              in
              
              fun x => if !(std.is_array x) then
                { error = "", success = true, }
                else
                (let {has_duplicate  | Dyn, duplicate  | Dyn, ..} =
                find_duplicate (x | Array Dyn)
                in
                
                if has_duplicate then
                {
                    error = m%"
                        duplicate found: %{std.serialize 'Json duplicate}
                        "%,
                    success = false,
                  }
                else
                { error = "", success = true, }),
        },
    const
      : Dyn -> Dyn -> { success: Bool, error: String }
      | doc m%"
      `const value x` succeeds if and only if `x` is equalt to `value`
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.1.3]
      "%
      = fun value x => if x == value then { error = "", success = true, } else
          {
            error = m%"
                expected %{std.serialize 'Json value}
                "%,
            success = false,
          },
    contract_from_predicate
      : (Dyn -> { success: Bool, error: String }) -> Dyn -> Dyn -> Dyn
      = fun predicate label value => let {success  | Dyn, error  | Dyn} =
          predicate value
          in
          
          if success then value else
          ((std.contract.blame_with_message error label) | Dyn),
    enum
      : Array Dyn -> Dyn -> { success: Bool, error: String }
      | doc m%"
      `enum values x` succeeds if and only if `x` is equal to one of the elements of `values`.
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.1.2]
      "%
      = let checkEqual =
        fun input variant => (input == variant) ||
            ((std.is_enum input) &&
            (((std.string.from_enum input) == variant) | Bool))
        in
        
        fun values x => std.array.fold_right
          (fun value acc => if checkEqual x value then
            { error = "", success = true, }
            else
            acc)
          {
            error = m%"
                expected one of %{std.serialize 'Json (values | Dyn)}
                "%,
            success = false,
          }
          values,
    from_simple_predicate
      : String -> (Dyn -> Bool) -> Dyn -> { success: Bool, error: String }
      | doc m%"
      Convert a simple boolean predicate into a predicate supporting error messages
      "%
      = fun error' pred x => { error = error', success = pred x, },
    ifThenElse
      : (Dyn -> { success: Bool, error: String }) -> (Dyn -> {
        success: Bool,
        error: String
      }) -> (Dyn -> { success: Bool, error: String }) -> Dyn -> {
        success: Bool,
        error: String
      }
      | doc m%"
      `ifThenElse i t e` first checks if the predicate `i` succeeds. If it does, it's equivalent to `t`, otherwise it's equivalent to `e`.
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.6]
      "%
      = fun i t e x => let {success  | Dyn, ..} = i x in
          if success then t x else (e x),
    isType
      : [| '"Array", '"Bool", 'Integer, 'Null, '"Number", 'Record, '"String" |]
      -> Dyn -> { success: Bool, error: String }
      = fun t => (match {'Integer => from_simple_predicate "expected an integer"
            (fun x => (std.is_number x) &&
              (std.number.is_integer (x | Number))),
            'Null => from_simple_predicate "expected `null`"
            (fun x => x == null),
            _ => from_simple_predicate
            m%"
            value is not of type %{std.string.from_enum t}
            "%
            (fun x => (std.typeof x) == t)
          })
          t,
    never : Dyn -> { success: Bool, error: String }
      = std.function.const { error = "never", success = false, },
    not
      : (Dyn -> { success: Bool, error: String }) -> Dyn -> {
        success: Bool,
        error: String
      }
      | doc m%"
      `not pred` succeeds if and only if `pred` fails
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.4]
      "%
      = fun pred x => let result = pred x in
          if result.success then
          {
              error = "Inverted predicate succeeded unexpectedly",
              success = false,
            }
          else
          { error = "", success = true, },
    numbers = {
          exclusiveMaximum
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.3]
            "%
            = fun limit x => if !(std.is_number x) then
                { error = "", success = true, }
                else
                (if (x | Number) < limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected an exclusive maximum of %{std.string.from_number
                      limit}
                      "%,
                  success = false,
                }),
          exclusiveMinimum
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.5]
            "%
            = fun limit x => if !(std.is_number x) then
                { error = "", success = true, }
                else
                (if (x | Number) > limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected an exclusive minimum of %{std.string.from_number
                      limit}
                      "%,
                  success = false,
                }),
          maximum
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.2]
            "%
            = fun limit x => if !(std.is_number x) then
                { error = "", success = true, }
                else
                (if (x | Number) <= limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a maximum of %{std.string.from_number limit}
                      "%,
                  success = false,
                }),
          minimum
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.4]
            "%
            = fun limit x => if !(std.is_number x) then
                { error = "", success = true, }
                else
                (if (x | Number) >= limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a minimum of %{std.string.from_number limit}
                      "%,
                  success = false,
                }),
          multipleOf
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.1]
            "%
            = fun mult x => if !(std.is_number x) then
                { error = "", success = true, }
                else
                (if std.number.is_integer ((x | Number) / mult) then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a multiple of %{std.string.from_number mult}
                      "%,
                  success = false,
                }),
        },
    oneOf
      : Array (Dyn -> { success: Bool, error: String }) -> Dyn -> {
        success: Bool,
        error: String
      }
      | doc m%"
      `oneOf preds` succeeds if precisely one of the predicates in `preds` succeeds
      Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.3]
      "%
      = fun preds x => let count_true 
            : Array { success: Bool, error: String } -> Number =
          fun results => std.array.fold_left
              (fun n b => if b.success then n + 1 else n)
              0
              results
          in
          
          let results = std.array.map (fun pred => pred x) preds in
          let count = count_true results in
          if count == 0 then
          let errors =
            std.array.map
              (fun result => m%"
                - %{result.error}
                "%)
              results
            in
            
            {
              error = m%"
                  oneOf: none of the options matched%{std.string.join "\n"
                  errors}
                  "%,
              success = false,
            }
          else
          (if count > 1 then
          {
              error = "oneOf: more than one of the options matched",
              success = false,
            }
          else
          { error = "", success = true, }),
    records = {
          dependencies
            : { _ : Dyn } -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.7]
            "%
            = let mustHaveFields 
                : Array String -> { _ : Dyn } -> {
                  success: Bool,
                  error: String
                } =
              fun fields x => std.array.fold_right
                  (fun field acc => if !(std.record.has_field field x) then
                    {
                        error = m%"
                            expected field `%{field}`
                            "%,
                        success = false,
                      }
                    else
                    acc)
                  { error = "", success = true, }
                  fields
              in
              
              fun deps x => if !(std.is_record x) then
                { error = "", success = true, }
                else
                (let x  | { _ : Dyn } = x in
                std.array.fold_right
                (fun {field  | Dyn, value  | Dyn} => fun acc =>
                  if !(std.record.has_field field x) then acc else
                    (let result =
                    if std.is_array value then
                      mustHaveFields (value | Array String) x
                      else
                      (let pred  | Dyn -> { success: Bool, error: String } =
                      value
                      in
                      
                      pred (x | Dyn))
                    in
                    
                    if !result.success then
                    {
                        error = m%"
                            dependency of `%{field}` failed: %{result.error}
                            "%,
                        success = false,
                      }
                    else
                    acc))
                { error = "", success = true, }
                (std.record.to_array deps)),
          maxProperties
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            `maxProperties n x` fails if `x` is a record containing stricly more than `n` fields.
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.1]
            "%
            = fun n x => if !(std.is_record x) then
                { error = "", success = true, }
                else
                (if (std.record.length (x | { _ : Dyn })) > n then
                {
                    error = m%"
                        record contains more than %{std.string.from_number
                        n} fields
                        "%,
                    success = false,
                  }
                else
                { error = "", success = true, }),
          minProperties
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            `minProperties n x` fails if `x` is a record containing stricly less than `n` fields.
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.1]
            "%
            = fun n x => if !(std.is_record x) then
                { error = "", success = true, }
                else
                (if (std.record.length (x | { _ : Dyn })) < n then
                {
                    error = m%"
                        record contains fewer than %{std.string.from_number
                        n} fields
                        "%,
                    success = false,
                  }
                else
                { error = "", success = true, }),
          propertyNames
            : (Dyn -> { success: Bool, error: String }) -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.8]
            "%
            = fun pred x => if !(std.is_record x) then
                { error = "", success = true, }
                else
                (std.array.fold_right
                (fun field acc => let result = pred (field | Dyn) in
                  if !result.success then
                  {
                      error = m%"
                          field `%{field}` did not validate against `propertyNames` schema
                          "%,
                      success = false,
                    }
                  else
                  acc)
                { error = "", success = true, }
                (std.record.fields (x | { _ : Dyn }))),
          record
            : { _ : Dyn -> { success: Bool, error: String } } -> { _ : Dyn -> {
              success: Bool,
              error: String
            } } -> Bool -> (Dyn -> { success: Bool, error: String }) -> Dyn -> {
              success: Bool,
              error: String
            }
            | doc m%"
            `record properties patternProperties additionalAllowed
            additionalProperties x` is a combination of the `properties`,
            `patternProperties` and `additionalProperties` validation keywords in
            JSON schema.
            
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5]
            "%
            =
            fun properties patternProperties additionalAllowed additionalProperties x =>
              if !(std.is_record x) then { error = "", success = true, } else
                (let x  | { _ : Dyn } = x in
                let check_properties 
                  : { success: Bool, error: String, checked: { _ : Bool } } =
                std.array.fold_right
                  (fun {field  | Dyn, value  | Dyn} => fun acc =>
                    if !(std.record.has_field field x) then acc else
                      (let result = value x."%{field}" in
                      if !result.success then
                      {
                          checked : { _ : Bool }
                            = {  },
                          error = m%"
                              field `%{field}` didn't validate: %{result.error}
                              "%,
                          success = false,
                        }
                      else
                      {
                        checked = std.record.insert field true acc.checked,
                        error = acc.error,
                        success = acc.success,
                      }))
                  { checked = {  }, error = "", success = true, }
                  (std.record.to_array properties)
                in
                
                let matching_fields  : String -> { _ : Dyn } =
                fun pattern => let matcher = std.string.is_match pattern in
                    std.array.fold_left
                    (fun acc => fun {field  | Dyn, value  | Dyn} => if matcher
                        field then
                        std.record.insert field value acc
                        else
                        acc)
                    {  }
                    (std.record.to_array x)
                in
                
                let check_pattern_properties 
                  : { success: Bool, error: String, checked: { _ : Bool } } =
                std.array.fold_right
                  (fun {field  | Dyn = pattern, value  | Dyn = pred} =>
                  fun acc => let result =
                      std.array.fold_right
                        (fun {field  | Dyn, value  | Dyn} => fun acc =>
                          let result = pred value in
                            if !result.success then
                            {
                                checked : { _ : Bool }
                                  = {  },
                                error = m%"
                                    field `%{field}` didn't validate: %{result.error}
                                    "%,
                                success = false,
                              }
                            else
                            {
                              checked = std.record.insert field true
                                  acc.checked,
                              error = acc.error,
                              success = acc.success,
                            })
                        {
                          checked : { _ : Bool }
                            = {  },
                          error = "",
                          success = true,
                        }
                        (std.record.to_array (matching_fields pattern))
                      in
                      
                      if !result.success then result else
                      {
                        checked = std.array.fold_left
                            (fun r field => if !(std.record.has_field field
                              r) then
                              std.record.insert field true r
                              else
                              r)
                            acc.checked
                            (std.record.fields result.checked),
                        error = acc.error,
                        success = acc.success,
                      })
                  { checked : { _ : Bool } = {  }, error = "", success = true, }
                  (std.record.to_array patternProperties)
                in
                
                let remaining_fields =
                std.array.fold_left
                  (fun acc field => if !(std.record.has_field field acc) then
                    acc
                    else
                    (std.record.remove field acc))
                  x
                  ((std.record.fields check_properties.checked) @
                    (std.record.fields check_pattern_properties.checked))
                in
                
                let check_additional_properties 
                  : { success: Bool, error: String } =
                if (!additionalAllowed) &&
                  (!(std.record.is_empty remaining_fields)) then
                  {
                      error = m%"
                          extra fields %{std.serialize 'Json
                          ((std.record.fields remaining_fields) | Dyn)}
                          "%,
                      success = false,
                    }
                  else
                  (std.array.fold_right
                  (fun {field  | Dyn, value  | Dyn} => fun acc => let result =
                      additionalProperties value
                      in
                      
                      if !result.success then
                      {
                          error = m%"
                              field `%{field}` didn't validate: %{result.error}
                              "%,
                          success = false,
                        }
                      else
                      acc)
                  { error = "", success = true, }
                  (std.record.to_array remaining_fields))
                in
                
                if !check_properties.success then
                { error = check_properties.error, success = false, }
                else
                (if !check_pattern_properties.success then
                { error = check_pattern_properties.error, success = false, }
                else
                check_additional_properties)),
          required
            : Array String -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.3]
            "%
            = fun fields x => if !(std.is_record x) then
                { error = "", success = true, }
                else
                (std.array.fold_right
                (fun field acc => if !(std.record.has_field field
                  (x | { _ : Dyn })) then
                  {
                      error = m%"
                          missing required field %{field}
                          "%,
                      success = false,
                    }
                  else
                  acc)
                { error = "", success = true, }
                fields),
        },
    strings = {
          maxLength
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.1]
            "%
            = fun limit x => if !(std.is_string x) then
                { error = "", success = true, }
                else
                (if (std.string.length (x | String)) <= limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a string of length no larger than %{std.string.from_number
                      limit}
                      "%,
                  success = false,
                }),
          minLength
            : Number -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.2]
            "%
            = fun limit x => if !(std.is_string x) then
                { error = "", success = true, }
                else
                (if (std.string.length (x | String)) >= limit then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a string of length no smaller than %{std.string.from_number
                      limit}
                      "%,
                  success = false,
                }),
          pattern
            : String -> Dyn -> { success: Bool, error: String }
            | doc m%"
            Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.3]
            "%
            = fun pattern x => if !(std.is_string x) then
                { error = "", success = true, }
                else
                (if std.string.is_match pattern (x | String) then
                { error = "", success = true, }
                else
                {
                  error = m%"
                      expected a string matching the pattern `%{pattern}`
                      "%,
                  success = false,
                }),
        },
  }
in

let rec definitions = { contract = {  }, predicate = {  }, } in
{
  minReadySeconds
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    "%
    | optional,
  paused
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Indicates that the deployment is paused.
    "%
    | optional,
  progressDeadlineSeconds
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
    "%
    | optional,
  replicas
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
    "%
    | optional,
  revisionHistoryLimit
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
    "%
    | optional,
  selector
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        matchExpressions = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType '"Array", predicates.isType 'Null ],
              predicates.arrays.arrayOf
              (predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "key", "operator" ],
                predicates.records.record
                {
                  key = predicates.isType '"String",
                  operator = predicates.isType '"String",
                  values = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
                        predicates.arrays.arrayOf
                        (predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ])
                      ],
                }
                {  }
                false
                predicates.never
              ])
            ],
        matchLabels = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record {  } {  } true
              (predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ])
            ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.
    "%,
  strategy
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        rollingUpdate = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                maxSurge = predicates.oneOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                      predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ]
                    ],
                maxUnavailable = predicates.oneOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                      predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ]
                    ],
              }
              {  }
              false
              predicates.never
            ],
        type = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    DeploymentStrategy describes how to replace existing pods with new ones.
    "%
    | optional,
  template
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        metadata = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                annotations = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record {  } {  } true
                      (predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ])
                    ],
                creationTimestamp = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                deletionGracePeriodSeconds = predicates.anyOf
                    [ predicates.isType 'Integer, predicates.isType 'Null ],
                deletionTimestamp = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                finalizers = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ])
                    ],
                generateName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                generation = predicates.anyOf
                    [ predicates.isType 'Integer, predicates.isType 'Null ],
                labels = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record {  } {  } true
                      (predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ])
                    ],
                managedFields = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.record
                        {
                          apiVersion = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          fieldsType = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          fieldsV1 = predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                          manager = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          operation = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          subresource = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          time = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                ownerReferences = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required
                        [ "apiVersion", "kind", "name", "uid" ],
                        predicates.records.record
                        {
                          apiVersion = predicates.isType '"String",
                          blockOwnerDeletion = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          controller = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          kind = predicates.isType '"String",
                          name = predicates.isType '"String",
                          uid = predicates.isType '"String",
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                resourceVersion = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                selfLink = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                uid = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        spec = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.required [ "containers" ],
              predicates.records.record
              {
                activeDeadlineSeconds = predicates.anyOf
                    [ predicates.isType 'Integer, predicates.isType 'Null ],
                affinity = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record
                      {
                        nodeAffinity = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.record
                              {
                                preferredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.isType 'Null
                                      ],
                                      predicates.arrays.arrayOf
                                      (predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "preference", "weight" ],
                                        predicates.records.record
                                        {
                                          preference = predicates.allOf
                                              [
                                                predicates.isType 'Record,
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchFields = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          weight = predicates.isType 'Integer,
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ])
                                    ],
                                requiredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType 'Record,
                                        predicates.isType 'Null
                                      ],
                                      predicates.records.required
                                      [ "nodeSelectorTerms" ],
                                      predicates.records.record
                                      {
                                        nodeSelectorTerms = predicates.allOf
                                            [
                                              predicates.isType '"Array",
                                              predicates.arrays.arrayOf
                                              (predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchFields = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ])
                                            ],
                                      }
                                      {  }
                                      false
                                      predicates.never
                                    ],
                              }
                              {  }
                              false
                              predicates.never
                            ],
                        podAffinity = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.record
                              {
                                preferredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.isType 'Null
                                      ],
                                      predicates.arrays.arrayOf
                                      (predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "podAffinityTerm", "weight" ],
                                        predicates.records.record
                                        {
                                          podAffinityTerm = predicates.allOf
                                              [
                                                predicates.isType 'Record,
                                                predicates.records.required
                                                [ "topologyKey" ],
                                                predicates.records.record
                                                {
                                                  labelSelector =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          matchExpressions =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Array",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.arrays.arrayOf
                                                                (predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.required
                                                                  [
                                                                    "key",
                                                                    "operator"
                                                                  ],
                                                                  predicates.records.record
                                                                  {
                                                                    key =
                                                                      predicates.isType
                                                                        '"String",
                                                                    operator =
                                                                      predicates.isType
                                                                        '"String",
                                                                    values =
                                                                      predicates.allOf
                                                                        [
                                                                          predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"Array",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                          predicates.arrays.arrayOf
                                                                          (predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ])
                                                                        ],
                                                                  }
                                                                  {  }
                                                                  false
                                                                  predicates.never
                                                                ])
                                                              ],
                                                          matchLabels =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  matchLabelKeys =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  mismatchLabelKeys =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  namespaceSelector =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          matchExpressions =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Array",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.arrays.arrayOf
                                                                (predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.required
                                                                  [
                                                                    "key",
                                                                    "operator"
                                                                  ],
                                                                  predicates.records.record
                                                                  {
                                                                    key =
                                                                      predicates.isType
                                                                        '"String",
                                                                    operator =
                                                                      predicates.isType
                                                                        '"String",
                                                                    values =
                                                                      predicates.allOf
                                                                        [
                                                                          predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"Array",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                          predicates.arrays.arrayOf
                                                                          (predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ])
                                                                        ],
                                                                  }
                                                                  {  }
                                                                  false
                                                                  predicates.never
                                                                ])
                                                              ],
                                                          matchLabels =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  namespaces = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  topologyKey =
                                                    predicates.isType '"String",
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          weight = predicates.isType 'Integer,
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ])
                                    ],
                                requiredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.isType 'Null
                                      ],
                                      predicates.arrays.arrayOf
                                      (predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "topologyKey" ],
                                        predicates.records.record
                                        {
                                          labelSelector = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchLabels = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          matchLabelKeys = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          mismatchLabelKeys = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          namespaceSelector = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchLabels = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          namespaces = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          topologyKey = predicates.isType
                                              '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ])
                                    ],
                              }
                              {  }
                              false
                              predicates.never
                            ],
                        podAntiAffinity = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.record
                              {
                                preferredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.isType 'Null
                                      ],
                                      predicates.arrays.arrayOf
                                      (predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "podAffinityTerm", "weight" ],
                                        predicates.records.record
                                        {
                                          podAffinityTerm = predicates.allOf
                                              [
                                                predicates.isType 'Record,
                                                predicates.records.required
                                                [ "topologyKey" ],
                                                predicates.records.record
                                                {
                                                  labelSelector =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          matchExpressions =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Array",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.arrays.arrayOf
                                                                (predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.required
                                                                  [
                                                                    "key",
                                                                    "operator"
                                                                  ],
                                                                  predicates.records.record
                                                                  {
                                                                    key =
                                                                      predicates.isType
                                                                        '"String",
                                                                    operator =
                                                                      predicates.isType
                                                                        '"String",
                                                                    values =
                                                                      predicates.allOf
                                                                        [
                                                                          predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"Array",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                          predicates.arrays.arrayOf
                                                                          (predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ])
                                                                        ],
                                                                  }
                                                                  {  }
                                                                  false
                                                                  predicates.never
                                                                ])
                                                              ],
                                                          matchLabels =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  matchLabelKeys =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  mismatchLabelKeys =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  namespaceSelector =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          matchExpressions =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Array",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.arrays.arrayOf
                                                                (predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.required
                                                                  [
                                                                    "key",
                                                                    "operator"
                                                                  ],
                                                                  predicates.records.record
                                                                  {
                                                                    key =
                                                                      predicates.isType
                                                                        '"String",
                                                                    operator =
                                                                      predicates.isType
                                                                        '"String",
                                                                    values =
                                                                      predicates.allOf
                                                                        [
                                                                          predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"Array",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                          predicates.arrays.arrayOf
                                                                          (predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ])
                                                                        ],
                                                                  }
                                                                  {  }
                                                                  false
                                                                  predicates.never
                                                                ])
                                                              ],
                                                          matchLabels =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  namespaces = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  topologyKey =
                                                    predicates.isType '"String",
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          weight = predicates.isType 'Integer,
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ])
                                    ],
                                requiredDuringSchedulingIgnoredDuringExecution =
                                  predicates.allOf
                                    [
                                      predicates.anyOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.isType 'Null
                                      ],
                                      predicates.arrays.arrayOf
                                      (predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "topologyKey" ],
                                        predicates.records.record
                                        {
                                          labelSelector = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchLabels = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          matchLabelKeys = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          mismatchLabelKeys = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          namespaceSelector = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  matchExpressions =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "key", "operator" ],
                                                          predicates.records.record
                                                          {
                                                            key =
                                                              predicates.isType
                                                                '"String",
                                                            operator =
                                                              predicates.isType
                                                                '"String",
                                                            values =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  matchLabels = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          namespaces = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          topologyKey = predicates.isType
                                              '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ])
                                    ],
                              }
                              {  }
                              false
                              predicates.never
                            ],
                      }
                      {  }
                      false
                      predicates.never
                    ],
                automountServiceAccountToken = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                containers = predicates.allOf
                    [
                      predicates.isType '"Array",
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        {
                          args = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          command = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          env = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "name" ],
                                  predicates.records.record
                                  {
                                    name = predicates.isType '"String",
                                    value = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    valueFrom = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            configMapKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            fieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "fieldPath" ],
                                                  predicates.records.record
                                                  {
                                                    apiVersion =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    fieldPath =
                                                      predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            resourceFieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "resource" ],
                                                  predicates.records.record
                                                  {
                                                    containerName =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    divisor = predicates.oneOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"String",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Number",
                                                            predicates.isType
                                                            'Null
                                                          ]
                                                        ],
                                                    resource = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            secretKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          envFrom = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.record
                                  {
                                    configMapRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                    prefix = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    secretRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          image = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          imagePullPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          lifecycle = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  postStart = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  preStop = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          livenessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          name = predicates.isType '"String",
                          ports = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "containerPort" ],
                                  predicates.records.record
                                  {
                                    containerPort = predicates.isType 'Integer,
                                    hostIP = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    hostPort = predicates.anyOf
                                        [
                                          predicates.isType 'Integer,
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    protocol = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          readinessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          resizePolicy = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "resourceName", "restartPolicy" ],
                                  predicates.records.record
                                  {
                                    resourceName = predicates.isType '"String",
                                    restartPolicy = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          resources = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  claims = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "name" ],
                                          predicates.records.record
                                          {
                                            name = predicates.isType '"String",
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  limits = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                  requests = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          restartPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          securityContext = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  allowPrivilegeEscalation = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  capabilities = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          add = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          drop = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  privileged = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  procMount = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnlyRootFilesystem = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsGroup = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  runAsNonRoot = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsUser = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  seLinuxOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          level = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          role = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          user = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  seccompProfile = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "type" ],
                                        predicates.records.record
                                        {
                                          localhostProfile = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.isType '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  windowsOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          gmsaCredentialSpec = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          gmsaCredentialSpecName =
                                            predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          hostProcess = predicates.anyOf
                                              [
                                                predicates.isType '"Bool",
                                                predicates.isType 'Null
                                              ],
                                          runAsUserName = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          startupProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          stdin = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          stdinOnce = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          terminationMessagePath = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          terminationMessagePolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          tty = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          volumeDevices = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "devicePath", "name" ],
                                  predicates.records.record
                                  {
                                    devicePath = predicates.isType '"String",
                                    name = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          volumeMounts = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "mountPath", "name" ],
                                  predicates.records.record
                                  {
                                    mountPath = predicates.isType '"String",
                                    mountPropagation = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.isType '"String",
                                    readOnly = predicates.anyOf
                                        [
                                          predicates.isType '"Bool",
                                          predicates.isType 'Null
                                        ],
                                    subPath = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    subPathExpr = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          workingDir = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                dnsConfig = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record
                      {
                        nameservers = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType '"Array",
                                predicates.isType 'Null
                              ],
                              predicates.arrays.arrayOf
                              (predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ])
                            ],
                        options = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType '"Array",
                                predicates.isType 'Null
                              ],
                              predicates.arrays.arrayOf
                              (predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  name = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  value = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ])
                            ],
                        searches = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType '"Array",
                                predicates.isType 'Null
                              ],
                              predicates.arrays.arrayOf
                              (predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ])
                            ],
                      }
                      {  }
                      false
                      predicates.never
                    ],
                dnsPolicy = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                enableServiceLinks = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                ephemeralContainers = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        {
                          args = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          command = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          env = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "name" ],
                                  predicates.records.record
                                  {
                                    name = predicates.isType '"String",
                                    value = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    valueFrom = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            configMapKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            fieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "fieldPath" ],
                                                  predicates.records.record
                                                  {
                                                    apiVersion =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    fieldPath =
                                                      predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            resourceFieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "resource" ],
                                                  predicates.records.record
                                                  {
                                                    containerName =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    divisor = predicates.oneOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"String",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Number",
                                                            predicates.isType
                                                            'Null
                                                          ]
                                                        ],
                                                    resource = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            secretKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          envFrom = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.record
                                  {
                                    configMapRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                    prefix = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    secretRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          image = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          imagePullPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          lifecycle = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  postStart = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  preStop = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          livenessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          name = predicates.isType '"String",
                          ports = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "containerPort" ],
                                  predicates.records.record
                                  {
                                    containerPort = predicates.isType 'Integer,
                                    hostIP = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    hostPort = predicates.anyOf
                                        [
                                          predicates.isType 'Integer,
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    protocol = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          readinessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          resizePolicy = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "resourceName", "restartPolicy" ],
                                  predicates.records.record
                                  {
                                    resourceName = predicates.isType '"String",
                                    restartPolicy = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          resources = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  claims = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "name" ],
                                          predicates.records.record
                                          {
                                            name = predicates.isType '"String",
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  limits = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                  requests = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          restartPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          securityContext = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  allowPrivilegeEscalation = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  capabilities = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          add = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          drop = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  privileged = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  procMount = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnlyRootFilesystem = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsGroup = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  runAsNonRoot = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsUser = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  seLinuxOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          level = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          role = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          user = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  seccompProfile = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "type" ],
                                        predicates.records.record
                                        {
                                          localhostProfile = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.isType '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  windowsOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          gmsaCredentialSpec = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          gmsaCredentialSpecName =
                                            predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          hostProcess = predicates.anyOf
                                              [
                                                predicates.isType '"Bool",
                                                predicates.isType 'Null
                                              ],
                                          runAsUserName = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          startupProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          stdin = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          stdinOnce = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          targetContainerName = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          terminationMessagePath = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          terminationMessagePolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          tty = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          volumeDevices = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "devicePath", "name" ],
                                  predicates.records.record
                                  {
                                    devicePath = predicates.isType '"String",
                                    name = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          volumeMounts = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "mountPath", "name" ],
                                  predicates.records.record
                                  {
                                    mountPath = predicates.isType '"String",
                                    mountPropagation = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.isType '"String",
                                    readOnly = predicates.anyOf
                                        [
                                          predicates.isType '"Bool",
                                          predicates.isType 'Null
                                        ],
                                    subPath = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    subPathExpr = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          workingDir = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                hostAliases = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.record
                        {
                          hostnames = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          ip = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                hostIPC = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                hostNetwork = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                hostPID = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                hostUsers = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                hostname = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                imagePullSecrets = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.record
                        {
                          name = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                initContainers = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        {
                          args = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          command = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          env = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "name" ],
                                  predicates.records.record
                                  {
                                    name = predicates.isType '"String",
                                    value = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    valueFrom = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            configMapKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            fieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "fieldPath" ],
                                                  predicates.records.record
                                                  {
                                                    apiVersion =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    fieldPath =
                                                      predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            resourceFieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "resource" ],
                                                  predicates.records.record
                                                  {
                                                    containerName =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    divisor = predicates.oneOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"String",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Number",
                                                            predicates.isType
                                                            'Null
                                                          ]
                                                        ],
                                                    resource = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            secretKeyRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "key" ],
                                                  predicates.records.record
                                                  {
                                                    key = predicates.isType
                                                        '"String",
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          envFrom = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.record
                                  {
                                    configMapRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                    prefix = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    secretRef = predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            name = predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                            "optional" = predicates.anyOf
                                                [
                                                  predicates.isType '"Bool",
                                                  predicates.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          image = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          imagePullPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          lifecycle = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  postStart = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  preStop = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          exec = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  command = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          httpGet = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  httpHeaders = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [ "name", "value" ],
                                                          predicates.records.record
                                                          {
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            value =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  path = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                  scheme = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          sleep = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "seconds" ],
                                                predicates.records.record
                                                {
                                                  seconds = predicates.isType
                                                      'Integer,
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          tcpSocket = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.required
                                                [ "port" ],
                                                predicates.records.record
                                                {
                                                  host = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  port = predicates.oneOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ]
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          livenessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          name = predicates.isType '"String",
                          ports = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "containerPort" ],
                                  predicates.records.record
                                  {
                                    containerPort = predicates.isType 'Integer,
                                    hostIP = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    hostPort = predicates.anyOf
                                        [
                                          predicates.isType 'Integer,
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    protocol = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          readinessProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          resizePolicy = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "resourceName", "restartPolicy" ],
                                  predicates.records.record
                                  {
                                    resourceName = predicates.isType '"String",
                                    restartPolicy = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          resources = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  claims = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "name" ],
                                          predicates.records.record
                                          {
                                            name = predicates.isType '"String",
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  limits = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                  requests = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.oneOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType '"String",
                                            predicates.isType 'Null
                                          ],
                                          predicates.anyOf
                                          [
                                            predicates.isType '"Number",
                                            predicates.isType 'Null
                                          ]
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          restartPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          securityContext = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  allowPrivilegeEscalation = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  capabilities = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          add = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                          drop = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  privileged = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  procMount = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnlyRootFilesystem = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsGroup = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  runAsNonRoot = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  runAsUser = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  seLinuxOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          level = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          role = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          user = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  seccompProfile = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "type" ],
                                        predicates.records.record
                                        {
                                          localhostProfile = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          type = predicates.isType '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  windowsOptions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          gmsaCredentialSpec = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          gmsaCredentialSpecName =
                                            predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          hostProcess = predicates.anyOf
                                              [
                                                predicates.isType '"Bool",
                                                predicates.isType 'Null
                                              ],
                                          runAsUserName = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          startupProbe = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  exec = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          command = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ])
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  failureThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  grpc = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          port = predicates.isType 'Integer,
                                          service = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  httpGet = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          httpHeaders = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"Array",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.arrays.arrayOf
                                                (predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "name", "value" ],
                                                  predicates.records.record
                                                  {
                                                    name = predicates.isType
                                                        '"String",
                                                    value = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ])
                                              ],
                                          path = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                          scheme = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  initialDelaySeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  periodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  successThreshold = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  tcpSocket = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "port" ],
                                        predicates.records.record
                                        {
                                          host = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          port = predicates.oneOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType '"String",
                                                  predicates.isType 'Null
                                                ],
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ]
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  terminationGracePeriodSeconds =
                                    predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  timeoutSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          stdin = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          stdinOnce = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          terminationMessagePath = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          terminationMessagePolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          tty = predicates.anyOf
                              [
                                predicates.isType '"Bool",
                                predicates.isType 'Null
                              ],
                          volumeDevices = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "devicePath", "name" ],
                                  predicates.records.record
                                  {
                                    devicePath = predicates.isType '"String",
                                    name = predicates.isType '"String",
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          volumeMounts = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required
                                  [ "mountPath", "name" ],
                                  predicates.records.record
                                  {
                                    mountPath = predicates.isType '"String",
                                    mountPropagation = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    name = predicates.isType '"String",
                                    readOnly = predicates.anyOf
                                        [
                                          predicates.isType '"Bool",
                                          predicates.isType 'Null
                                        ],
                                    subPath = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    subPathExpr = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                  }
                                  {  }
                                  false
                                  predicates.never
                                ])
                              ],
                          workingDir = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                nodeName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                nodeSelector = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record {  } {  } true
                      (predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ])
                    ],
                os = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.required [ "name" ],
                      predicates.records.record
                      { name = predicates.isType '"String", }
                      {  }
                      false
                      predicates.never
                    ],
                overhead = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record {  } {  } true
                      (predicates.oneOf
                      [
                        predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ],
                        predicates.anyOf
                        [ predicates.isType '"Number", predicates.isType 'Null ]
                      ])
                    ],
                preemptionPolicy = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                "priority" = predicates.anyOf
                    [ predicates.isType 'Integer, predicates.isType 'Null ],
                priorityClassName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                readinessGates = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "conditionType" ],
                        predicates.records.record
                        { conditionType = predicates.isType '"String", }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                resourceClaims = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        {
                          name = predicates.isType '"String",
                          source = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  resourceClaimName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  resourceClaimTemplateName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                restartPolicy = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                runtimeClassName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                schedulerName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                schedulingGates = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        { name = predicates.isType '"String", }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                securityContext = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.record
                      {
                        fsGroup = predicates.anyOf
                            [
                              predicates.isType 'Integer,
                              predicates.isType 'Null
                            ],
                        fsGroupChangePolicy = predicates.anyOf
                            [
                              predicates.isType '"String",
                              predicates.isType 'Null
                            ],
                        runAsGroup = predicates.anyOf
                            [
                              predicates.isType 'Integer,
                              predicates.isType 'Null
                            ],
                        runAsNonRoot = predicates.anyOf
                            [
                              predicates.isType '"Bool",
                              predicates.isType 'Null
                            ],
                        runAsUser = predicates.anyOf
                            [
                              predicates.isType 'Integer,
                              predicates.isType 'Null
                            ],
                        seLinuxOptions = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.record
                              {
                                level = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                role = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                type = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                user = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                              }
                              {  }
                              false
                              predicates.never
                            ],
                        seccompProfile = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.required [ "type" ],
                              predicates.records.record
                              {
                                localhostProfile = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                type = predicates.isType '"String",
                              }
                              {  }
                              false
                              predicates.never
                            ],
                        supplementalGroups = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType '"Array",
                                predicates.isType 'Null
                              ],
                              predicates.arrays.arrayOf
                              (predicates.anyOf
                              [
                                predicates.isType 'Integer,
                                predicates.isType 'Null
                              ])
                            ],
                        sysctls = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType '"Array",
                                predicates.isType 'Null
                              ],
                              predicates.arrays.arrayOf
                              (predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "name", "value" ],
                                predicates.records.record
                                {
                                  name = predicates.isType '"String",
                                  value = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ])
                            ],
                        windowsOptions = predicates.allOf
                            [
                              predicates.anyOf
                              [
                                predicates.isType 'Record,
                                predicates.isType 'Null
                              ],
                              predicates.records.record
                              {
                                gmsaCredentialSpec = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                gmsaCredentialSpecName = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                                hostProcess = predicates.anyOf
                                    [
                                      predicates.isType '"Bool",
                                      predicates.isType 'Null
                                    ],
                                runAsUserName = predicates.anyOf
                                    [
                                      predicates.isType '"String",
                                      predicates.isType 'Null
                                    ],
                              }
                              {  }
                              false
                              predicates.never
                            ],
                      }
                      {  }
                      false
                      predicates.never
                    ],
                serviceAccount = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                serviceAccountName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                setHostnameAsFQDN = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                shareProcessNamespace = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                subdomain = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                terminationGracePeriodSeconds = predicates.anyOf
                    [ predicates.isType 'Integer, predicates.isType 'Null ],
                tolerations = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.record
                        {
                          effect = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          key = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          operator = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          tolerationSeconds = predicates.anyOf
                              [
                                predicates.isType 'Integer,
                                predicates.isType 'Null
                              ],
                          value = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                topologySpreadConstraints = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required
                        [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
                        predicates.records.record
                        {
                          labelSelector = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  matchExpressions = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "key", "operator" ],
                                          predicates.records.record
                                          {
                                            key = predicates.isType '"String",
                                            operator = predicates.isType
                                                '"String",
                                            values = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType '"Array",
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.arrays.arrayOf
                                                  (predicates.anyOf
                                                  [
                                                    predicates.isType '"String",
                                                    predicates.isType 'Null
                                                  ])
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  matchLabels = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          matchLabelKeys = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType '"Array",
                                  predicates.isType 'Null
                                ],
                                predicates.arrays.arrayOf
                                (predicates.anyOf
                                [
                                  predicates.isType '"String",
                                  predicates.isType 'Null
                                ])
                              ],
                          maxSkew = predicates.isType 'Integer,
                          minDomains = predicates.anyOf
                              [
                                predicates.isType 'Integer,
                                predicates.isType 'Null
                              ],
                          nodeAffinityPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          nodeTaintsPolicy = predicates.anyOf
                              [
                                predicates.isType '"String",
                                predicates.isType 'Null
                              ],
                          topologyKey = predicates.isType '"String",
                          whenUnsatisfiable = predicates.isType '"String",
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
                volumes = predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "name" ],
                        predicates.records.record
                        {
                          awsElasticBlockStore = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "volumeID" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  partition = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  volumeID = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          azureDisk = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "diskName", "diskURI" ],
                                predicates.records.record
                                {
                                  cachingMode = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  diskName = predicates.isType '"String",
                                  diskURI = predicates.isType '"String",
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  kind = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          azureFile = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "secretName", "shareName" ],
                                predicates.records.record
                                {
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretName = predicates.isType '"String",
                                  shareName = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          cephfs = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "monitors" ],
                                predicates.records.record
                                {
                                  monitors = predicates.allOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.arrays.arrayOf
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                  path = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretFile = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  user = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          cinder = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "volumeID" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  volumeID = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          configMap = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  defaultMode = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  items = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "key", "path" ],
                                          predicates.records.record
                                          {
                                            key = predicates.isType '"String",
                                            mode = predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ],
                                            path = predicates.isType '"String",
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  name = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  "optional" = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          csi = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "driver" ],
                                predicates.records.record
                                {
                                  driver = predicates.isType '"String",
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  nodePublishSecretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  volumeAttributes = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          downwardAPI = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  defaultMode = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  items = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "path" ],
                                          predicates.records.record
                                          {
                                            fieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "fieldPath" ],
                                                  predicates.records.record
                                                  {
                                                    apiVersion =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    fieldPath =
                                                      predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            mode = predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ],
                                            path = predicates.isType '"String",
                                            resourceFieldRef = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "resource" ],
                                                  predicates.records.record
                                                  {
                                                    containerName =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    divisor = predicates.oneOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"String",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Number",
                                                            predicates.isType
                                                            'Null
                                                          ]
                                                        ],
                                                    resource = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          emptyDir = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  medium = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  sizeLimit = predicates.oneOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Number",
                                          predicates.isType 'Null
                                        ]
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          ephemeral = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  volumeClaimTemplate = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required [ "spec" ],
                                        predicates.records.record
                                        {
                                          metadata = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record
                                                {
                                                  annotations = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  creationTimestamp =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  deletionGracePeriodSeconds =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        'Integer,
                                                        predicates.isType 'Null
                                                      ],
                                                  deletionTimestamp =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  finalizers = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  generateName =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  generation = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        'Integer,
                                                        predicates.isType 'Null
                                                      ],
                                                  labels = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {  }
                                                        {  }
                                                        true
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  managedFields =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.record
                                                          {
                                                            apiVersion =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            fieldsType =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            fieldsV1 =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            manager =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            operation =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            subresource =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            time =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  name = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  namespace = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  ownerReferences =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.required
                                                          [
                                                            "apiVersion",
                                                            "kind",
                                                            "name",
                                                            "uid"
                                                          ],
                                                          predicates.records.record
                                                          {
                                                            apiVersion =
                                                              predicates.isType
                                                                '"String",
                                                            blockOwnerDeletion =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Bool",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            controller =
                                                              predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Bool",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                            kind =
                                                              predicates.isType
                                                                '"String",
                                                            name =
                                                              predicates.isType
                                                                '"String",
                                                            uid =
                                                              predicates.isType
                                                                '"String",
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ])
                                                      ],
                                                  resourceVersion =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  selfLink = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  uid = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                          spec = predicates.allOf
                                              [
                                                predicates.isType 'Record,
                                                predicates.records.record
                                                {
                                                  accessModes = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Array",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.arrays.arrayOf
                                                        (predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ])
                                                      ],
                                                  dataSource = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.required
                                                        [ "kind", "name" ],
                                                        predicates.records.record
                                                        {
                                                          apiGroup =
                                                            predicates.anyOf
                                                              [
                                                                predicates.isType
                                                                '"String",
                                                                predicates.isType
                                                                'Null
                                                              ],
                                                          kind =
                                                            predicates.isType
                                                              '"String",
                                                          name =
                                                            predicates.isType
                                                              '"String",
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  dataSourceRef =
                                                    predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.required
                                                        [ "kind", "name" ],
                                                        predicates.records.record
                                                        {
                                                          apiGroup =
                                                            predicates.anyOf
                                                              [
                                                                predicates.isType
                                                                '"String",
                                                                predicates.isType
                                                                'Null
                                                              ],
                                                          kind =
                                                            predicates.isType
                                                              '"String",
                                                          name =
                                                            predicates.isType
                                                              '"String",
                                                          namespace =
                                                            predicates.anyOf
                                                              [
                                                                predicates.isType
                                                                '"String",
                                                                predicates.isType
                                                                'Null
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  resources = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          limits =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.oneOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Number",
                                                                    predicates.isType
                                                                    'Null
                                                                  ]
                                                                ])
                                                              ],
                                                          requests =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.oneOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Number",
                                                                    predicates.isType
                                                                    'Null
                                                                  ]
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  selector = predicates.allOf
                                                      [
                                                        predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Record,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                        predicates.records.record
                                                        {
                                                          matchExpressions =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"Array",
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.arrays.arrayOf
                                                                (predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.required
                                                                  [
                                                                    "key",
                                                                    "operator"
                                                                  ],
                                                                  predicates.records.record
                                                                  {
                                                                    key =
                                                                      predicates.isType
                                                                        '"String",
                                                                    operator =
                                                                      predicates.isType
                                                                        '"String",
                                                                    values =
                                                                      predicates.allOf
                                                                        [
                                                                          predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"Array",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                          predicates.arrays.arrayOf
                                                                          (predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ])
                                                                        ],
                                                                  }
                                                                  {  }
                                                                  false
                                                                  predicates.never
                                                                ])
                                                              ],
                                                          matchLabels =
                                                            predicates.allOf
                                                              [
                                                                predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  'Record,
                                                                  predicates.isType
                                                                  'Null
                                                                ],
                                                                predicates.records.record
                                                                {  }
                                                                {  }
                                                                true
                                                                (predicates.anyOf
                                                                [
                                                                  predicates.isType
                                                                  '"String",
                                                                  predicates.isType
                                                                  'Null
                                                                ])
                                                              ],
                                                        }
                                                        {  }
                                                        false
                                                        predicates.never
                                                      ],
                                                  storageClassName =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  volumeAttributesClassName =
                                                    predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  volumeMode = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                  volumeName = predicates.anyOf
                                                      [
                                                        predicates.isType
                                                        '"String",
                                                        predicates.isType 'Null
                                                      ],
                                                }
                                                {  }
                                                false
                                                predicates.never
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          fc = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  lun = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  targetWWNs = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                  wwids = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          flexVolume = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "driver" ],
                                predicates.records.record
                                {
                                  driver = predicates.isType '"String",
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  options = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record {  } {  } true
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          flocker = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  datasetName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  datasetUUID = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          gcePersistentDisk = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "pdName" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  partition = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  pdName = predicates.isType '"String",
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          gitRepo = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "repository" ],
                                predicates.records.record
                                {
                                  directory = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  repository = predicates.isType '"String",
                                  revision = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          glusterfs = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "endpoints", "path" ],
                                predicates.records.record
                                {
                                  endpoints = predicates.isType '"String",
                                  path = predicates.isType '"String",
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          hostPath = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "path" ],
                                predicates.records.record
                                {
                                  path = predicates.isType '"String",
                                  type = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          iscsi = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "iqn", "lun", "targetPortal" ],
                                predicates.records.record
                                {
                                  chapAuthDiscovery = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  chapAuthSession = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  initiatorName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  iqn = predicates.isType '"String",
                                  iscsiInterface = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  lun = predicates.isType 'Integer,
                                  portals = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  targetPortal = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          name = predicates.isType '"String",
                          nfs = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "path", "server" ],
                                predicates.records.record
                                {
                                  path = predicates.isType '"String",
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  server = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          persistentVolumeClaim = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "claimName" ],
                                predicates.records.record
                                {
                                  claimName = predicates.isType '"String",
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          photonPersistentDisk = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "pdID" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  pdID = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          portworxVolume = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "volumeID" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  volumeID = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          projected = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  defaultMode = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  sources = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.record
                                          {
                                            clusterTrustBundle =
                                              predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "path" ],
                                                  predicates.records.record
                                                  {
                                                    labelSelector =
                                                      predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            'Record,
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.records.record
                                                          {
                                                            matchExpressions =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"Array",
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.arrays.arrayOf
                                                                  (predicates.allOf
                                                                  [
                                                                    predicates.anyOf
                                                                    [
                                                                      predicates.isType
                                                                      'Record,
                                                                      predicates.isType
                                                                      'Null
                                                                    ],
                                                                    predicates.records.required
                                                                    [
                                                                      "key",
                                                                      "operator"
                                                                    ],
                                                                    predicates.records.record
                                                                    {
                                                                      key =
                                                                        predicates.isType
                                                                          '"String",
                                                                      operator =
                                                                        predicates.isType
                                                                          '"String",
                                                                      values =
                                                                        predicates.allOf
                                                                          [
                                                                            predicates.anyOf
                                                                            [
                                                                              predicates.isType
                                                                              '"Array",
                                                                              predicates.isType
                                                                              'Null
                                                                            ],
                                                                            predicates.arrays.arrayOf
                                                                            (predicates.anyOf
                                                                            [
                                                                              predicates.isType
                                                                              '"String",
                                                                              predicates.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    predicates.never
                                                                  ])
                                                                ],
                                                            matchLabels =
                                                              predicates.allOf
                                                                [
                                                                  predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Record,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                                  predicates.records.record
                                                                  {  }
                                                                  {  }
                                                                  true
                                                                  (predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    '"String",
                                                                    predicates.isType
                                                                    'Null
                                                                  ])
                                                                ],
                                                          }
                                                          {  }
                                                          false
                                                          predicates.never
                                                        ],
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    path = predicates.isType
                                                        '"String",
                                                    signerName =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            configMap = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.record
                                                  {
                                                    items = predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Array",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.arrays.arrayOf
                                                          (predicates.allOf
                                                          [
                                                            predicates.anyOf
                                                            [
                                                              predicates.isType
                                                              'Record,
                                                              predicates.isType
                                                              'Null
                                                            ],
                                                            predicates.records.required
                                                            [ "key", "path" ],
                                                            predicates.records.record
                                                            {
                                                              key =
                                                                predicates.isType
                                                                  '"String",
                                                              mode =
                                                                predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Integer,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                              path =
                                                                predicates.isType
                                                                  '"String",
                                                            }
                                                            {  }
                                                            false
                                                            predicates.never
                                                          ])
                                                        ],
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            downwardAPI = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.record
                                                  {
                                                    items = predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Array",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.arrays.arrayOf
                                                          (predicates.allOf
                                                          [
                                                            predicates.anyOf
                                                            [
                                                              predicates.isType
                                                              'Record,
                                                              predicates.isType
                                                              'Null
                                                            ],
                                                            predicates.records.required
                                                            [ "path" ],
                                                            predicates.records.record
                                                            {
                                                              fieldRef =
                                                                predicates.allOf
                                                                  [
                                                                    predicates.anyOf
                                                                    [
                                                                      predicates.isType
                                                                      'Record,
                                                                      predicates.isType
                                                                      'Null
                                                                    ],
                                                                    predicates.records.required
                                                                    [
                                                                      "fieldPath"
                                                                    ],
                                                                    predicates.records.record
                                                                    {
                                                                      apiVersion =
                                                                        predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                      fieldPath =
                                                                        predicates.isType
                                                                          '"String",
                                                                    }
                                                                    {  }
                                                                    false
                                                                    predicates.never
                                                                  ],
                                                              mode =
                                                                predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Integer,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                              path =
                                                                predicates.isType
                                                                  '"String",
                                                              resourceFieldRef =
                                                                predicates.allOf
                                                                  [
                                                                    predicates.anyOf
                                                                    [
                                                                      predicates.isType
                                                                      'Record,
                                                                      predicates.isType
                                                                      'Null
                                                                    ],
                                                                    predicates.records.required
                                                                    [
                                                                      "resource"
                                                                    ],
                                                                    predicates.records.record
                                                                    {
                                                                      containerName =
                                                                        predicates.anyOf
                                                                          [
                                                                            predicates.isType
                                                                            '"String",
                                                                            predicates.isType
                                                                            'Null
                                                                          ],
                                                                      divisor =
                                                                        predicates.oneOf
                                                                          [
                                                                            predicates.anyOf
                                                                            [
                                                                              predicates.isType
                                                                              '"String",
                                                                              predicates.isType
                                                                              'Null
                                                                            ],
                                                                            predicates.anyOf
                                                                            [
                                                                              predicates.isType
                                                                              '"Number",
                                                                              predicates.isType
                                                                              'Null
                                                                            ]
                                                                          ],
                                                                      resource =
                                                                        predicates.isType
                                                                          '"String",
                                                                    }
                                                                    {  }
                                                                    false
                                                                    predicates.never
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            predicates.never
                                                          ])
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            secret = predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.record
                                                  {
                                                    items = predicates.allOf
                                                        [
                                                          predicates.anyOf
                                                          [
                                                            predicates.isType
                                                            '"Array",
                                                            predicates.isType
                                                            'Null
                                                          ],
                                                          predicates.arrays.arrayOf
                                                          (predicates.allOf
                                                          [
                                                            predicates.anyOf
                                                            [
                                                              predicates.isType
                                                              'Record,
                                                              predicates.isType
                                                              'Null
                                                            ],
                                                            predicates.records.required
                                                            [ "key", "path" ],
                                                            predicates.records.record
                                                            {
                                                              key =
                                                                predicates.isType
                                                                  '"String",
                                                              mode =
                                                                predicates.anyOf
                                                                  [
                                                                    predicates.isType
                                                                    'Integer,
                                                                    predicates.isType
                                                                    'Null
                                                                  ],
                                                              path =
                                                                predicates.isType
                                                                  '"String",
                                                            }
                                                            {  }
                                                            false
                                                            predicates.never
                                                          ])
                                                        ],
                                                    name = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    "optional" =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"Bool",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                            serviceAccountToken =
                                              predicates.allOf
                                                [
                                                  predicates.anyOf
                                                  [
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.required
                                                  [ "path" ],
                                                  predicates.records.record
                                                  {
                                                    audience = predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          '"String",
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    expirationSeconds =
                                                      predicates.anyOf
                                                        [
                                                          predicates.isType
                                                          'Integer,
                                                          predicates.isType
                                                          'Null
                                                        ],
                                                    path = predicates.isType
                                                        '"String",
                                                  }
                                                  {  }
                                                  false
                                                  predicates.never
                                                ],
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          quobyte = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "registry", "volume" ],
                                predicates.records.record
                                {
                                  group = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  registry = predicates.isType '"String",
                                  tenant = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  user = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  volume = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          rbd = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "image", "monitors" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  image = predicates.isType '"String",
                                  keyring = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  monitors = predicates.allOf
                                      [
                                        predicates.isType '"Array",
                                        predicates.arrays.arrayOf
                                        (predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ])
                                      ],
                                  pool = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  user = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          scaleIO = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required
                                [ "gateway", "secretRef", "system" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  gateway = predicates.isType '"String",
                                  protectionDomain = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.isType 'Record,
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  sslEnabled = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  storageMode = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  storagePool = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  system = predicates.isType '"String",
                                  volumeName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          secret = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  defaultMode = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  items = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType '"Array",
                                          predicates.isType 'Null
                                        ],
                                        predicates.arrays.arrayOf
                                        (predicates.allOf
                                        [
                                          predicates.anyOf
                                          [
                                            predicates.isType 'Record,
                                            predicates.isType 'Null
                                          ],
                                          predicates.records.required
                                          [ "key", "path" ],
                                          predicates.records.record
                                          {
                                            key = predicates.isType '"String",
                                            mode = predicates.anyOf
                                                [
                                                  predicates.isType 'Integer,
                                                  predicates.isType 'Null
                                                ],
                                            path = predicates.isType '"String",
                                          }
                                          {  }
                                          false
                                          predicates.never
                                        ])
                                      ],
                                  "optional" = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          storageos = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  readOnly = predicates.anyOf
                                      [
                                        predicates.isType '"Bool",
                                        predicates.isType 'Null
                                      ],
                                  secretRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          name = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  volumeName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  volumeNamespace = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                }
                                {  }
                                false
                                predicates.never
                              ],
                          vsphereVolume = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "volumePath" ],
                                predicates.records.record
                                {
                                  fsType = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  storagePolicyID = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  storagePolicyName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  volumePath = predicates.isType '"String",
                                }
                                {  }
                                false
                                predicates.never
                              ],
                        }
                        {  }
                        false
                        predicates.never
                      ])
                    ],
              }
              {  }
              false
              predicates.never
            ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    PodTemplateSpec describes the data a pod should have when created from a template
    "%,
}