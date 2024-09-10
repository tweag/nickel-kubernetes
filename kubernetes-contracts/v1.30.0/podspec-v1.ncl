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
  activeDeadlineSeconds
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.
    "%
    | optional,
  affinity
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        nodeAffinity = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                preferredDuringSchedulingIgnoredDuringExecution =
                  predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "preference", "weight" ],
                        predicates.records.record
                        {
                          preference = predicates.allOf
                              [
                                predicates.isType 'Record,
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
                                  matchFields = predicates.allOf
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
                      [ predicates.isType 'Record, predicates.isType 'Null ],
                      predicates.records.required [ "nodeSelectorTerms" ],
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
                                  matchFields = predicates.allOf
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
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                preferredDuringSchedulingIgnoredDuringExecution =
                  predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required
                        [ "podAffinityTerm", "weight" ],
                        predicates.records.record
                        {
                          podAffinityTerm = predicates.allOf
                              [
                                predicates.isType 'Record,
                                predicates.records.required [ "topologyKey" ],
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
                                                    key = predicates.isType
                                                        '"String",
                                                    operator = predicates.isType
                                                        '"String",
                                                    values = predicates.allOf
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
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                                    key = predicates.isType
                                                        '"String",
                                                    operator = predicates.isType
                                                        '"String",
                                                    values = predicates.allOf
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
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                  topologyKey = predicates.isType '"String",
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
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "topologyKey" ],
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
                          topologyKey = predicates.isType '"String",
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
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                preferredDuringSchedulingIgnoredDuringExecution =
                  predicates.allOf
                    [
                      predicates.anyOf
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required
                        [ "podAffinityTerm", "weight" ],
                        predicates.records.record
                        {
                          podAffinityTerm = predicates.allOf
                              [
                                predicates.isType 'Record,
                                predicates.records.required [ "topologyKey" ],
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
                                                    key = predicates.isType
                                                        '"String",
                                                    operator = predicates.isType
                                                        '"String",
                                                    values = predicates.allOf
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
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                                    key = predicates.isType
                                                        '"String",
                                                    operator = predicates.isType
                                                        '"String",
                                                    values = predicates.allOf
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
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                  topologyKey = predicates.isType '"String",
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
                      [ predicates.isType '"Array", predicates.isType 'Null ],
                      predicates.arrays.arrayOf
                      (predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.required [ "topologyKey" ],
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
                          topologyKey = predicates.isType '"String",
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
    Affinity is a group of affinity scheduling rules.
    "%
    | optional,
  automountServiceAccountToken
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.
    "%
    | optional,
  containers
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record
        {
          args = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          command = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          env = predicates.allOf
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                            fieldRef = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "fieldPath" ],
                                  predicates.records.record
                                  {
                                    apiVersion = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    fieldPath = predicates.isType '"String",
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
                                  predicates.records.required [ "resource" ],
                                  predicates.records.record
                                  {
                                    containerName = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    divisor = predicates.oneOf
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
                                    resource = predicates.isType '"String",
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          imagePullPolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          lifecycle = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  postStart = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                        }
                        {  }
                        false
                        predicates.never
                      ],
                  preStop = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          name = predicates.isType '"String",
          ports = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "containerPort" ],
                  predicates.records.record
                  {
                    containerPort = predicates.isType 'Integer,
                    hostIP = predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ],
                    hostPort = predicates.anyOf
                        [ predicates.isType 'Integer, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          resizePolicy = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  claims = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
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
                          { name = predicates.isType '"String", }
                          {  }
                          false
                          predicates.never
                        ])
                      ],
                  limits = predicates.allOf
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
                          [
                            predicates.isType '"Number",
                            predicates.isType 'Null
                          ]
                        ])
                      ],
                  requests = predicates.allOf
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          securityContext = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  allowPrivilegeEscalation = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  appArmorProfile = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  capabilities = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  procMount = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnlyRootFilesystem = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsGroup = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  runAsNonRoot = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsUser = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  seLinuxOptions = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
          startupProbe = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          stdin = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          stdinOnce = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          terminationMessagePath = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          terminationMessagePolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          tty = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          volumeDevices = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "devicePath", "name" ],
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "mountPath", "name" ],
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
                        [ predicates.isType '"Bool", predicates.isType 'Null ],
                    recursiveReadOnly = predicates.anyOf
                        [
                          predicates.isType '"String",
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
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.
    "%,
  dnsConfig
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        nameservers = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType '"Array", predicates.isType 'Null ],
              predicates.arrays.arrayOf
              (predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ])
            ],
        options = predicates.allOf
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
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  value = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ])
            ],
        searches = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType '"Array", predicates.isType 'Null ],
              predicates.arrays.arrayOf
              (predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ])
            ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.
    "%
    | optional,
  dnsPolicy
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'.
    "%
    | optional,
  enableServiceLinks
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. Optional: Defaults to true.
    "%
    | optional,
  ephemeralContainers
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record
        {
          args = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          command = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          env = predicates.allOf
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                            fieldRef = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "fieldPath" ],
                                  predicates.records.record
                                  {
                                    apiVersion = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    fieldPath = predicates.isType '"String",
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
                                  predicates.records.required [ "resource" ],
                                  predicates.records.record
                                  {
                                    containerName = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    divisor = predicates.oneOf
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
                                    resource = predicates.isType '"String",
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          imagePullPolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          lifecycle = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  postStart = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                        }
                        {  }
                        false
                        predicates.never
                      ],
                  preStop = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          name = predicates.isType '"String",
          ports = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "containerPort" ],
                  predicates.records.record
                  {
                    containerPort = predicates.isType 'Integer,
                    hostIP = predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ],
                    hostPort = predicates.anyOf
                        [ predicates.isType 'Integer, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          resizePolicy = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  claims = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
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
                          { name = predicates.isType '"String", }
                          {  }
                          false
                          predicates.never
                        ])
                      ],
                  limits = predicates.allOf
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
                          [
                            predicates.isType '"Number",
                            predicates.isType 'Null
                          ]
                        ])
                      ],
                  requests = predicates.allOf
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          securityContext = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  allowPrivilegeEscalation = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  appArmorProfile = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  capabilities = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  procMount = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnlyRootFilesystem = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsGroup = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  runAsNonRoot = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsUser = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  seLinuxOptions = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
          startupProbe = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          stdin = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          stdinOnce = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          targetContainerName = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          terminationMessagePath = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          terminationMessagePolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          tty = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          volumeDevices = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "devicePath", "name" ],
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "mountPath", "name" ],
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
                        [ predicates.isType '"Bool", predicates.isType 'Null ],
                    recursiveReadOnly = predicates.anyOf
                        [
                          predicates.isType '"String",
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
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    List of ephemeral containers run in this pod. Ephemeral containers may be run in an existing pod to perform user-initiated actions such as debugging. This list cannot be specified when creating a pod, and it cannot be modified by updating the pod spec. In order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers subresource.
    "%
    | optional,
  hostAliases
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.record
        {
          hostnames = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          ip = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified.
    "%
    | optional,
  hostIPC
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Use the host's ipc namespace. Optional: Default to false.
    "%
    | optional,
  hostNetwork
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified. Default to false.
    "%
    | optional,
  hostPID
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Use the host's pid namespace. Optional: Default to false.
    "%
    | optional,
  hostUsers
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Use the host's user namespace. Optional: Default to true. If set to true or not present, the pod will be run in the host user namespace, useful for when the pod needs a feature only available to the host user namespace, such as loading a kernel module with CAP_SYS_MODULE. When set to false, a new userns is created for the pod. Setting false is useful for mitigating container breakout vulnerabilities even allowing users to run their containers as root without actually having root privileges on the host. This field is alpha-level and is only honored by servers that enable the UserNamespacesSupport feature.
    "%
    | optional,
  hostname
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.
    "%
    | optional,
  imagePullSecrets
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.record
        {
          name = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
    "%
    | optional,
  initContainers
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record
        {
          args = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          command = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          env = predicates.allOf
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                            fieldRef = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "fieldPath" ],
                                  predicates.records.record
                                  {
                                    apiVersion = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    fieldPath = predicates.isType '"String",
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
                                  predicates.records.required [ "resource" ],
                                  predicates.records.record
                                  {
                                    containerName = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    divisor = predicates.oneOf
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
                                    resource = predicates.isType '"String",
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
                                  predicates.records.required [ "key" ],
                                  predicates.records.record
                                  {
                                    key = predicates.isType '"String",
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          imagePullPolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          lifecycle = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  postStart = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                        }
                        {  }
                        false
                        predicates.never
                      ],
                  preStop = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                            name = predicates.isType '"String",
                                            value = predicates.isType '"String",
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
                          sleep = predicates.allOf
                              [
                                predicates.anyOf
                                [
                                  predicates.isType 'Record,
                                  predicates.isType 'Null
                                ],
                                predicates.records.required [ "seconds" ],
                                predicates.records.record
                                { seconds = predicates.isType 'Integer, }
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          name = predicates.isType '"String",
          ports = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "containerPort" ],
                  predicates.records.record
                  {
                    containerPort = predicates.isType 'Integer,
                    hostIP = predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ],
                    hostPort = predicates.anyOf
                        [ predicates.isType 'Integer, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          resizePolicy = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  claims = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
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
                          { name = predicates.isType '"String", }
                          {  }
                          false
                          predicates.never
                        ])
                      ],
                  limits = predicates.allOf
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
                          [
                            predicates.isType '"Number",
                            predicates.isType 'Null
                          ]
                        ])
                      ],
                  requests = predicates.allOf
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
              [ predicates.isType '"String", predicates.isType 'Null ],
          securityContext = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  allowPrivilegeEscalation = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  appArmorProfile = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  capabilities = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  procMount = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnlyRootFilesystem = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsGroup = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  runAsNonRoot = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  runAsUser = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  seLinuxOptions = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
          startupProbe = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  exec = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  grpc = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                    name = predicates.isType '"String",
                                    value = predicates.isType '"String",
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
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  periodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  successThreshold = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  tcpSocket = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                  terminationGracePeriodSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  timeoutSeconds = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          stdin = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          stdinOnce = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          terminationMessagePath = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          terminationMessagePolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          tty = predicates.anyOf
              [ predicates.isType '"Bool", predicates.isType 'Null ],
          volumeDevices = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "devicePath", "name" ],
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.allOf
                [
                  predicates.anyOf
                  [ predicates.isType 'Record, predicates.isType 'Null ],
                  predicates.records.required [ "mountPath", "name" ],
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
                        [ predicates.isType '"Bool", predicates.isType 'Null ],
                    recursiveReadOnly = predicates.anyOf
                        [
                          predicates.isType '"String",
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
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
    "%
    | optional,
  nodeName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.
    "%
    | optional,
  nodeSelector
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record {  } {  } true
      (predicates.anyOf
      [ predicates.isType '"String", predicates.isType 'Null ])
    ])
    | doc m%"
    NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
    "%
    | optional,
  os
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "name" ],
      predicates.records.record { name = predicates.isType '"String", } {  }
      false
      predicates.never
    ])
    | doc m%"
    PodOS defines the OS parameters of a pod.
    "%
    | optional,
  overhead
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record {  } {  } true
      (predicates.oneOf
      [
        predicates.anyOf
        [ predicates.isType '"String", predicates.isType 'Null ],
        predicates.anyOf
        [ predicates.isType '"Number", predicates.isType 'Null ]
      ])
    ])
    | doc m%"
    Overhead represents the resource overhead associated with running a pod for a given RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass admission controller. If the RuntimeClass admission controller is enabled, overhead must not be set in Pod create requests. The RuntimeClass admission controller will reject Pod create requests which have the overhead already set. If RuntimeClass is configured and selected in the PodSpec, Overhead will be set to the value defined in the corresponding RuntimeClass, otherwise it will remain unset and treated as zero. More info: https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md
    "%
    | optional,
  preemptionPolicy
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
    "%
    | optional,
  "priority"
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority.
    "%
    | optional,
  priorityClassName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.
    "%
    | optional,
  readinessGates
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "conditionType" ],
        predicates.records.record
        { conditionType = predicates.isType '"String", }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    If specified, all readiness gates will be evaluated for pod readiness. A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to "True" More info: https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates
    "%
    | optional,
  resourceClaims
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record
        {
          name = predicates.isType '"String",
          source = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  resourceClaimName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  resourceClaimTemplateName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    ResourceClaims defines which ResourceClaims must be allocated and reserved before the Pod is allowed to start. The resources will be made available to those containers which consume them by name.
    
    This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
    
    This field is immutable.
    "%
    | optional,
  restartPolicy
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    Restart policy for all containers within the pod. One of Always, OnFailure, Never. In some contexts, only a subset of those values may be permitted. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
    "%
    | optional,
  runtimeClassName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should be used to run this pod.  If no RuntimeClass resource matches the named class, the pod will not be run. If unset or empty, the "legacy" RuntimeClass will be used, which is an implicit class with an empty definition that uses the default runtime handler. More info: https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class
    "%
    | optional,
  schedulerName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler.
    "%
    | optional,
  schedulingGates
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record { name = predicates.isType '"String", } {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    SchedulingGates is an opaque list of values that if specified will block scheduling the pod. If schedulingGates is not empty, the pod will stay in the SchedulingGated state and the scheduler will not attempt to schedule the pod.
    
    SchedulingGates can only be set at pod creation time, and be removed only afterwards.
    "%
    | optional,
  securityContext
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        appArmorProfile = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.required [ "type" ],
              predicates.records.record
              {
                localhostProfile = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                type = predicates.isType '"String",
              }
              {  }
              false
              predicates.never
            ],
        fsGroup = predicates.anyOf
            [ predicates.isType 'Integer, predicates.isType 'Null ],
        fsGroupChangePolicy = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        runAsGroup = predicates.anyOf
            [ predicates.isType 'Integer, predicates.isType 'Null ],
        runAsNonRoot = predicates.anyOf
            [ predicates.isType '"Bool", predicates.isType 'Null ],
        runAsUser = predicates.anyOf
            [ predicates.isType 'Integer, predicates.isType 'Null ],
        seLinuxOptions = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                level = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                role = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                type = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                user = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        seccompProfile = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.required [ "type" ],
              predicates.records.record
              {
                localhostProfile = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                type = predicates.isType '"String",
              }
              {  }
              false
              predicates.never
            ],
        supplementalGroups = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType '"Array", predicates.isType 'Null ],
              predicates.arrays.arrayOf
              (predicates.anyOf
              [ predicates.isType 'Integer, predicates.isType 'Null ])
            ],
        sysctls = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType '"Array", predicates.isType 'Null ],
              predicates.arrays.arrayOf
              (predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                gmsaCredentialSpec = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                gmsaCredentialSpecName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                hostProcess = predicates.anyOf
                    [ predicates.isType '"Bool", predicates.isType 'Null ],
                runAsUserName = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext.
    "%
    | optional,
  serviceAccount
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    DeprecatedServiceAccount is a deprecated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead.
    "%
    | optional,
  serviceAccountName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
    "%
    | optional,
  setHostnameAsFQDN
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    If true the pod's hostname will be configured as the pod's FQDN, rather than the leaf name (the default). In Linux containers, this means setting the FQDN in the hostname field of the kernel (the nodename field of struct utsname). In Windows containers, this means setting the registry value of hostname for the registry key HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters to FQDN. If a pod does not have FQDN, this has no effect. Default to false.
    "%
    | optional,
  shareProcessNamespace
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"Bool", predicates.isType 'Null ])
    | doc m%"
    Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Default to false.
    "%
    | optional,
  subdomain
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>". If not specified, the pod will not have a domainname at all.
    "%
    | optional,
  terminationGracePeriodSeconds
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType 'Integer, predicates.isType 'Null ])
    | doc m%"
    Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds.
    "%
    | optional,
  tolerations
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.record
        {
          effect = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          key = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          operator = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          tolerationSeconds = predicates.anyOf
              [ predicates.isType 'Integer, predicates.isType 'Null ],
          value = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    If specified, the pod's tolerations.
    "%
    | optional,
  topologySpreadConstraints
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required
        [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
        predicates.records.record
        {
          labelSelector = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
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
                          [
                            predicates.isType 'Record,
                            predicates.isType 'Null
                          ],
                          predicates.records.required [ "key", "operator" ],
                          predicates.records.record
                          {
                            key = predicates.isType '"String",
                            operator = predicates.isType '"String",
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                [ predicates.isType '"Array", predicates.isType 'Null ],
                predicates.arrays.arrayOf
                (predicates.anyOf
                [ predicates.isType '"String", predicates.isType 'Null ])
              ],
          maxSkew = predicates.isType 'Integer,
          minDomains = predicates.anyOf
              [ predicates.isType 'Integer, predicates.isType 'Null ],
          nodeAffinityPolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          nodeTaintsPolicy = predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ],
          topologyKey = predicates.isType '"String",
          whenUnsatisfiable = predicates.isType '"String",
        }
        {  }
        false
        predicates.never
      ])
    ])
    | doc m%"
    TopologySpreadConstraints describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints. All topologySpreadConstraints are ANDed.
    "%
    | optional,
  volumes
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.allOf
      [
        predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
        predicates.records.required [ "name" ],
        predicates.records.record
        {
          awsElasticBlockStore = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "volumeID" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  partition = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  volumeID = predicates.isType '"String",
                }
                {  }
                false
                predicates.never
              ],
          azureDisk = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "diskName", "diskURI" ],
                predicates.records.record
                {
                  cachingMode = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  diskName = predicates.isType '"String",
                  diskURI = predicates.isType '"String",
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  kind = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          azureFile = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "secretName", "shareName" ],
                predicates.records.record
                {
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
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
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretFile = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                      ],
                  user = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          cinder = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "volumeID" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  defaultMode = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  items = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
                        predicates.arrays.arrayOf
                        (predicates.allOf
                        [
                          predicates.anyOf
                          [
                            predicates.isType 'Record,
                            predicates.isType 'Null
                          ],
                          predicates.records.required [ "key", "path" ],
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
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  "optional" = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          csi = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "driver" ],
                predicates.records.record
                {
                  driver = predicates.isType '"String",
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  nodePublishSecretRef = predicates.allOf
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
                      ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  volumeAttributes = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  defaultMode = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  items = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
                        predicates.arrays.arrayOf
                        (predicates.allOf
                        [
                          predicates.anyOf
                          [
                            predicates.isType 'Record,
                            predicates.isType 'Null
                          ],
                          predicates.records.required [ "path" ],
                          predicates.records.record
                          {
                            fieldRef = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "fieldPath" ],
                                  predicates.records.record
                                  {
                                    apiVersion = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    fieldPath = predicates.isType '"String",
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
                                  predicates.records.required [ "resource" ],
                                  predicates.records.record
                                  {
                                    containerName = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    divisor = predicates.oneOf
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
                                    resource = predicates.isType '"String",
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  medium = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  sizeLimit = predicates.oneOf
                      [
                        predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ],
                        predicates.anyOf
                        [ predicates.isType '"Number", predicates.isType 'Null ]
                      ],
                }
                {  }
                false
                predicates.never
              ],
          ephemeral = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  volumeClaimTemplate = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
                                  creationTimestamp = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  deletionGracePeriodSeconds = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  deletionTimestamp = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  finalizers = predicates.allOf
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
                                  generateName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  generation = predicates.anyOf
                                      [
                                        predicates.isType 'Integer,
                                        predicates.isType 'Null
                                      ],
                                  labels = predicates.allOf
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
                                  managedFields = predicates.allOf
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
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  namespace = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  ownerReferences = predicates.allOf
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
                                          [
                                            "apiVersion",
                                            "kind",
                                            "name",
                                            "uid"
                                          ],
                                          predicates.records.record
                                          {
                                            apiVersion = predicates.isType
                                                '"String",
                                            blockOwnerDeletion =
                                              predicates.anyOf
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
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  selfLink = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  uid = predicates.anyOf
                                      [
                                        predicates.isType '"String",
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
                                  dataSource = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "kind", "name" ],
                                        predicates.records.record
                                        {
                                          apiGroup = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          kind = predicates.isType '"String",
                                          name = predicates.isType '"String",
                                        }
                                        {  }
                                        false
                                        predicates.never
                                      ],
                                  dataSourceRef = predicates.allOf
                                      [
                                        predicates.anyOf
                                        [
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.required
                                        [ "kind", "name" ],
                                        predicates.records.record
                                        {
                                          apiGroup = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
                                              ],
                                          kind = predicates.isType '"String",
                                          name = predicates.isType '"String",
                                          namespace = predicates.anyOf
                                              [
                                                predicates.isType '"String",
                                                predicates.isType 'Null
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
                                          predicates.isType 'Record,
                                          predicates.isType 'Null
                                        ],
                                        predicates.records.record
                                        {
                                          limits = predicates.allOf
                                              [
                                                predicates.anyOf
                                                [
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                  selector = predicates.allOf
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
                                                    key = predicates.isType
                                                        '"String",
                                                    operator = predicates.isType
                                                        '"String",
                                                    values = predicates.allOf
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
                                                  predicates.isType 'Record,
                                                  predicates.isType 'Null
                                                ],
                                                predicates.records.record {  }
                                                {  }
                                                true
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
                                  storageClassName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  volumeAttributesClassName = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
                                  volumeMode = predicates.anyOf
                                      [
                                        predicates.isType '"String",
                                        predicates.isType 'Null
                                      ],
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  lun = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  targetWWNs = predicates.allOf
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
                  wwids = predicates.allOf
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
              ],
          flexVolume = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "driver" ],
                predicates.records.record
                {
                  driver = predicates.isType '"String",
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  options = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType 'Record, predicates.isType 'Null ],
                        predicates.records.record {  } {  } true
                        (predicates.anyOf
                        [
                          predicates.isType '"String",
                          predicates.isType 'Null
                        ])
                      ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                      ],
                }
                {  }
                false
                predicates.never
              ],
          flocker = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  datasetName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  datasetUUID = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          gcePersistentDisk = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "pdName" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  partition = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  pdName = predicates.isType '"String",
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          gitRepo = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "repository" ],
                predicates.records.record
                {
                  directory = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  repository = predicates.isType '"String",
                  revision = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          glusterfs = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "endpoints", "path" ],
                predicates.records.record
                {
                  endpoints = predicates.isType '"String",
                  path = predicates.isType '"String",
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          hostPath = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "path" ],
                predicates.records.record
                {
                  path = predicates.isType '"String",
                  type = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          iscsi = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "iqn", "lun", "targetPortal" ],
                predicates.records.record
                {
                  chapAuthDiscovery = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  chapAuthSession = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  initiatorName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  iqn = predicates.isType '"String",
                  iscsiInterface = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  lun = predicates.isType 'Integer,
                  portals = predicates.allOf
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
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "path", "server" ],
                predicates.records.record
                {
                  path = predicates.isType '"String",
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  server = predicates.isType '"String",
                }
                {  }
                false
                predicates.never
              ],
          persistentVolumeClaim = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "claimName" ],
                predicates.records.record
                {
                  claimName = predicates.isType '"String",
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          photonPersistentDisk = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "pdID" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  pdID = predicates.isType '"String",
                }
                {  }
                false
                predicates.never
              ],
          portworxVolume = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "volumeID" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  volumeID = predicates.isType '"String",
                }
                {  }
                false
                predicates.never
              ],
          projected = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  defaultMode = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  sources = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
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
                            clusterTrustBundle = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "path" ],
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
                                                      key = predicates.isType
                                                          '"String",
                                                      operator =
                                                        predicates.isType
                                                          '"String",
                                                      values = predicates.allOf
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
                                                    predicates.isType 'Record,
                                                    predicates.isType 'Null
                                                  ],
                                                  predicates.records.record {  }
                                                  {  }
                                                  true
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
                                    path = predicates.isType '"String",
                                    signerName = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
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
                                              path = predicates.isType
                                                  '"String",
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
                                              path = predicates.isType
                                                  '"String",
                                              resourceFieldRef =
                                                predicates.allOf
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
                                              path = predicates.isType
                                                  '"String",
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
                            serviceAccountToken = predicates.allOf
                                [
                                  predicates.anyOf
                                  [
                                    predicates.isType 'Record,
                                    predicates.isType 'Null
                                  ],
                                  predicates.records.required [ "path" ],
                                  predicates.records.record
                                  {
                                    audience = predicates.anyOf
                                        [
                                          predicates.isType '"String",
                                          predicates.isType 'Null
                                        ],
                                    expirationSeconds = predicates.anyOf
                                        [
                                          predicates.isType 'Integer,
                                          predicates.isType 'Null
                                        ],
                                    path = predicates.isType '"String",
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
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "registry", "volume" ],
                predicates.records.record
                {
                  group = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  registry = predicates.isType '"String",
                  tenant = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  user = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  volume = predicates.isType '"String",
                }
                {  }
                false
                predicates.never
              ],
          rbd = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "image", "monitors" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  image = predicates.isType '"String",
                  keyring = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
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
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                      ],
                  user = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          scaleIO = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required
                [ "gateway", "secretRef", "system" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  gateway = predicates.isType '"String",
                  protectionDomain = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
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
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  storageMode = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  storagePool = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  system = predicates.isType '"String",
                  volumeName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          secret = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  defaultMode = predicates.anyOf
                      [ predicates.isType 'Integer, predicates.isType 'Null ],
                  items = predicates.allOf
                      [
                        predicates.anyOf
                        [ predicates.isType '"Array", predicates.isType 'Null ],
                        predicates.arrays.arrayOf
                        (predicates.allOf
                        [
                          predicates.anyOf
                          [
                            predicates.isType 'Record,
                            predicates.isType 'Null
                          ],
                          predicates.records.required [ "key", "path" ],
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
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          storageos = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  readOnly = predicates.anyOf
                      [ predicates.isType '"Bool", predicates.isType 'Null ],
                  secretRef = predicates.allOf
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
                      ],
                  volumeName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  volumeNamespace = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                }
                {  }
                false
                predicates.never
              ],
          vsphereVolume = predicates.allOf
              [
                predicates.anyOf
                [ predicates.isType 'Record, predicates.isType 'Null ],
                predicates.records.required [ "volumePath" ],
                predicates.records.record
                {
                  fsType = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  storagePolicyID = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
                  storagePolicyName = predicates.anyOf
                      [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes
    "%
    | optional,
}