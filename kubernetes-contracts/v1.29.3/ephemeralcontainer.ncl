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
{
  args
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    ])
    | doc m%"
    Arguments to the entrypoint. The image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    "%
    | optional,
  command
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    ])
    | doc m%"
    Entrypoint array. Not executed within a shell. The image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    "%
    | optional,
  env
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.required [ "name" ],
        _js2n__-prdslib.records.record
        {
          name = _js2n__-prdslib.isType '"String",
          value = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          valueFrom = _js2n__-prdslib.allOf
              [
                _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
                _js2n__-prdslib.records.record
                {
                  configMapKeyRef = _js2n__-prdslib.allOf
                      [
                        _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                        _js2n__-prdslib.records.required [ "key" ],
                        _js2n__-prdslib.records.record
                        {
                          key = _js2n__-prdslib.isType '"String",
                          name = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                          "optional" = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ],
                  fieldRef = _js2n__-prdslib.allOf
                      [
                        _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                        _js2n__-prdslib.records.required [ "fieldPath" ],
                        _js2n__-prdslib.records.record
                        {
                          apiVersion = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                          fieldPath = _js2n__-prdslib.isType '"String",
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ],
                  resourceFieldRef = _js2n__-prdslib.allOf
                      [
                        _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                        _js2n__-prdslib.records.required [ "resource" ],
                        _js2n__-prdslib.records.record
                        {
                          containerName = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                          divisor = _js2n__-prdslib.oneOf
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
                              ],
                          resource = _js2n__-prdslib.isType '"String",
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ],
                  secretKeyRef = _js2n__-prdslib.allOf
                      [
                        _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                        _js2n__-prdslib.records.required [ "key" ],
                        _js2n__-prdslib.records.record
                        {
                          key = _js2n__-prdslib.isType '"String",
                          name = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                          "optional" = _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
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
        }
        {  }
        false
        _js2n__-prdslib.never
      ])
    ])
    | doc m%"
    List of environment variables to set in the container. Cannot be updated.
    "%
    | optional,
  envFrom
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.record
        {
          configMapRef = _js2n__-prdslib.allOf
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
                  "optional" = _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType '"Bool",
                        _js2n__-prdslib.isType 'Null
                      ],
                }
                {  }
                false
                _js2n__-prdslib.never
              ],
          prefix = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          secretRef = _js2n__-prdslib.allOf
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
                  "optional" = _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType '"Bool",
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
    ])
    | doc m%"
    List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER. All invalid keys will be reported as an event when the container is starting. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
    "%
    | optional,
  image
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
    "%
    | optional,
  imagePullPolicy
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images
    "%
    | optional,
  lifecycle
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        postStart = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
                exec = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.record
                      {
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
                      }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                httpGet = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "port" ],
                      _js2n__-prdslib.records.record
                      {
                        host = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        httpHeaders = _js2n__-prdslib.allOf
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
                                  name = _js2n__-prdslib.isType '"String",
                                  value = _js2n__-prdslib.isType '"String",
                                }
                                {  }
                                false
                                _js2n__-prdslib.never
                              ])
                            ],
                        path = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        port = _js2n__-prdslib.oneOf
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
                        scheme = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                      }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                sleep = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "seconds" ],
                      _js2n__-prdslib.records.record
                      { seconds = _js2n__-prdslib.isType 'Integer, }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                tcpSocket = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "port" ],
                      _js2n__-prdslib.records.record
                      {
                        host = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        port = _js2n__-prdslib.oneOf
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
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        preStop = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
                exec = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.record
                      {
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
                      }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                httpGet = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "port" ],
                      _js2n__-prdslib.records.record
                      {
                        host = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        httpHeaders = _js2n__-prdslib.allOf
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
                                  name = _js2n__-prdslib.isType '"String",
                                  value = _js2n__-prdslib.isType '"String",
                                }
                                {  }
                                false
                                _js2n__-prdslib.never
                              ])
                            ],
                        path = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        port = _js2n__-prdslib.oneOf
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
                        scheme = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                      }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                sleep = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "seconds" ],
                      _js2n__-prdslib.records.record
                      { seconds = _js2n__-prdslib.isType 'Integer, }
                      {  }
                      false
                      _js2n__-prdslib.never
                    ],
                tcpSocket = _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                      _js2n__-prdslib.records.required [ "port" ],
                      _js2n__-prdslib.records.record
                      {
                        host = _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                        port = _js2n__-prdslib.oneOf
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
    | doc m%"
    Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.
    "%
    | optional,
  livenessProbe
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        exec = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
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
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        failureThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        grpc = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                port = _js2n__-prdslib.isType 'Integer,
                service = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        httpGet = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                httpHeaders = _js2n__-prdslib.allOf
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
                        _js2n__-prdslib.records.required [ "name", "value" ],
                        _js2n__-prdslib.records.record
                        {
                          name = _js2n__-prdslib.isType '"String",
                          value = _js2n__-prdslib.isType '"String",
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ])
                    ],
                path = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
                scheme = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        initialDelaySeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        periodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        successThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        tcpSocket = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
        terminationGracePeriodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        timeoutSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
      }
      {  }
      false
      _js2n__-prdslib.never
    ])
    | doc m%"
    Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
    "%
    | optional,
  name
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Name of the ephemeral container specified as a DNS_LABEL. This name must be unique among all containers, init containers and ephemeral containers.
    "%,
  ports
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.required [ "containerPort" ],
        _js2n__-prdslib.records.record
        {
          containerPort = _js2n__-prdslib.isType 'Integer,
          hostIP = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          hostPort = _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
          name = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          protocol = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
        }
        {  }
        false
        _js2n__-prdslib.never
      ])
    ])
    | doc m%"
    Ports are not allowed for ephemeral containers.
    "%
    | optional,
  readinessProbe
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        exec = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
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
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        failureThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        grpc = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                port = _js2n__-prdslib.isType 'Integer,
                service = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        httpGet = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                httpHeaders = _js2n__-prdslib.allOf
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
                        _js2n__-prdslib.records.required [ "name", "value" ],
                        _js2n__-prdslib.records.record
                        {
                          name = _js2n__-prdslib.isType '"String",
                          value = _js2n__-prdslib.isType '"String",
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ])
                    ],
                path = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
                scheme = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        initialDelaySeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        periodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        successThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        tcpSocket = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
        terminationGracePeriodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        timeoutSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
      }
      {  }
      false
      _js2n__-prdslib.never
    ])
    | doc m%"
    Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
    "%
    | optional,
  resizePolicy
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.required [ "resourceName", "restartPolicy" ],
        _js2n__-prdslib.records.record
        {
          resourceName = _js2n__-prdslib.isType '"String",
          restartPolicy = _js2n__-prdslib.isType '"String",
        }
        {  }
        false
        _js2n__-prdslib.never
      ])
    ])
    | doc m%"
    Resources resize policy for the container.
    "%
    | optional,
  resources
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        claims = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
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
        limits = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
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
        requests = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
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
      }
      {  }
      false
      _js2n__-prdslib.never
    ])
    | doc m%"
    ResourceRequirements describes the compute resource requirements.
    "%
    | optional,
  restartPolicy
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Restart policy for the container to manage the restart behavior of each container within a pod. This may only be set for init containers. You cannot set this field on ephemeral containers.
    "%
    | optional,
  securityContext
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        allowPrivilegeEscalation = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ],
        capabilities = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
                add = _js2n__-prdslib.allOf
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
                drop = _js2n__-prdslib.allOf
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
        privileged = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ],
        procMount = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ],
        readOnlyRootFilesystem = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ],
        runAsGroup = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        runAsNonRoot = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ],
        runAsUser = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        seLinuxOptions = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
                level = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                role = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                type = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                user = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
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
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
              {
                localhostProfile = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                type = _js2n__-prdslib.isType '"String",
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        windowsOptions = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
                gmsaCredentialSpec = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                gmsaCredentialSpecName = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                hostProcess = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"Bool",
                      _js2n__-prdslib.isType 'Null
                    ],
                runAsUserName = _js2n__-prdslib.anyOf
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
    ])
    | doc m%"
    SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence.
    "%
    | optional,
  startupProbe
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.records.record
      {
        exec = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.record
              {
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
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        failureThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        grpc = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                port = _js2n__-prdslib.isType 'Integer,
                service = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        httpGet = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                httpHeaders = _js2n__-prdslib.allOf
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
                        _js2n__-prdslib.records.required [ "name", "value" ],
                        _js2n__-prdslib.records.record
                        {
                          name = _js2n__-prdslib.isType '"String",
                          value = _js2n__-prdslib.isType '"String",
                        }
                        {  }
                        false
                        _js2n__-prdslib.never
                      ])
                    ],
                path = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
                scheme = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              }
              {  }
              false
              _js2n__-prdslib.never
            ],
        initialDelaySeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        periodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        successThreshold = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        tcpSocket = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
              {
                host = _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
                port = _js2n__-prdslib.oneOf
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
        terminationGracePeriodSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
        timeoutSeconds = _js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ],
      }
      {  }
      false
      _js2n__-prdslib.never
    ])
    | doc m%"
    Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
    "%
    | optional,
  stdin
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
    "%
    | optional,
  stdinOnce
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
    "%
    | optional,
  targetContainerName
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    If set, the name of the container from PodSpec that this ephemeral container targets. The ephemeral container will be run in the namespaces (IPC, PID, etc) of this container. If not set then the ephemeral container uses the namespaces configured in the Pod spec.
    
    The container runtime must implement support for this feature. If the runtime does not support namespace targeting then the result of setting this field is undefined.
    "%
    | optional,
  terminationMessagePath
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
    "%
    | optional,
  terminationMessagePolicy
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
    "%
    | optional,
  tty
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
    "%
    | optional,
  volumeDevices
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.required [ "devicePath", "name" ],
        _js2n__-prdslib.records.record
        {
          devicePath = _js2n__-prdslib.isType '"String",
          name = _js2n__-prdslib.isType '"String",
        }
        {  }
        false
        _js2n__-prdslib.never
      ])
    ])
    | doc m%"
    volumeDevices is the list of block devices to be used by the container.
    "%
    | optional,
  volumeMounts
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.allOf
    [
      _js2n__-prdslib.anyOf
      [ _js2n__-prdslib.isType '"Array", _js2n__-prdslib.isType 'Null ],
      _js2n__-prdslib.arrays.arrayOf
      (_js2n__-prdslib.allOf
      [
        _js2n__-prdslib.anyOf
        [ _js2n__-prdslib.isType 'Record, _js2n__-prdslib.isType 'Null ],
        _js2n__-prdslib.records.required [ "mountPath", "name" ],
        _js2n__-prdslib.records.record
        {
          mountPath = _js2n__-prdslib.isType '"String",
          mountPropagation = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          name = _js2n__-prdslib.isType '"String",
          readOnly = _js2n__-prdslib.anyOf
              [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ],
          subPath = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
          subPathExpr = _js2n__-prdslib.anyOf
              [
                _js2n__-prdslib.isType '"String",
                _js2n__-prdslib.isType 'Null
              ],
        }
        {  }
        false
        _js2n__-prdslib.never
      ])
    ])
    | doc m%"
    Pod volumes to mount into the container's filesystem. Subpath mounts are not allowed for ephemeral containers. Cannot be updated.
    "%
    | optional,
  workingDir
    | _js2n__-prdslib.contract_from_predicate
    (_js2n__-prdslib.anyOf
    [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
    | doc m%"
    Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
    "%
    | optional,
}