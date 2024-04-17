# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib =
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

let rec _js2n__-refsenv = {  } in
_js2n__-prdslib.contract_from_predicate
(_js2n__-prdslib.allOf
[
  _js2n__-prdslib.isType 'Record,
  _js2n__-prdslib.records.record
  {
    apiVersion = _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ],
    kind = _js2n__-prdslib.allOf
        [
          _js2n__-prdslib.anyOf
          [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ],
          _js2n__-prdslib.enum [ "DaemonSet" ]
        ],
    metadata = _js2n__-prdslib.allOf
        [
          _js2n__-prdslib.anyOf
          [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
          _js2n__-prdslib.records.record
          {
            annotations = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType 'Record,
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.records.record {  } {  } true
                  (_js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"String",
                    _js2n__-prdslib.isType 'Null
                  ])
                ],
            creationTimestamp = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            deletionGracePeriodSeconds = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            deletionTimestamp = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            finalizers = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"Array",
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.arrays.arrayOf
                  (_js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"String",
                    _js2n__-prdslib.isType 'Null
                  ])
                ],
            generateName = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            generation = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            labels = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType 'Record,
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.records.record {  } {  } true
                  (_js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"String",
                    _js2n__-prdslib.isType 'Null
                  ])
                ],
            managedFields = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"Array",
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.arrays.arrayOf
                  (_js2n__-prdslib.allOf
                  [
                    _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType 'Record,
                      _js2n__-prdslib.isType 'Null
                    ],
                    _js2n__-prdslib.records.record
                    {
                      apiVersion = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      fieldsType = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      fieldsV1 = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType 'Record,
                            _js2n__-prdslib.isType 'Null
                          ],
                      manager = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      operation = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      subresource = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      time = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                    }
                    {  }
                    false
                    _js2n__-prdslib.never
                  ])
                ],
            name = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            namespace = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            ownerReferences = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"Array",
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.arrays.arrayOf
                  (_js2n__-prdslib.allOf
                  [
                    _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType 'Record,
                      _js2n__-prdslib.isType 'Null
                    ],
                    _js2n__-prdslib.records.required
                    [ "apiVersion", "kind", "name", "uid" ],
                    _js2n__-prdslib.records.record
                    {
                      apiVersion = _js2n__-prdslib.isType '"String",
                      blockOwnerDeletion = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"Bool",
                            _js2n__-prdslib.isType 'Null
                          ],
                      controller = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"Bool",
                            _js2n__-prdslib.isType 'Null
                          ],
                      kind = _js2n__-prdslib.isType '"String",
                      name = _js2n__-prdslib.isType '"String",
                      uid = _js2n__-prdslib.isType '"String",
                    }
                    {  }
                    false
                    _js2n__-prdslib.never
                  ])
                ],
            resourceVersion = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            selfLink = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
            uid = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"String",
                  _js2n__-prdslib.isType 'Null
                ],
          }
          {  }
          false
          _js2n__-prdslib.never
        ],
    spec = _js2n__-prdslib.allOf
        [
          _js2n__-prdslib.anyOf
          [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
          _js2n__-prdslib.records.required [ "selector", "template" ],
          _js2n__-prdslib.records.record
          {
            minReadySeconds = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            revisionHistoryLimit = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            selector = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.records.record
                  {
                    matchExpressions = _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"Array",
                            _js2n__-prdslib.isType 'Null
                          ],
                          _js2n__-prdslib.arrays.arrayOf
                          (_js2n__-prdslib.allOf
                          [
                            _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                            _js2n__-prdslib.records.required
                            [ "key", "operator" ],
                            _js2n__-prdslib.records.record
                            {
                              key = _js2n__-prdslib.isType '"String",
                              operator = _js2n__-prdslib.isType '"String",
                              values = _js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"Array",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.arrays.arrayOf
                                    (_js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ])
                                  ],
                            }
                            {  }
                            false
                            _js2n__-prdslib.never
                          ])
                        ],
                    matchLabels = _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType 'Record,
                            _js2n__-prdslib.isType 'Null
                          ],
                          _js2n__-prdslib.records.record {  } {  } true
                          (_js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ])
                        ],
                  }
                  {  }
                  false
                  _js2n__-prdslib.never
                ],
            template = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.records.record
                  {
                    metadata = _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType 'Record,
                            _js2n__-prdslib.isType 'Null
                          ],
                          _js2n__-prdslib.records.record
                          {
                            annotations = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record {  } {  } true
                                  (_js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ])
                                ],
                            creationTimestamp = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            deletionGracePeriodSeconds = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                            deletionTimestamp = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            finalizers = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ])
                                ],
                            generateName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            generation = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                            labels = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record {  } {  } true
                                  (_js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ])
                                ],
                            managedFields = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.record
                                    {
                                      apiVersion = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      fieldsType = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      fieldsV1 = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      manager = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      operation = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      subresource = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      time = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            name = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            namespace = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            ownerReferences = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required
                                    [ "apiVersion", "kind", "name", "uid" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      apiVersion = _js2n__-prdslib.isType
                                          '"String",
                                      blockOwnerDeletion = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      controller = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      kind = _js2n__-prdslib.isType '"String",
                                      name = _js2n__-prdslib.isType '"String",
                                      uid = _js2n__-prdslib.isType '"String",
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            resourceVersion = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            selfLink = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            uid = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          }
                          {  }
                          false
                          _js2n__-prdslib.never
                        ],
                    spec = _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType 'Record,
                            _js2n__-prdslib.isType 'Null
                          ],
                          _js2n__-prdslib.records.required [ "containers" ],
                          _js2n__-prdslib.records.record
                          {
                            activeDeadlineSeconds = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                            affinity = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record
                                  {
                                    nodeAffinity = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.record
                                          {
                                            preferredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.arrays.arrayOf
                                                  (_js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "preference", "weight" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      preference =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            'Record,
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchFields =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      weight =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ])
                                                ],
                                            requiredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Record,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.records.required
                                                  [ "nodeSelectorTerms" ],
                                                  _js2n__-prdslib.records.record
                                                  {
                                                    nodeSelectorTerms =
                                                      _js2n__-prdslib.allOf
                                                        [
                                                          _js2n__-prdslib.isType
                                                          '"Array",
                                                          _js2n__-prdslib.arrays.arrayOf
                                                          (_js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchFields =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ])
                                                        ],
                                                  }
                                                  {  }
                                                  false
                                                  _js2n__-prdslib.never
                                                ],
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                    podAffinity = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.record
                                          {
                                            preferredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.arrays.arrayOf
                                                  (_js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [
                                                      "podAffinityTerm",
                                                      "weight"
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      podAffinityTerm =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            'Record,
                                                            _js2n__-prdslib.records.required
                                                            [ "topologyKey" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              labelSelector =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      matchExpressions =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Array",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.arrays.arrayOf
                                                                            (_js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.required
                                                                              [
                                                                                "key",
                                                                                "operator"
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                key =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                operator =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                values =
                                                                                  _js2n__-prdslib.allOf
                                                                                    [
                                                                                      _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"Array",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                                      (_js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ])
                                                                                    ],
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                            ])
                                                                          ],
                                                                      matchLabels =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              matchLabelKeys =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              mismatchLabelKeys =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              namespaceSelector =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      matchExpressions =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Array",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.arrays.arrayOf
                                                                            (_js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.required
                                                                              [
                                                                                "key",
                                                                                "operator"
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                key =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                operator =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                values =
                                                                                  _js2n__-prdslib.allOf
                                                                                    [
                                                                                      _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"Array",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                                      (_js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ])
                                                                                    ],
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                            ])
                                                                          ],
                                                                      matchLabels =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              namespaces =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              topologyKey =
                                                                _js2n__-prdslib.isType
                                                                  '"String",
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      weight =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ])
                                                ],
                                            requiredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.arrays.arrayOf
                                                  (_js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "topologyKey" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      labelSelector =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchLabels =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      matchLabelKeys =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      mismatchLabelKeys =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      namespaceSelector =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchLabels =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      namespaces =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      topologyKey =
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ])
                                                ],
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                    podAntiAffinity = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.record
                                          {
                                            preferredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.arrays.arrayOf
                                                  (_js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [
                                                      "podAffinityTerm",
                                                      "weight"
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      podAffinityTerm =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            'Record,
                                                            _js2n__-prdslib.records.required
                                                            [ "topologyKey" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              labelSelector =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      matchExpressions =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Array",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.arrays.arrayOf
                                                                            (_js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.required
                                                                              [
                                                                                "key",
                                                                                "operator"
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                key =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                operator =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                values =
                                                                                  _js2n__-prdslib.allOf
                                                                                    [
                                                                                      _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"Array",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                                      (_js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ])
                                                                                    ],
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                            ])
                                                                          ],
                                                                      matchLabels =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              matchLabelKeys =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              mismatchLabelKeys =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              namespaceSelector =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      matchExpressions =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Array",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.arrays.arrayOf
                                                                            (_js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.required
                                                                              [
                                                                                "key",
                                                                                "operator"
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                key =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                operator =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                values =
                                                                                  _js2n__-prdslib.allOf
                                                                                    [
                                                                                      _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"Array",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                                      (_js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ])
                                                                                    ],
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                            ])
                                                                          ],
                                                                      matchLabels =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              namespaces =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              topologyKey =
                                                                _js2n__-prdslib.isType
                                                                  '"String",
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      weight =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ])
                                                ],
                                            requiredDuringSchedulingIgnoredDuringExecution =
                                              _js2n__-prdslib.allOf
                                                [
                                                  _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                                  _js2n__-prdslib.arrays.arrayOf
                                                  (_js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "topologyKey" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      labelSelector =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchLabels =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      matchLabelKeys =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      mismatchLabelKeys =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      namespaceSelector =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              matchExpressions =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "key",
                                                                        "operator"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        key =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        operator =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        values =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              matchLabels =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      namespaces =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      topologyKey =
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ])
                                                ],
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                  }
                                  {  }
                                  false
                                  _js2n__-prdslib.never
                                ],
                            automountServiceAccountToken = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            containers = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.isType '"Array",
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      args = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      command = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      env = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                value = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                valueFrom =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        configMapKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        fieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "fieldPath" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                apiVersion =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                fieldPath =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        resourceFieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "resource" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                containerName =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                divisor =
                                                                  _js2n__-prdslib.oneOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"String",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Number",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ]
                                                                    ],
                                                                resource =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        secretKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      envFrom = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                configMapRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                                prefix = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                secretRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      image = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      imagePullPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      lifecycle = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              postStart = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              preStop = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      livenessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      name = _js2n__-prdslib.isType '"String",
                                      ports = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "containerPort" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                containerPort =
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                hostIP = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                hostPort = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Integer,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                protocol = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      readinessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      resizePolicy = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [
                                                "resourceName",
                                                "restartPolicy"
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                resourceName =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                restartPolicy =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      resources = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              claims = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "name" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              limits = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                              requests = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      restartPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      securityContext = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              allowPrivilegeEscalation =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              capabilities =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      add =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      drop =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              privileged = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              procMount = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnlyRootFilesystem =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsGroup = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsNonRoot =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsUser = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              seLinuxOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      level =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      role =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      user =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              seccompProfile =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "type" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      localhostProfile =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              windowsOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      gmsaCredentialSpec =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      gmsaCredentialSpecName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      hostProcess =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"Bool",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      runAsUserName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      startupProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      stdin = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      stdinOnce = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePath =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePolicy =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      tty = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      volumeDevices = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "devicePath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                devicePath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      volumeMounts = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "mountPath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                mountPath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                mountPropagation =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                readOnly = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Bool",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPath = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPathExpr =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      workingDir = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            dnsConfig = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record
                                  {
                                    nameservers = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.arrays.arrayOf
                                          (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                        ],
                                    options = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.arrays.arrayOf
                                          (_js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              name = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              value = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ])
                                        ],
                                    searches = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.arrays.arrayOf
                                          (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                        ],
                                  }
                                  {  }
                                  false
                                  _js2n__-prdslib.never
                                ],
                            dnsPolicy = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            enableServiceLinks = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            ephemeralContainers = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      args = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      command = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      env = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                value = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                valueFrom =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        configMapKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        fieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "fieldPath" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                apiVersion =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                fieldPath =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        resourceFieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "resource" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                containerName =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                divisor =
                                                                  _js2n__-prdslib.oneOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"String",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Number",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ]
                                                                    ],
                                                                resource =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        secretKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      envFrom = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                configMapRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                                prefix = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                secretRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      image = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      imagePullPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      lifecycle = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              postStart = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              preStop = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      livenessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      name = _js2n__-prdslib.isType '"String",
                                      ports = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "containerPort" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                containerPort =
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                hostIP = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                hostPort = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Integer,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                protocol = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      readinessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      resizePolicy = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [
                                                "resourceName",
                                                "restartPolicy"
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                resourceName =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                restartPolicy =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      resources = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              claims = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "name" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              limits = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                              requests = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      restartPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      securityContext = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              allowPrivilegeEscalation =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              capabilities =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      add =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      drop =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              privileged = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              procMount = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnlyRootFilesystem =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsGroup = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsNonRoot =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsUser = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              seLinuxOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      level =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      role =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      user =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              seccompProfile =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "type" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      localhostProfile =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              windowsOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      gmsaCredentialSpec =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      gmsaCredentialSpecName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      hostProcess =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"Bool",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      runAsUserName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      startupProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      stdin = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      stdinOnce = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      targetContainerName =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePath =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePolicy =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      tty = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      volumeDevices = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "devicePath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                devicePath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      volumeMounts = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "mountPath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                mountPath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                mountPropagation =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                readOnly = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Bool",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPath = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPathExpr =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      workingDir = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            hostAliases = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.record
                                    {
                                      hostnames = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      ip = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            hostIPC = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            hostNetwork = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            hostPID = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            hostUsers = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            hostname = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            imagePullSecrets = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.record
                                    {
                                      name = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            initContainers = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      args = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      command = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      env = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                value = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                valueFrom =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        configMapKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        fieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "fieldPath" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                apiVersion =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                fieldPath =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        resourceFieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "resource" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                containerName =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                divisor =
                                                                  _js2n__-prdslib.oneOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"String",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Number",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ]
                                                                    ],
                                                                resource =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        secretKeyRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "key" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                key =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      envFrom = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                configMapRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                                prefix = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                secretRef =
                                                  _js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        "optional" =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Bool",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      image = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      imagePullPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      lifecycle = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              postStart = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              preStop = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      exec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              command =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      httpGet =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              httpHeaders =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "name",
                                                                        "value"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        value =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              path =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                              scheme =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      sleep =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "seconds" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              seconds =
                                                                _js2n__-prdslib.isType
                                                                  'Integer,
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      tcpSocket =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.required
                                                            [ "port" ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              port =
                                                                _js2n__-prdslib.oneOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ]
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      livenessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      name = _js2n__-prdslib.isType '"String",
                                      ports = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "containerPort" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                containerPort =
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                hostIP = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                hostPort = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Integer,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                protocol = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      readinessProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      resizePolicy = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [
                                                "resourceName",
                                                "restartPolicy"
                                              ],
                                              _js2n__-prdslib.records.record
                                              {
                                                resourceName =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                restartPolicy =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      resources = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              claims = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "name" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        name =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              limits = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                              requests = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.oneOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"String",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        '"Number",
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ]
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      restartPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      securityContext = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              allowPrivilegeEscalation =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              capabilities =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      add =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                      drop =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              privileged = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              procMount = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnlyRootFilesystem =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsGroup = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsNonRoot =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              runAsUser = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              seLinuxOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      level =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      role =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      user =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              seccompProfile =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "type" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      localhostProfile =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      type =
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              windowsOptions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      gmsaCredentialSpec =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      gmsaCredentialSpecName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      hostProcess =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"Bool",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      runAsUserName =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      startupProbe = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              exec = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      command =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ])
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              failureThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              grpc = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      port =
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                      service =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              httpGet = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      httpHeaders =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"Array",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.arrays.arrayOf
                                                            (_js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [
                                                                "name",
                                                                "value"
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                name =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                value =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ])
                                                          ],
                                                      path =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                      scheme =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              initialDelaySeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              periodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              successThreshold =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              tcpSocket = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "port" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      host =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                      port =
                                                        _js2n__-prdslib.oneOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              '"String",
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ]
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              terminationGracePeriodSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              timeoutSeconds =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      stdin = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      stdinOnce = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePath =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      terminationMessagePolicy =
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      tty = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      volumeDevices = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "devicePath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                devicePath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      volumeMounts = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                              _js2n__-prdslib.records.required
                                              [ "mountPath", "name" ],
                                              _js2n__-prdslib.records.record
                                              {
                                                mountPath =
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                mountPropagation =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                name = _js2n__-prdslib.isType
                                                    '"String",
                                                readOnly = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Bool",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPath = _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                subPathExpr =
                                                  _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                              }
                                              {  }
                                              false
                                              _js2n__-prdslib.never
                                            ])
                                          ],
                                      workingDir = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            nodeName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            nodeSelector = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record {  } {  } true
                                  (_js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ])
                                ],
                            os = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.required [ "name" ],
                                  _js2n__-prdslib.records.record
                                  { name = _js2n__-prdslib.isType '"String", }
                                  {  }
                                  false
                                  _js2n__-prdslib.never
                                ],
                            overhead = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record {  } {  } true
                                  (_js2n__-prdslib.oneOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"Number",
                                      _js2n__-prdslib.isType 'Null
                                    ]
                                  ])
                                ],
                            preemptionPolicy = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            "priority" = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                            priorityClassName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            readinessGates = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required
                                    [ "conditionType" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      conditionType = _js2n__-prdslib.isType
                                          '"String",
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            resourceClaims = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      name = _js2n__-prdslib.isType '"String",
                                      source = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              resourceClaimName =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              resourceClaimTemplateName =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            restartPolicy = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            runtimeClassName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            schedulerName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            schedulingGates = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    { name = _js2n__-prdslib.isType '"String", }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            securityContext = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.records.record
                                  {
                                    fsGroup = _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                    fsGroupChangePolicy = _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                    runAsGroup = _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                    runAsNonRoot = _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Bool",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                    runAsUser = _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                    seLinuxOptions = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.record
                                          {
                                            level = _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            role = _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            type = _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            user = _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                    seccompProfile = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.required
                                          [ "type" ],
                                          _js2n__-prdslib.records.record
                                          {
                                            localhostProfile =
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            type = _js2n__-prdslib.isType
                                                '"String",
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                    supplementalGroups = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.arrays.arrayOf
                                          (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                        ],
                                    sysctls = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.arrays.arrayOf
                                          (_js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "name", "value" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              name = _js2n__-prdslib.isType
                                                  '"String",
                                              value = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ])
                                        ],
                                    windowsOptions = _js2n__-prdslib.allOf
                                        [
                                          _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                          _js2n__-prdslib.records.record
                                          {
                                            gmsaCredentialSpec =
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            gmsaCredentialSpecName =
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            hostProcess = _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"Bool",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                            runAsUserName =
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                  '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          }
                                          {  }
                                          false
                                          _js2n__-prdslib.never
                                        ],
                                  }
                                  {  }
                                  false
                                  _js2n__-prdslib.never
                                ],
                            serviceAccount = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            serviceAccountName = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            setHostnameAsFQDN = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            shareProcessNamespace = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"Bool",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            subdomain = _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                            terminationGracePeriodSeconds =
                              _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                            tolerations = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.record
                                    {
                                      effect = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      key = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      operator = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      tolerationSeconds = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      value = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            topologySpreadConstraints = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required
                                    [
                                      "maxSkew",
                                      "topologyKey",
                                      "whenUnsatisfiable"
                                    ],
                                    _js2n__-prdslib.records.record
                                    {
                                      labelSelector = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              matchExpressions =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "key", "operator" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        key =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                        operator =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                        values =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                '"Array",
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.arrays.arrayOf
                                                              (_js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                '"String",
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ])
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              matchLabels =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      matchLabelKeys = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"Array",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.arrays.arrayOf
                                            (_js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ])
                                          ],
                                      maxSkew = _js2n__-prdslib.isType 'Integer,
                                      minDomains = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      nodeAffinityPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      nodeTaintsPolicy = _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                      topologyKey = _js2n__-prdslib.isType
                                          '"String",
                                      whenUnsatisfiable = _js2n__-prdslib.isType
                                          '"String",
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                            volumes = _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"Array",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.allOf
                                  [
                                    _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                    _js2n__-prdslib.records.required [ "name" ],
                                    _js2n__-prdslib.records.record
                                    {
                                      awsElasticBlockStore =
                                        _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "volumeID" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              partition = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volumeID = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      azureDisk = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "diskName", "diskURI" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              cachingMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              diskName = _js2n__-prdslib.isType
                                                  '"String",
                                              diskURI = _js2n__-prdslib.isType
                                                  '"String",
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              kind = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      azureFile = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "secretName", "shareName" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretName =
                                                _js2n__-prdslib.isType
                                                  '"String",
                                              shareName = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      cephfs = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "monitors" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              monitors = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                              path = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretFile = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              user = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      cinder = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "volumeID" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              volumeID = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      configMap = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              defaultMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              items = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "key", "path" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        key =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                        mode =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        path =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              name = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              "optional" = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      csi = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "driver" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              driver = _js2n__-prdslib.isType
                                                  '"String",
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              nodePublishSecretRef =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volumeAttributes =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      downwardAPI = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              defaultMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              items = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "path" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        fieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "fieldPath" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                apiVersion =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                fieldPath =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        mode =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        path =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                        resourceFieldRef =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "resource" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                containerName =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                divisor =
                                                                  _js2n__-prdslib.oneOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"String",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Number",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ]
                                                                    ],
                                                                resource =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      emptyDir = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              medium = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              sizeLimit = _js2n__-prdslib.oneOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Number",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ]
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      ephemeral = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              volumeClaimTemplate =
                                                _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.required
                                                    [ "spec" ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      metadata =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Record,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              annotations =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              creationTimestamp =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              deletionGracePeriodSeconds =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    'Integer,
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              deletionTimestamp =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              finalizers =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              generateName =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              generation =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    'Integer,
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              labels =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {  }
                                                                    {  }
                                                                    true
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              managedFields =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        apiVersion =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        fieldsType =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        fieldsV1 =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        manager =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        operation =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        subresource =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        time =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              name =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              namespace =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              ownerReferences =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.required
                                                                      [
                                                                        "apiVersion",
                                                                        "kind",
                                                                        "name",
                                                                        "uid"
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        apiVersion =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        blockOwnerDeletion =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Bool",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        controller =
                                                                          _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Bool",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                        kind =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        name =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                        uid =
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ])
                                                                  ],
                                                              resourceVersion =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              selfLink =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              uid =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                      spec =
                                                        _js2n__-prdslib.allOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            'Record,
                                                            _js2n__-prdslib.records.record
                                                            {
                                                              accessModes =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Array",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.arrays.arrayOf
                                                                    (_js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ])
                                                                  ],
                                                              dataSource =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.required
                                                                    [
                                                                      "kind",
                                                                      "name"
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      apiGroup =
                                                                        _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                            '"String",
                                                                            _js2n__-prdslib.isType
                                                                            'Null
                                                                          ],
                                                                      kind =
                                                                        _js2n__-prdslib.isType
                                                                          '"String",
                                                                      name =
                                                                        _js2n__-prdslib.isType
                                                                          '"String",
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              dataSourceRef =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.required
                                                                    [
                                                                      "kind",
                                                                      "name"
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      apiGroup =
                                                                        _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                            '"String",
                                                                            _js2n__-prdslib.isType
                                                                            'Null
                                                                          ],
                                                                      kind =
                                                                        _js2n__-prdslib.isType
                                                                          '"String",
                                                                      name =
                                                                        _js2n__-prdslib.isType
                                                                          '"String",
                                                                      namespace =
                                                                        _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                            '"String",
                                                                            _js2n__-prdslib.isType
                                                                            'Null
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              resources =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      limits =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.oneOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Number",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ]
                                                                            ])
                                                                          ],
                                                                      requests =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.oneOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Number",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ]
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              selector =
                                                                _js2n__-prdslib.allOf
                                                                  [
                                                                    _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Record,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                    _js2n__-prdslib.records.record
                                                                    {
                                                                      matchExpressions =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"Array",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.arrays.arrayOf
                                                                            (_js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.required
                                                                              [
                                                                                "key",
                                                                                "operator"
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                key =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                operator =
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                values =
                                                                                  _js2n__-prdslib.allOf
                                                                                    [
                                                                                      _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"Array",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                                      (_js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ])
                                                                                    ],
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                            ])
                                                                          ],
                                                                      matchLabels =
                                                                        _js2n__-prdslib.allOf
                                                                          [
                                                                            _js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              'Record,
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ],
                                                                            _js2n__-prdslib.records.record
                                                                            {  }
                                                                            {  }
                                                                            true
                                                                            (_js2n__-prdslib.anyOf
                                                                            [
                                                                              _js2n__-prdslib.isType
                                                                              '"String",
                                                                              _js2n__-prdslib.isType
                                                                              'Null
                                                                            ])
                                                                          ],
                                                                    }
                                                                    {  }
                                                                    false
                                                                    _js2n__-prdslib.never
                                                                  ],
                                                              storageClassName =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              volumeAttributesClassName =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              volumeMode =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                              volumeName =
                                                                _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                    '"String",
                                                                    _js2n__-prdslib.isType
                                                                    'Null
                                                                  ],
                                                            }
                                                            {  }
                                                            false
                                                            _js2n__-prdslib.never
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      fc = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              lun = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              targetWWNs = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                              wwids = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      flexVolume = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "driver" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              driver = _js2n__-prdslib.isType
                                                  '"String",
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              options = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {  }
                                                    {  }
                                                    true
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      flocker = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              datasetName =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              datasetUUID =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      gcePersistentDisk = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "pdName" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              partition = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              pdName = _js2n__-prdslib.isType
                                                  '"String",
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      gitRepo = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "repository" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              directory = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              repository =
                                                _js2n__-prdslib.isType
                                                  '"String",
                                              revision = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      glusterfs = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "endpoints", "path" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              endpoints = _js2n__-prdslib.isType
                                                  '"String",
                                              path = _js2n__-prdslib.isType
                                                  '"String",
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      hostPath = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "path" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              path = _js2n__-prdslib.isType
                                                  '"String",
                                              type = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      iscsi = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "iqn", "lun", "targetPortal" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              chapAuthDiscovery =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              chapAuthSession =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              initiatorName =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              iqn = _js2n__-prdslib.isType
                                                  '"String",
                                              iscsiInterface =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              lun = _js2n__-prdslib.isType
                                                  'Integer,
                                              portals = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              targetPortal =
                                                _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      name = _js2n__-prdslib.isType '"String",
                                      nfs = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "path", "server" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              path = _js2n__-prdslib.isType
                                                  '"String",
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              server = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      persistentVolumeClaim =
                                        _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "claimName" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              claimName = _js2n__-prdslib.isType
                                                  '"String",
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      photonPersistentDisk =
                                        _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "pdID" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              pdID = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      portworxVolume = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "volumeID" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volumeID = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      projected = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              defaultMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              sources = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        clusterTrustBundle =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "path" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                labelSelector =
                                                                  _js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        'Record,
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.records.record
                                                                      {
                                                                        matchExpressions =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"Array",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.arrays.arrayOf
                                                                              (_js2n__-prdslib.allOf
                                                                              [
                                                                                _js2n__-prdslib.anyOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                  'Record,
                                                                                  _js2n__-prdslib.isType
                                                                                  'Null
                                                                                ],
                                                                                _js2n__-prdslib.records.required
                                                                                [
                                                                                  "key",
                                                                                  "operator"
                                                                                ],
                                                                                _js2n__-prdslib.records.record
                                                                                {
                                                                                  key =
                                                                                    _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                  operator =
                                                                                    _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                  values =
                                                                                    _js2n__-prdslib.allOf
                                                                                      [
                                                                                        _js2n__-prdslib.anyOf
                                                                                        [
                                                                                          _js2n__-prdslib.isType
                                                                                          '"Array",
                                                                                          _js2n__-prdslib.isType
                                                                                          'Null
                                                                                        ],
                                                                                        _js2n__-prdslib.arrays.arrayOf
                                                                                        (_js2n__-prdslib.anyOf
                                                                                        [
                                                                                          _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                          _js2n__-prdslib.isType
                                                                                          'Null
                                                                                        ])
                                                                                      ],
                                                                                }
                                                                                {
                                                                                  
                                                                                }
                                                                                false
                                                                                _js2n__-prdslib.never
                                                                              ])
                                                                            ],
                                                                        matchLabels =
                                                                          _js2n__-prdslib.allOf
                                                                            [
                                                                              _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Record,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                              _js2n__-prdslib.records.record
                                                                              {
                                                                                
                                                                              }
                                                                              {
                                                                                
                                                                              }
                                                                              true
                                                                              (_js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                '"String",
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ])
                                                                            ],
                                                                      }
                                                                      {  }
                                                                      false
                                                                      _js2n__-prdslib.never
                                                                    ],
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                path =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                                signerName =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        configMap =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                items =
                                                                  _js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Array",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                      (_js2n__-prdslib.allOf
                                                                      [
                                                                        _js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                          'Record,
                                                                          _js2n__-prdslib.isType
                                                                          'Null
                                                                        ],
                                                                        _js2n__-prdslib.records.required
                                                                        [
                                                                          "key",
                                                                          "path"
                                                                        ],
                                                                        _js2n__-prdslib.records.record
                                                                        {
                                                                          key =
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                          mode =
                                                                            _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Integer,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                          path =
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                        }
                                                                        {  }
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                      ])
                                                                    ],
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        downwardAPI =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                items =
                                                                  _js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Array",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                      (_js2n__-prdslib.allOf
                                                                      [
                                                                        _js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                          'Record,
                                                                          _js2n__-prdslib.isType
                                                                          'Null
                                                                        ],
                                                                        _js2n__-prdslib.records.required
                                                                        [
                                                                          "path"
                                                                        ],
                                                                        _js2n__-prdslib.records.record
                                                                        {
                                                                          fieldRef =
                                                                            _js2n__-prdslib.allOf
                                                                              [
                                                                                _js2n__-prdslib.anyOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                  'Record,
                                                                                  _js2n__-prdslib.isType
                                                                                  'Null
                                                                                ],
                                                                                _js2n__-prdslib.records.required
                                                                                [
                                                                                  "fieldPath"
                                                                                ],
                                                                                _js2n__-prdslib.records.record
                                                                                {
                                                                                  apiVersion =
                                                                                    _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                  fieldPath =
                                                                                    _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                }
                                                                                {
                                                                                  
                                                                                }
                                                                                false
                                                                                _js2n__-prdslib.never
                                                                              ],
                                                                          mode =
                                                                            _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Integer,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                          path =
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                          resourceFieldRef =
                                                                            _js2n__-prdslib.allOf
                                                                              [
                                                                                _js2n__-prdslib.anyOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                  'Record,
                                                                                  _js2n__-prdslib.isType
                                                                                  'Null
                                                                                ],
                                                                                _js2n__-prdslib.records.required
                                                                                [
                                                                                  "resource"
                                                                                ],
                                                                                _js2n__-prdslib.records.record
                                                                                {
                                                                                  containerName =
                                                                                    _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                        'Null
                                                                                      ],
                                                                                  divisor =
                                                                                    _js2n__-prdslib.oneOf
                                                                                      [
                                                                                        _js2n__-prdslib.anyOf
                                                                                        [
                                                                                          _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                          _js2n__-prdslib.isType
                                                                                          'Null
                                                                                        ],
                                                                                        _js2n__-prdslib.anyOf
                                                                                        [
                                                                                          _js2n__-prdslib.isType
                                                                                          '"Number",
                                                                                          _js2n__-prdslib.isType
                                                                                          'Null
                                                                                        ]
                                                                                      ],
                                                                                  resource =
                                                                                    _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                }
                                                                                {
                                                                                  
                                                                                }
                                                                                false
                                                                                _js2n__-prdslib.never
                                                                              ],
                                                                        }
                                                                        {  }
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                      ])
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        secret =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                items =
                                                                  _js2n__-prdslib.allOf
                                                                    [
                                                                      _js2n__-prdslib.anyOf
                                                                      [
                                                                        _js2n__-prdslib.isType
                                                                        '"Array",
                                                                        _js2n__-prdslib.isType
                                                                        'Null
                                                                      ],
                                                                      _js2n__-prdslib.arrays.arrayOf
                                                                      (_js2n__-prdslib.allOf
                                                                      [
                                                                        _js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                          'Record,
                                                                          _js2n__-prdslib.isType
                                                                          'Null
                                                                        ],
                                                                        _js2n__-prdslib.records.required
                                                                        [
                                                                          "key",
                                                                          "path"
                                                                        ],
                                                                        _js2n__-prdslib.records.record
                                                                        {
                                                                          key =
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                          mode =
                                                                            _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                'Integer,
                                                                                _js2n__-prdslib.isType
                                                                                'Null
                                                                              ],
                                                                          path =
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                        }
                                                                        {  }
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                      ])
                                                                    ],
                                                                name =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                "optional" =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"Bool",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                        serviceAccountToken =
                                                          _js2n__-prdslib.allOf
                                                            [
                                                              _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                'Record,
                                                                _js2n__-prdslib.isType
                                                                'Null
                                                              ],
                                                              _js2n__-prdslib.records.required
                                                              [ "path" ],
                                                              _js2n__-prdslib.records.record
                                                              {
                                                                audience =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      '"String",
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                expirationSeconds =
                                                                  _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                      'Integer,
                                                                      _js2n__-prdslib.isType
                                                                      'Null
                                                                    ],
                                                                path =
                                                                  _js2n__-prdslib.isType
                                                                    '"String",
                                                              }
                                                              {  }
                                                              false
                                                              _js2n__-prdslib.never
                                                            ],
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      quobyte = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "registry", "volume" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              group = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              registry = _js2n__-prdslib.isType
                                                  '"String",
                                              tenant = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              user = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volume = _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      rbd = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "image", "monitors" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              image = _js2n__-prdslib.isType
                                                  '"String",
                                              keyring = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              monitors = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Array",
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"String",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ])
                                                  ],
                                              pool = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              user = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      scaleIO = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [
                                              "gateway",
                                              "secretRef",
                                              "system"
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              gateway = _js2n__-prdslib.isType
                                                  '"String",
                                              protectionDomain =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Record,
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              sslEnabled = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              storageMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              storagePool =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              system = _js2n__-prdslib.isType
                                                  '"String",
                                              volumeName = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      secret = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              defaultMode =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              items = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      '"Array",
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.arrays.arrayOf
                                                    (_js2n__-prdslib.allOf
                                                    [
                                                      _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                        'Record,
                                                        _js2n__-prdslib.isType
                                                        'Null
                                                      ],
                                                      _js2n__-prdslib.records.required
                                                      [ "key", "path" ],
                                                      _js2n__-prdslib.records.record
                                                      {
                                                        key =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                        mode =
                                                          _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                              'Integer,
                                                              _js2n__-prdslib.isType
                                                              'Null
                                                            ],
                                                        path =
                                                          _js2n__-prdslib.isType
                                                            '"String",
                                                      }
                                                      {  }
                                                      false
                                                      _js2n__-prdslib.never
                                                    ])
                                                  ],
                                              "optional" = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretName = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      storageos = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              readOnly = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              secretRef = _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.anyOf
                                                    [
                                                      _js2n__-prdslib.isType
                                                      'Record,
                                                      _js2n__-prdslib.isType
                                                      'Null
                                                    ],
                                                    _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                            '"String",
                                                            _js2n__-prdslib.isType
                                                            'Null
                                                          ],
                                                    }
                                                    {  }
                                                    false
                                                    _js2n__-prdslib.never
                                                  ],
                                              volumeName = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volumeNamespace =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                      vsphereVolume = _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType 'Record,
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                            _js2n__-prdslib.records.required
                                            [ "volumePath" ],
                                            _js2n__-prdslib.records.record
                                            {
                                              fsType = _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              storagePolicyID =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              storagePolicyName =
                                                _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                    '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                              volumePath =
                                                _js2n__-prdslib.isType
                                                  '"String",
                                            }
                                            {  }
                                            false
                                            _js2n__-prdslib.never
                                          ],
                                    }
                                    {  }
                                    false
                                    _js2n__-prdslib.never
                                  ])
                                ],
                          }
                          {  }
                          false
                          _js2n__-prdslib.never
                        ],
                  }
                  {  }
                  false
                  _js2n__-prdslib.never
                ],
            updateStrategy = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType 'Record,
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.records.record
                  {
                    rollingUpdate = _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType 'Record,
                            _js2n__-prdslib.isType 'Null
                          ],
                          _js2n__-prdslib.records.record
                          {
                            maxSurge = _js2n__-prdslib.oneOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Integer,
                                    _js2n__-prdslib.isType 'Null
                                  ]
                                ],
                            maxUnavailable = _js2n__-prdslib.oneOf
                                [
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType '"String",
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                  _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Integer,
                                    _js2n__-prdslib.isType 'Null
                                  ]
                                ],
                          }
                          {  }
                          false
                          _js2n__-prdslib.never
                        ],
                    type = _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  }
                  {  }
                  false
                  _js2n__-prdslib.never
                ],
          }
          {  }
          false
          _js2n__-prdslib.never
        ],
    status = _js2n__-prdslib.allOf
        [
          _js2n__-prdslib.anyOf
          [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
          _js2n__-prdslib.records.required
          [
            "currentNumberScheduled",
            "desiredNumberScheduled",
            "numberMisscheduled",
            "numberReady"
          ],
          _js2n__-prdslib.records.record
          {
            collisionCount = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            conditions = _js2n__-prdslib.allOf
                [
                  _js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"Array",
                    _js2n__-prdslib.isType 'Null
                  ],
                  _js2n__-prdslib.arrays.arrayOf
                  (_js2n__-prdslib.allOf
                  [
                    _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType 'Record,
                      _js2n__-prdslib.isType 'Null
                    ],
                    _js2n__-prdslib.records.required [ "status", "type" ],
                    _js2n__-prdslib.records.record
                    {
                      lastTransitionTime = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      message = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      reason = _js2n__-prdslib.anyOf
                          [
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ],
                      status = _js2n__-prdslib.isType '"String",
                      type = _js2n__-prdslib.isType '"String",
                    }
                    {  }
                    false
                    _js2n__-prdslib.never
                  ])
                ],
            currentNumberScheduled = _js2n__-prdslib.isType 'Integer,
            desiredNumberScheduled = _js2n__-prdslib.isType 'Integer,
            numberAvailable = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            numberMisscheduled = _js2n__-prdslib.isType 'Integer,
            numberReady = _js2n__-prdslib.isType 'Integer,
            numberUnavailable = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            observedGeneration = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
            updatedNumberScheduled = _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Integer,
                  _js2n__-prdslib.isType 'Null
                ],
          }
          {  }
          false
          _js2n__-prdslib.never
        ],
  }
  {  }
  false
  _js2n__-prdslib.never
])