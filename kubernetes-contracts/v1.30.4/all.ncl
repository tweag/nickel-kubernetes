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
predicates.contract_from_predicate
(predicates.oneOf
[
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "valueExpression" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      valueExpression = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "fieldRef", "warning" ],
    predicates.records.record
    {
      fieldRef = predicates.isType '"String",
      warning = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      excludeResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchPolicy = predicates.isType '"String",
      namespaceSelector = definitions.predicate.always,
      objectSelector = definitions.predicate.always,
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "admissionReviewVersions", "clientConfig", "name", "sideEffects" ],
    predicates.records.record
    {
      admissionReviewVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      clientConfig = definitions.predicate.always,
      failurePolicy = predicates.isType '"String",
      matchConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchPolicy = predicates.isType '"String",
      name = predicates.isType '"String",
      namespaceSelector = definitions.predicate.always,
      objectSelector = definitions.predicate.always,
      reinvocationPolicy = predicates.isType '"String",
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      sideEffects = predicates.isType '"String",
      timeoutSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "MutatingWebhookConfiguration" ]
          ],
      metadata = definitions.predicate.always,
      webhooks = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "MutatingWebhookConfigurationList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      apiVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      operations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resourceNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      scope = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      parameterNotFoundAction = predicates.isType '"String",
      selector = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      apiVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      operations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      scope = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "namespace" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      path = predicates.isType '"String",
      port = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      expressionWarnings = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicy" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBinding" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBindingList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchResources = definitions.predicate.always,
      paramRef = definitions.predicate.always,
      policyName = predicates.isType '"String",
      validationActions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      auditAnnotations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      failurePolicy = predicates.isType '"String",
      matchConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchConstraints = definitions.predicate.always,
      paramKind = definitions.predicate.always,
      validations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      variables = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      observedGeneration = predicates.isType 'Integer,
      typeChecking = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "admissionReviewVersions", "clientConfig", "name", "sideEffects" ],
    predicates.records.record
    {
      admissionReviewVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      clientConfig = definitions.predicate.always,
      failurePolicy = predicates.isType '"String",
      matchConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchPolicy = predicates.isType '"String",
      name = predicates.isType '"String",
      namespaceSelector = definitions.predicate.always,
      objectSelector = definitions.predicate.always,
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      sideEffects = predicates.isType '"String",
      timeoutSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingWebhookConfiguration" ]
          ],
      metadata = definitions.predicate.always,
      webhooks = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingWebhookConfigurationList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      message = predicates.isType '"String",
      messageExpression = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      caBundle = predicates.isType '"String",
      service = definitions.predicate.always,
      url = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "valueExpression" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      valueExpression = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "fieldRef", "warning" ],
    predicates.records.record
    {
      fieldRef = predicates.isType '"String",
      warning = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      excludeResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchPolicy = predicates.isType '"String",
      namespaceSelector = definitions.predicate.always,
      objectSelector = definitions.predicate.always,
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      apiVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      operations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resourceNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      scope = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      parameterNotFoundAction = predicates.isType '"String",
      selector = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      expressionWarnings = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicy" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBinding" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBindingList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchResources = definitions.predicate.always,
      paramRef = definitions.predicate.always,
      policyName = predicates.isType '"String",
      validationActions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      auditAnnotations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      failurePolicy = predicates.isType '"String",
      matchConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchConstraints = definitions.predicate.always,
      paramKind = definitions.predicate.always,
      validations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      variables = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      observedGeneration = predicates.isType 'Integer,
      typeChecking = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      message = predicates.isType '"String",
      messageExpression = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "valueExpression" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      valueExpression = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "fieldRef", "warning" ],
    predicates.records.record
    {
      fieldRef = predicates.isType '"String",
      warning = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      excludeResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchPolicy = predicates.isType '"String",
      namespaceSelector = definitions.predicate.always,
      objectSelector = definitions.predicate.always,
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      apiVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      operations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resourceNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      scope = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      parameterNotFoundAction = predicates.isType '"String",
      selector = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      expressionWarnings = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicy" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBinding" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyBindingList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchResources = definitions.predicate.always,
      paramRef = definitions.predicate.always,
      policyName = predicates.isType '"String",
      validationActions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ValidatingAdmissionPolicyList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      auditAnnotations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      failurePolicy = predicates.isType '"String",
      matchConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchConstraints = definitions.predicate.always,
      paramKind = definitions.predicate.always,
      validations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      variables = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      observedGeneration = predicates.isType 'Integer,
      typeChecking = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      message = predicates.isType '"String",
      messageExpression = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expression", "name" ],
    predicates.records.record
    {
      expression = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiServerID = predicates.isType '"String",
      decodableVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      encodingVersion = predicates.isType '"String",
      servedVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec", "status" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "StorageVersion" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "message", "reason", "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      observedGeneration = predicates.isType 'Integer,
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "StorageVersionList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType 'Record,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      commonEncodingVersion = predicates.isType '"String",
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      storageVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "revision" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      data = definitions.predicate.always,
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ControllerRevision" ]
          ],
      metadata = definitions.predicate.always,
      revision = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ControllerRevisionList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "DaemonSet" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "DaemonSetList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector", "template" ],
    predicates.records.record
    {
      minReadySeconds = predicates.isType 'Integer,
      revisionHistoryLimit = predicates.isType 'Integer,
      selector = definitions.predicate.always,
      template = definitions.predicate.always,
      updateStrategy = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [
      "currentNumberScheduled",
      "desiredNumberScheduled",
      "numberMisscheduled",
      "numberReady"
    ],
    predicates.records.record
    {
      collisionCount = predicates.isType 'Integer,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentNumberScheduled = predicates.isType 'Integer,
      desiredNumberScheduled = predicates.isType 'Integer,
      numberAvailable = predicates.isType 'Integer,
      numberMisscheduled = predicates.isType 'Integer,
      numberReady = predicates.isType 'Integer,
      numberUnavailable = predicates.isType 'Integer,
      observedGeneration = predicates.isType 'Integer,
      updatedNumberScheduled = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      rollingUpdate = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Deployment" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      lastUpdateTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "DeploymentList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector", "template" ],
    predicates.records.record
    {
      minReadySeconds = predicates.isType 'Integer,
      paused = predicates.isType '"Bool",
      progressDeadlineSeconds = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
      revisionHistoryLimit = predicates.isType 'Integer,
      selector = definitions.predicate.always,
      strategy = definitions.predicate.always,
      template = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      availableReplicas = predicates.isType 'Integer,
      collisionCount = predicates.isType 'Integer,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      observedGeneration = predicates.isType 'Integer,
      readyReplicas = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
      unavailableReplicas = predicates.isType 'Integer,
      updatedReplicas = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      rollingUpdate = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ReplicaSet" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ReplicaSetList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector" ],
    predicates.records.record
    {
      minReadySeconds = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
      selector = definitions.predicate.always,
      template = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "replicas" ],
    predicates.records.record
    {
      availableReplicas = predicates.isType 'Integer,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      fullyLabeledReplicas = predicates.isType 'Integer,
      observedGeneration = predicates.isType 'Integer,
      readyReplicas = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      maxSurge = definitions.predicate.always,
      maxUnavailable = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      maxSurge = definitions.predicate.always,
      maxUnavailable = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      maxUnavailable = definitions.predicate.always,
      partition = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "StatefulSet" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "StatefulSetList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { start = predicates.isType 'Integer, } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      whenDeleted = predicates.isType '"String",
      whenScaled = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector", "serviceName", "template" ],
    predicates.records.record
    {
      minReadySeconds = predicates.isType 'Integer,
      ordinals = definitions.predicate.always,
      persistentVolumeClaimRetentionPolicy = definitions.predicate.always,
      podManagementPolicy = predicates.isType '"String",
      replicas = predicates.isType 'Integer,
      revisionHistoryLimit = predicates.isType 'Integer,
      selector = definitions.predicate.always,
      serviceName = predicates.isType '"String",
      template = definitions.predicate.always,
      updateStrategy = definitions.predicate.always,
      volumeClaimTemplates = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "replicas" ],
    predicates.records.record
    {
      availableReplicas = predicates.isType 'Integer,
      collisionCount = predicates.isType 'Integer,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentReplicas = predicates.isType 'Integer,
      currentRevision = predicates.isType '"String",
      observedGeneration = predicates.isType 'Integer,
      readyReplicas = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
      updateRevision = predicates.isType '"String",
      updatedReplicas = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      rollingUpdate = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SelfSubjectReview" ]
          ],
      metadata = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { userInfo = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "TokenRequest" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "audiences" ],
    predicates.records.record
    {
      audiences = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      boundObjectRef = definitions.predicate.always,
      expirationSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "expirationTimestamp", "token" ],
    predicates.records.record
    {
      expirationTimestamp = definitions.predicate.always,
      token = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "TokenReview" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      audiences = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      token = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      audiences = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      authenticated = predicates.isType '"Bool",
      error = predicates.isType '"String",
      user = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      extra = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.allOf
            [
              predicates.isType '"Array",
              predicates.arrays.arrayOf (predicates.isType '"String")
            ])
          ],
      groups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      uid = predicates.isType '"String",
      username = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SelfSubjectReview" ]
          ],
      metadata = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { userInfo = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SelfSubjectReview" ]
          ],
      metadata = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { userInfo = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "LocalSubjectAccessReview" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { path = predicates.isType '"String", verb = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "verbs" ],
    predicates.records.record
    {
      nonResourceURLs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      group = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      resource = predicates.isType '"String",
      subresource = predicates.isType '"String",
      verb = predicates.isType '"String",
      version = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "verbs" ],
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resourceNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SelfSubjectAccessReview" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      nonResourceAttributes = definitions.predicate.always,
      resourceAttributes = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SelfSubjectRulesReview" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { namespace = predicates.isType '"String", } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "SubjectAccessReview" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      extra = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.allOf
            [
              predicates.isType '"Array",
              predicates.arrays.arrayOf (predicates.isType '"String")
            ])
          ],
      groups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      nonResourceAttributes = definitions.predicate.always,
      resourceAttributes = definitions.predicate.always,
      uid = predicates.isType '"String",
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "allowed" ],
    predicates.records.record
    {
      allowed = predicates.isType '"Bool",
      denied = predicates.isType '"Bool",
      evaluationError = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "incomplete", "nonResourceRules", "resourceRules" ],
    predicates.records.record
    {
      evaluationError = predicates.isType '"String",
      incomplete = predicates.isType '"Bool",
      nonResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "HorizontalPodAutoscaler" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "HorizontalPodAutoscalerList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "maxReplicas", "scaleTargetRef" ],
    predicates.records.record
    {
      maxReplicas = predicates.isType 'Integer,
      minReplicas = predicates.isType 'Integer,
      scaleTargetRef = definitions.predicate.always,
      targetCPUUtilizationPercentage = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "currentReplicas", "desiredReplicas" ],
    predicates.records.record
    {
      currentCPUUtilizationPercentage = predicates.isType 'Integer,
      currentReplicas = predicates.isType 'Integer,
      desiredReplicas = predicates.isType 'Integer,
      lastScaleTime = definitions.predicate.always,
      observedGeneration = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Scale" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { replicas = predicates.isType 'Integer, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "replicas" ],
    predicates.records.record
    {
      replicas = predicates.isType 'Integer,
      selector = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "container", "name", "target" ],
    predicates.records.record
    {
      container = predicates.isType '"String",
      name = predicates.isType '"String",
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "container", "current", "name" ],
    predicates.records.record
    {
      container = predicates.isType '"String",
      current = definitions.predicate.always,
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "metric", "target" ],
    predicates.records.record
    {
      metric = definitions.predicate.always,
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "current", "metric" ],
    predicates.records.record
    {
      current = definitions.predicate.always,
      metric = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "periodSeconds", "type", "value" ],
    predicates.records.record
    {
      periodSeconds = predicates.isType 'Integer,
      type = predicates.isType '"String",
      value = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      policies = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      selectPolicy = predicates.isType '"String",
      stabilizationWindowSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "HorizontalPodAutoscaler" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      scaleDown = definitions.predicate.always,
      scaleUp = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "HorizontalPodAutoscalerList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "maxReplicas", "scaleTargetRef" ],
    predicates.records.record
    {
      behavior = definitions.predicate.always,
      maxReplicas = predicates.isType 'Integer,
      metrics = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      minReplicas = predicates.isType 'Integer,
      scaleTargetRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "desiredReplicas" ],
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentMetrics = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentReplicas = predicates.isType 'Integer,
      desiredReplicas = predicates.isType 'Integer,
      lastScaleTime = definitions.predicate.always,
      observedGeneration = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      selector = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      containerResource = definitions.predicate.always,
      external = definitions.predicate.always,
      object = definitions.predicate.always,
      pods = definitions.predicate.always,
      resource = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      containerResource = definitions.predicate.always,
      external = definitions.predicate.always,
      object = definitions.predicate.always,
      pods = definitions.predicate.always,
      resource = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      averageUtilization = predicates.isType 'Integer,
      averageValue = definitions.predicate.always,
      type = predicates.isType '"String",
      value = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      averageUtilization = predicates.isType 'Integer,
      averageValue = definitions.predicate.always,
      value = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "describedObject", "metric", "target" ],
    predicates.records.record
    {
      describedObject = definitions.predicate.always,
      metric = definitions.predicate.always,
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "current", "describedObject", "metric" ],
    predicates.records.record
    {
      current = definitions.predicate.always,
      describedObject = definitions.predicate.always,
      metric = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "metric", "target" ],
    predicates.records.record
    {
      metric = definitions.predicate.always,
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "current", "metric" ],
    predicates.records.record
    {
      current = definitions.predicate.always,
      metric = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "target" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "current", "name" ],
    predicates.records.record
    {
      current = definitions.predicate.always,
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CronJob" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CronJobList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "jobTemplate", "schedule" ],
    predicates.records.record
    {
      concurrencyPolicy = predicates.isType '"String",
      failedJobsHistoryLimit = predicates.isType 'Integer,
      jobTemplate = definitions.predicate.always,
      schedule = predicates.isType '"String",
      startingDeadlineSeconds = predicates.isType 'Integer,
      successfulJobsHistoryLimit = predicates.isType 'Integer,
      suspend = predicates.isType '"Bool",
      timeZone = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      active = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      lastScheduleTime = definitions.predicate.always,
      lastSuccessfulTime = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Job" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastProbeTime = definitions.predicate.always,
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "JobList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "template" ],
    predicates.records.record
    {
      activeDeadlineSeconds = predicates.isType 'Integer,
      backoffLimit = predicates.isType 'Integer,
      backoffLimitPerIndex = predicates.isType 'Integer,
      completionMode = predicates.isType '"String",
      completions = predicates.isType 'Integer,
      managedBy = predicates.isType '"String",
      manualSelector = predicates.isType '"Bool",
      maxFailedIndexes = predicates.isType 'Integer,
      parallelism = predicates.isType 'Integer,
      podFailurePolicy = definitions.predicate.always,
      podReplacementPolicy = predicates.isType '"String",
      selector = definitions.predicate.always,
      successPolicy = definitions.predicate.always,
      suspend = predicates.isType '"Bool",
      template = definitions.predicate.always,
      ttlSecondsAfterFinished = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      active = predicates.isType 'Integer,
      completedIndexes = predicates.isType '"String",
      completionTime = definitions.predicate.always,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      failed = predicates.isType 'Integer,
      failedIndexes = predicates.isType '"String",
      ready = predicates.isType 'Integer,
      startTime = definitions.predicate.always,
      succeeded = predicates.isType 'Integer,
      terminating = predicates.isType 'Integer,
      uncountedTerminatedPods = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "rules" ],
    predicates.records.record
    {
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "operator", "values" ],
    predicates.records.record
    {
      containerName = predicates.isType '"String",
      operator = predicates.isType '"String",
      values = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType 'Integer)
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "action" ],
    predicates.records.record
    {
      action = predicates.isType '"String",
      onExitCodes = definitions.predicate.always,
      onPodConditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "rules" ],
    predicates.records.record
    {
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      succeededCount = predicates.isType 'Integer,
      succeededIndexes = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      failed = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      succeeded = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CertificateSigningRequest" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      lastUpdateTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CertificateSigningRequestList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "request", "signerName" ],
    predicates.records.record
    {
      expirationSeconds = predicates.isType 'Integer,
      extra = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.allOf
            [
              predicates.isType '"Array",
              predicates.arrays.arrayOf (predicates.isType '"String")
            ])
          ],
      groups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      request = predicates.isType '"String",
      signerName = predicates.isType '"String",
      uid = predicates.isType '"String",
      usages = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      username = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      certificate = predicates.isType '"String",
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ClusterTrustBundle" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ClusterTrustBundleList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "trustBundle" ],
    predicates.records.record
    {
      signerName = predicates.isType '"String",
      trustBundle = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Lease" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "LeaseList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      acquireTime = definitions.predicate.always,
      holderIdentity = predicates.isType '"String",
      leaseDurationSeconds = predicates.isType 'Integer,
      leaseTransitions = predicates.isType 'Integer,
      renewTime = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "volumeID" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      partition = predicates.isType 'Integer,
      readOnly = predicates.isType '"Bool",
      volumeID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      nodeAffinity = definitions.predicate.always,
      podAffinity = definitions.predicate.always,
      podAntiAffinity = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      localhostProfile = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "devicePath", "name" ],
    predicates.records.record
    {
      devicePath = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "diskName", "diskURI" ],
    predicates.records.record
    {
      cachingMode = predicates.isType '"String",
      diskName = predicates.isType '"String",
      diskURI = predicates.isType '"String",
      fsType = predicates.isType '"String",
      kind = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "secretName", "shareName" ],
    predicates.records.record
    {
      readOnly = predicates.isType '"Bool",
      secretName = predicates.isType '"String",
      secretNamespace = predicates.isType '"String",
      shareName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "secretName", "shareName" ],
    predicates.records.record
    {
      readOnly = predicates.isType '"Bool",
      secretName = predicates.isType '"String",
      shareName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "target" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Binding" ] ],
      metadata = definitions.predicate.always,
      target = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driver", "volumeHandle" ],
    predicates.records.record
    {
      controllerExpandSecretRef = definitions.predicate.always,
      controllerPublishSecretRef = definitions.predicate.always,
      driver = predicates.isType '"String",
      fsType = predicates.isType '"String",
      nodeExpandSecretRef = definitions.predicate.always,
      nodePublishSecretRef = definitions.predicate.always,
      nodeStageSecretRef = definitions.predicate.always,
      readOnly = predicates.isType '"Bool",
      volumeAttributes = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      volumeHandle = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driver" ],
    predicates.records.record
    {
      driver = predicates.isType '"String",
      fsType = predicates.isType '"String",
      nodePublishSecretRef = definitions.predicate.always,
      readOnly = predicates.isType '"Bool",
      volumeAttributes = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      add = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      drop = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "monitors" ],
    predicates.records.record
    {
      monitors = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      path = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretFile = predicates.isType '"String",
      secretRef = definitions.predicate.always,
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "monitors" ],
    predicates.records.record
    {
      monitors = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      path = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretFile = predicates.isType '"String",
      secretRef = definitions.predicate.always,
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "volumeID" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      volumeID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "volumeID" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      volumeID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      resourceClaimName = predicates.isType '"String",
      resourceClaimTemplateName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { timeoutSeconds = predicates.isType 'Integer, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path" ],
    predicates.records.record
    {
      labelSelector = definitions.predicate.always,
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
      path = predicates.isType '"String",
      signerName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      error = predicates.isType '"String",
      message = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ComponentStatus" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ComponentStatusList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      binaryData = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      data = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      immutable = predicates.isType '"Bool",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ConfigMap" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ConfigMapList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kubeletConfigKey", "name", "namespace" ],
    predicates.records.record
    {
      kubeletConfigKey = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      resourceVersion = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      defaultMode = predicates.isType 'Integer,
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      args = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      command = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      env = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      envFrom = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      image = predicates.isType '"String",
      imagePullPolicy = predicates.isType '"String",
      lifecycle = definitions.predicate.always,
      livenessProbe = definitions.predicate.always,
      name = predicates.isType '"String",
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      readinessProbe = definitions.predicate.always,
      resizePolicy = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resources = definitions.predicate.always,
      restartPolicy = predicates.isType '"String",
      securityContext = definitions.predicate.always,
      startupProbe = definitions.predicate.always,
      stdin = predicates.isType '"Bool",
      stdinOnce = predicates.isType '"Bool",
      terminationMessagePath = predicates.isType '"String",
      terminationMessagePolicy = predicates.isType '"String",
      tty = predicates.isType '"Bool",
      volumeDevices = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumeMounts = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      workingDir = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      names = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      sizeBytes = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "containerPort" ],
    predicates.records.record
    {
      containerPort = predicates.isType 'Integer,
      hostIP = predicates.isType '"String",
      hostPort = predicates.isType 'Integer,
      name = predicates.isType '"String",
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "resourceName", "restartPolicy" ],
    predicates.records.record
    {
      resourceName = predicates.isType '"String",
      restartPolicy = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      running = definitions.predicate.always,
      terminated = definitions.predicate.always,
      waiting = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { startedAt = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "exitCode" ],
    predicates.records.record
    {
      containerID = predicates.isType '"String",
      exitCode = predicates.isType 'Integer,
      finishedAt = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      signal = predicates.isType 'Integer,
      startedAt = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "image", "imageID", "name", "ready", "restartCount" ],
    predicates.records.record
    {
      allocatedResources = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      containerID = predicates.isType '"String",
      image = predicates.isType '"String",
      imageID = predicates.isType '"String",
      lastState = definitions.predicate.always,
      name = predicates.isType '"String",
      ready = predicates.isType '"Bool",
      resources = definitions.predicate.always,
      restartCount = predicates.isType 'Integer,
      started = predicates.isType '"Bool",
      state = definitions.predicate.always,
      volumeMounts = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "Port" ],
    predicates.records.record { Port = predicates.isType 'Integer, } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path" ],
    predicates.records.record
    {
      fieldRef = definitions.predicate.always,
      mode = predicates.isType 'Integer,
      path = predicates.isType '"String",
      resourceFieldRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      defaultMode = predicates.isType 'Integer,
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      medium = predicates.isType '"String",
      sizeLimit = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "ip" ],
    predicates.records.record
    {
      hostname = predicates.isType '"String",
      ip = predicates.isType '"String",
      nodeName = predicates.isType '"String",
      targetRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port" ],
    predicates.records.record
    {
      appProtocol = predicates.isType '"String",
      name = predicates.isType '"String",
      port = predicates.isType 'Integer,
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      addresses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      notReadyAddresses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Endpoints" ] ],
      metadata = definitions.predicate.always,
      subsets = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "EndpointsList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      configMapRef = definitions.predicate.always,
      prefix = predicates.isType '"String",
      secretRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      value = predicates.isType '"String",
      valueFrom = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      configMapKeyRef = definitions.predicate.always,
      fieldRef = definitions.predicate.always,
      resourceFieldRef = definitions.predicate.always,
      secretKeyRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      args = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      command = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      env = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      envFrom = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      image = predicates.isType '"String",
      imagePullPolicy = predicates.isType '"String",
      lifecycle = definitions.predicate.always,
      livenessProbe = definitions.predicate.always,
      name = predicates.isType '"String",
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      readinessProbe = definitions.predicate.always,
      resizePolicy = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resources = definitions.predicate.always,
      restartPolicy = predicates.isType '"String",
      securityContext = definitions.predicate.always,
      startupProbe = definitions.predicate.always,
      stdin = predicates.isType '"Bool",
      stdinOnce = predicates.isType '"Bool",
      targetContainerName = predicates.isType '"String",
      terminationMessagePath = predicates.isType '"String",
      terminationMessagePolicy = predicates.isType '"String",
      tty = predicates.isType '"Bool",
      volumeDevices = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumeMounts = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      workingDir = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { volumeClaimTemplate = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "involvedObject", "metadata" ],
    predicates.records.record
    {
      action = predicates.isType '"String",
      apiVersion = predicates.isType '"String",
      count = predicates.isType 'Integer,
      eventTime = definitions.predicate.always,
      firstTimestamp = definitions.predicate.always,
      involvedObject = definitions.predicate.always,
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Event" ] ],
      lastTimestamp = definitions.predicate.always,
      message = predicates.isType '"String",
      metadata = definitions.predicate.always,
      reason = predicates.isType '"String",
      related = definitions.predicate.always,
      reportingComponent = predicates.isType '"String",
      reportingInstance = predicates.isType '"String",
      series = definitions.predicate.always,
      source = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "EventList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      count = predicates.isType 'Integer,
      lastObservedTime = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      component = predicates.isType '"String",
      host = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      command = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      lun = predicates.isType 'Integer,
      readOnly = predicates.isType '"Bool",
      targetWWNs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      wwids = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driver" ],
    predicates.records.record
    {
      driver = predicates.isType '"String",
      fsType = predicates.isType '"String",
      options = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driver" ],
    predicates.records.record
    {
      driver = predicates.isType '"String",
      fsType = predicates.isType '"String",
      options = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      datasetName = predicates.isType '"String",
      datasetUUID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "pdName" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      partition = predicates.isType 'Integer,
      pdName = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port" ],
    predicates.records.record
    {
      port = predicates.isType 'Integer,
      service = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "repository" ],
    predicates.records.record
    {
      directory = predicates.isType '"String",
      repository = predicates.isType '"String",
      revision = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "endpoints", "path" ],
    predicates.records.record
    {
      endpoints = predicates.isType '"String",
      endpointsNamespace = predicates.isType '"String",
      path = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "endpoints", "path" ],
    predicates.records.record
    {
      endpoints = predicates.isType '"String",
      path = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port" ],
    predicates.records.record
    {
      host = predicates.isType '"String",
      httpHeaders = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      path = predicates.isType '"String",
      port = definitions.predicate.always,
      scheme = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "value" ],
    predicates.records.record
    { name = predicates.isType '"String", value = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "ip" ],
    predicates.records.record
    {
      hostnames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      ip = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { ip = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path" ],
    predicates.records.record
    { path = predicates.isType '"String", type = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "iqn", "lun", "targetPortal" ],
    predicates.records.record
    {
      chapAuthDiscovery = predicates.isType '"Bool",
      chapAuthSession = predicates.isType '"Bool",
      fsType = predicates.isType '"String",
      initiatorName = predicates.isType '"String",
      iqn = predicates.isType '"String",
      iscsiInterface = predicates.isType '"String",
      lun = predicates.isType 'Integer,
      portals = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      targetPortal = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "iqn", "lun", "targetPortal" ],
    predicates.records.record
    {
      chapAuthDiscovery = predicates.isType '"Bool",
      chapAuthSession = predicates.isType '"Bool",
      fsType = predicates.isType '"String",
      initiatorName = predicates.isType '"String",
      iqn = predicates.isType '"String",
      iscsiInterface = predicates.isType '"String",
      lun = predicates.isType 'Integer,
      portals = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      targetPortal = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "path" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      mode = predicates.isType 'Integer,
      path = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      postStart = definitions.predicate.always,
      preStop = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      exec = definitions.predicate.always,
      httpGet = definitions.predicate.always,
      sleep = definitions.predicate.always,
      tcpSocket = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "LimitRange" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      "default" = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      defaultRequest = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      max = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      maxLimitRequestRatio = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      min = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "LimitRangeList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "limits" ],
    predicates.records.record
    {
      limits = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      hostname = predicates.isType '"String",
      ip = predicates.isType '"String",
      ipMode = predicates.isType '"String",
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      ingress = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      path = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status" ],
    predicates.records.record
    {
      status = predicates.isType '"String",
      targetVolumeAttributesClassName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path", "server" ],
    predicates.records.record
    {
      path = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      server = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Namespace" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "NamespaceList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      finalizers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      phase = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Node" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "address", "type" ],
    predicates.records.record
    {
      address = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      preferredDuringSchedulingIgnoredDuringExecution = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      requiredDuringSchedulingIgnoredDuringExecution =
        definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastHeartbeatTime = definitions.predicate.always,
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { configMap = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      active = definitions.predicate.always,
      assigned = definitions.predicate.always,
      error = predicates.isType '"String",
      lastKnownGood = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { kubeletEndpoint = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "NodeList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      features = definitions.predicate.always,
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { recursiveReadOnlyMounts = predicates.isType '"Bool", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "nodeSelectorTerms" ],
    predicates.records.record
    {
      nodeSelectorTerms = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "operator" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      operator = predicates.isType '"String",
      values = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchExpressions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchFields = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      configSource = definitions.predicate.always,
      externalID = predicates.isType '"String",
      podCIDR = predicates.isType '"String",
      podCIDRs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      providerID = predicates.isType '"String",
      taints = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      unschedulable = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      addresses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      allocatable = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      capacity = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      config = definitions.predicate.always,
      daemonEndpoints = definitions.predicate.always,
      images = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      nodeInfo = definitions.predicate.always,
      phase = predicates.isType '"String",
      runtimeHandlers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumesAttached = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumesInUse = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [
      "architecture",
      "bootID",
      "containerRuntimeVersion",
      "kernelVersion",
      "kubeProxyVersion",
      "kubeletVersion",
      "machineID",
      "operatingSystem",
      "osImage",
      "systemUUID"
    ],
    predicates.records.record
    {
      architecture = predicates.isType '"String",
      bootID = predicates.isType '"String",
      containerRuntimeVersion = predicates.isType '"String",
      kernelVersion = predicates.isType '"String",
      kubeProxyVersion = predicates.isType '"String",
      kubeletVersion = predicates.isType '"String",
      machineID = predicates.isType '"String",
      operatingSystem = predicates.isType '"String",
      osImage = predicates.isType '"String",
      systemUUID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "fieldPath" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      fieldPath = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      fieldPath = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      resourceVersion = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PersistentVolume" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PersistentVolumeClaim" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastProbeTime = definitions.predicate.always,
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PersistentVolumeClaimList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      accessModes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      dataSource = definitions.predicate.always,
      dataSourceRef = definitions.predicate.always,
      resources = definitions.predicate.always,
      selector = definitions.predicate.always,
      storageClassName = predicates.isType '"String",
      volumeAttributesClassName = predicates.isType '"String",
      volumeMode = predicates.isType '"String",
      volumeName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      accessModes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      allocatedResourceStatuses = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      allocatedResources = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      capacity = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentVolumeAttributesClassName = predicates.isType '"String",
      modifyVolumeStatus = definitions.predicate.always,
      phase = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "claimName" ],
    predicates.records.record
    {
      claimName = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PersistentVolumeList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      accessModes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      awsElasticBlockStore = definitions.predicate.always,
      azureDisk = definitions.predicate.always,
      azureFile = definitions.predicate.always,
      capacity = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      cephfs = definitions.predicate.always,
      cinder = definitions.predicate.always,
      claimRef = definitions.predicate.always,
      csi = definitions.predicate.always,
      fc = definitions.predicate.always,
      flexVolume = definitions.predicate.always,
      flocker = definitions.predicate.always,
      gcePersistentDisk = definitions.predicate.always,
      glusterfs = definitions.predicate.always,
      hostPath = definitions.predicate.always,
      iscsi = definitions.predicate.always,
      local = definitions.predicate.always,
      mountOptions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      nfs = definitions.predicate.always,
      nodeAffinity = definitions.predicate.always,
      persistentVolumeReclaimPolicy = predicates.isType '"String",
      photonPersistentDisk = definitions.predicate.always,
      portworxVolume = definitions.predicate.always,
      quobyte = definitions.predicate.always,
      rbd = definitions.predicate.always,
      scaleIO = definitions.predicate.always,
      storageClassName = predicates.isType '"String",
      storageos = definitions.predicate.always,
      volumeAttributesClassName = predicates.isType '"String",
      volumeMode = predicates.isType '"String",
      vsphereVolume = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lastPhaseTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      phase = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "pdID" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      pdID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Pod" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      preferredDuringSchedulingIgnoredDuringExecution = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      requiredDuringSchedulingIgnoredDuringExecution = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "topologyKey" ],
    predicates.records.record
    {
      labelSelector = definitions.predicate.always,
      matchLabelKeys = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      mismatchLabelKeys = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      namespaceSelector = definitions.predicate.always,
      namespaces = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      topologyKey = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      preferredDuringSchedulingIgnoredDuringExecution = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      requiredDuringSchedulingIgnoredDuringExecution = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastProbeTime = definitions.predicate.always,
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      nameservers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      options = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      searches = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { name = predicates.isType '"String", value = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { ip = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "PodList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "conditionType" ],
    predicates.records.record { conditionType = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      source = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      resourceClaimName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      appArmorProfile = definitions.predicate.always,
      fsGroup = predicates.isType 'Integer,
      fsGroupChangePolicy = predicates.isType '"String",
      runAsGroup = predicates.isType 'Integer,
      runAsNonRoot = predicates.isType '"Bool",
      runAsUser = predicates.isType 'Integer,
      seLinuxOptions = definitions.predicate.always,
      seccompProfile = definitions.predicate.always,
      supplementalGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType 'Integer)
          ],
      sysctls = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      windowsOptions = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "containers" ],
    predicates.records.record
    {
      activeDeadlineSeconds = predicates.isType 'Integer,
      affinity = definitions.predicate.always,
      automountServiceAccountToken = predicates.isType '"Bool",
      containers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      dnsConfig = definitions.predicate.always,
      dnsPolicy = predicates.isType '"String",
      enableServiceLinks = predicates.isType '"Bool",
      ephemeralContainers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      hostAliases = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      hostIPC = predicates.isType '"Bool",
      hostNetwork = predicates.isType '"Bool",
      hostPID = predicates.isType '"Bool",
      hostUsers = predicates.isType '"Bool",
      hostname = predicates.isType '"String",
      imagePullSecrets = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      initContainers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      nodeName = predicates.isType '"String",
      nodeSelector = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      os = definitions.predicate.always,
      overhead = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      preemptionPolicy = predicates.isType '"String",
      "priority" = predicates.isType 'Integer,
      priorityClassName = predicates.isType '"String",
      readinessGates = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceClaims = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      restartPolicy = predicates.isType '"String",
      runtimeClassName = predicates.isType '"String",
      schedulerName = predicates.isType '"String",
      schedulingGates = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      securityContext = definitions.predicate.always,
      serviceAccount = predicates.isType '"String",
      serviceAccountName = predicates.isType '"String",
      setHostnameAsFQDN = predicates.isType '"Bool",
      shareProcessNamespace = predicates.isType '"Bool",
      subdomain = predicates.isType '"String",
      terminationGracePeriodSeconds = predicates.isType 'Integer,
      tolerations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      topologySpreadConstraints = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      containerStatuses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      ephemeralContainerStatuses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      hostIP = predicates.isType '"String",
      hostIPs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      initContainerStatuses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      message = predicates.isType '"String",
      nominatedNodeName = predicates.isType '"String",
      phase = predicates.isType '"String",
      podIP = predicates.isType '"String",
      podIPs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      qosClass = predicates.isType '"String",
      reason = predicates.isType '"String",
      resize = predicates.isType '"String",
      resourceClaimStatuses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      startTime = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "PodTemplate" ] ],
      metadata = definitions.predicate.always,
      template = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PodTemplateList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port", "protocol" ],
    predicates.records.record
    {
      error = predicates.isType '"String",
      port = predicates.isType 'Integer,
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "volumeID" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      volumeID = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "preference", "weight" ],
    predicates.records.record
    {
      preference = definitions.predicate.always,
      weight = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      exec = definitions.predicate.always,
      failureThreshold = predicates.isType 'Integer,
      grpc = definitions.predicate.always,
      httpGet = definitions.predicate.always,
      initialDelaySeconds = predicates.isType 'Integer,
      periodSeconds = predicates.isType 'Integer,
      successThreshold = predicates.isType 'Integer,
      tcpSocket = definitions.predicate.always,
      terminationGracePeriodSeconds = predicates.isType 'Integer,
      timeoutSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      defaultMode = predicates.isType 'Integer,
      sources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "registry", "volume" ],
    predicates.records.record
    {
      group = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      registry = predicates.isType '"String",
      tenant = predicates.isType '"String",
      user = predicates.isType '"String",
      volume = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "image", "monitors" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      image = predicates.isType '"String",
      keyring = predicates.isType '"String",
      monitors = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      pool = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "image", "monitors" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      image = predicates.isType '"String",
      keyring = predicates.isType '"String",
      monitors = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      pool = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ReplicationController" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ReplicationControllerList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      minReadySeconds = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
      selector = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      template = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "replicas" ],
    predicates.records.record
    {
      availableReplicas = predicates.isType 'Integer,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      fullyLabeledReplicas = predicates.isType 'Integer,
      observedGeneration = predicates.isType 'Integer,
      readyReplicas = predicates.isType 'Integer,
      replicas = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "resource" ],
    predicates.records.record
    {
      containerName = predicates.isType '"String",
      divisor = definitions.predicate.always,
      resource = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ResourceQuota" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceQuotaList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      hard = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      scopeSelector = definitions.predicate.always,
      scopes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      hard = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      used = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      claims = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      limits = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      requests = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      level = predicates.isType '"String",
      role = predicates.isType '"String",
      type = predicates.isType '"String",
      user = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "gateway", "secretRef", "system" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      gateway = predicates.isType '"String",
      protectionDomain = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      sslEnabled = predicates.isType '"Bool",
      storageMode = predicates.isType '"String",
      storagePool = predicates.isType '"String",
      system = predicates.isType '"String",
      volumeName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "gateway", "secretRef", "system" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      gateway = predicates.isType '"String",
      protectionDomain = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      sslEnabled = predicates.isType '"Bool",
      storageMode = predicates.isType '"String",
      storagePool = predicates.isType '"String",
      system = predicates.isType '"String",
      volumeName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchExpressions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "operator", "scopeName" ],
    predicates.records.record
    {
      operator = predicates.isType '"String",
      scopeName = predicates.isType '"String",
      values = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      localhostProfile = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      data = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      immutable = predicates.isType '"Bool",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Secret" ] ],
      metadata = definitions.predicate.always,
      stringData = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "SecretList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      name = predicates.isType '"String",
      "optional" = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      defaultMode = predicates.isType 'Integer,
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      "optional" = predicates.isType '"Bool",
      secretName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      allowPrivilegeEscalation = predicates.isType '"Bool",
      appArmorProfile = definitions.predicate.always,
      capabilities = definitions.predicate.always,
      privileged = predicates.isType '"Bool",
      procMount = predicates.isType '"String",
      readOnlyRootFilesystem = predicates.isType '"Bool",
      runAsGroup = predicates.isType 'Integer,
      runAsNonRoot = predicates.isType '"Bool",
      runAsUser = predicates.isType 'Integer,
      seLinuxOptions = definitions.predicate.always,
      seccompProfile = definitions.predicate.always,
      windowsOptions = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Service" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      automountServiceAccountToken = predicates.isType '"Bool",
      imagePullSecrets = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ServiceAccount" ] ],
      metadata = definitions.predicate.always,
      secrets = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ServiceAccountList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "path" ],
    predicates.records.record
    {
      audience = predicates.isType '"String",
      expirationSeconds = predicates.isType 'Integer,
      path = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ServiceList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port" ],
    predicates.records.record
    {
      appProtocol = predicates.isType '"String",
      name = predicates.isType '"String",
      nodePort = predicates.isType 'Integer,
      port = predicates.isType 'Integer,
      protocol = predicates.isType '"String",
      targetPort = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      allocateLoadBalancerNodePorts = predicates.isType '"Bool",
      clusterIP = predicates.isType '"String",
      clusterIPs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      externalIPs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      externalName = predicates.isType '"String",
      externalTrafficPolicy = predicates.isType '"String",
      healthCheckNodePort = predicates.isType 'Integer,
      internalTrafficPolicy = predicates.isType '"String",
      ipFamilies = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      ipFamilyPolicy = predicates.isType '"String",
      loadBalancerClass = predicates.isType '"String",
      loadBalancerIP = predicates.isType '"String",
      loadBalancerSourceRanges = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      publishNotReadyAddresses = predicates.isType '"Bool",
      selector = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      sessionAffinity = predicates.isType '"String",
      sessionAffinityConfig = definitions.predicate.always,
      trafficDistribution = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      loadBalancer = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { clientIP = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "seconds" ],
    predicates.records.record { seconds = predicates.isType 'Integer, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      volumeName = predicates.isType '"String",
      volumeNamespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      secretRef = definitions.predicate.always,
      volumeName = predicates.isType '"String",
      volumeNamespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "value" ],
    predicates.records.record
    { name = predicates.isType '"String", value = predicates.isType '"String", }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port" ],
    predicates.records.record
    { host = predicates.isType '"String", port = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "effect", "key" ],
    predicates.records.record
    {
      effect = predicates.isType '"String",
      key = predicates.isType '"String",
      timeAdded = definitions.predicate.always,
      value = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      effect = predicates.isType '"String",
      key = predicates.isType '"String",
      operator = predicates.isType '"String",
      tolerationSeconds = predicates.isType 'Integer,
      value = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "values" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      values = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchLabelExpressions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
    predicates.records.record
    {
      labelSelector = definitions.predicate.always,
      matchLabelKeys = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      maxSkew = predicates.isType 'Integer,
      minDomains = predicates.isType 'Integer,
      nodeAffinityPolicy = predicates.isType '"String",
      nodeTaintsPolicy = predicates.isType '"String",
      topologyKey = predicates.isType '"String",
      whenUnsatisfiable = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      awsElasticBlockStore = definitions.predicate.always,
      azureDisk = definitions.predicate.always,
      azureFile = definitions.predicate.always,
      cephfs = definitions.predicate.always,
      cinder = definitions.predicate.always,
      configMap = definitions.predicate.always,
      csi = definitions.predicate.always,
      downwardAPI = definitions.predicate.always,
      emptyDir = definitions.predicate.always,
      ephemeral = definitions.predicate.always,
      fc = definitions.predicate.always,
      flexVolume = definitions.predicate.always,
      flocker = definitions.predicate.always,
      gcePersistentDisk = definitions.predicate.always,
      gitRepo = definitions.predicate.always,
      glusterfs = definitions.predicate.always,
      hostPath = definitions.predicate.always,
      iscsi = definitions.predicate.always,
      name = predicates.isType '"String",
      nfs = definitions.predicate.always,
      persistentVolumeClaim = definitions.predicate.always,
      photonPersistentDisk = definitions.predicate.always,
      portworxVolume = definitions.predicate.always,
      projected = definitions.predicate.always,
      quobyte = definitions.predicate.always,
      rbd = definitions.predicate.always,
      scaleIO = definitions.predicate.always,
      secret = definitions.predicate.always,
      storageos = definitions.predicate.always,
      vsphereVolume = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "devicePath", "name" ],
    predicates.records.record
    {
      devicePath = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "mountPath", "name" ],
    predicates.records.record
    {
      mountPath = predicates.isType '"String",
      mountPropagation = predicates.isType '"String",
      name = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      recursiveReadOnly = predicates.isType '"String",
      subPath = predicates.isType '"String",
      subPathExpr = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "mountPath", "name" ],
    predicates.records.record
    {
      mountPath = predicates.isType '"String",
      name = predicates.isType '"String",
      readOnly = predicates.isType '"Bool",
      recursiveReadOnly = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { required = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      clusterTrustBundle = definitions.predicate.always,
      configMap = definitions.predicate.always,
      downwardAPI = definitions.predicate.always,
      secret = definitions.predicate.always,
      serviceAccountToken = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      limits = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      requests = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "volumePath" ],
    predicates.records.record
    {
      fsType = predicates.isType '"String",
      storagePolicyID = predicates.isType '"String",
      storagePolicyName = predicates.isType '"String",
      volumePath = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "podAffinityTerm", "weight" ],
    predicates.records.record
    {
      podAffinityTerm = definitions.predicate.always,
      weight = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      gmsaCredentialSpec = predicates.isType '"String",
      gmsaCredentialSpecName = predicates.isType '"String",
      hostProcess = predicates.isType '"Bool",
      runAsUserName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "addresses" ],
    predicates.records.record
    {
      addresses = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      conditions = definitions.predicate.always,
      deprecatedTopology = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      hints = definitions.predicate.always,
      hostname = predicates.isType '"String",
      nodeName = predicates.isType '"String",
      targetRef = definitions.predicate.always,
      zone = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      ready = predicates.isType '"Bool",
      serving = predicates.isType '"Bool",
      terminating = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      forZones = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      appProtocol = predicates.isType '"String",
      name = predicates.isType '"String",
      port = predicates.isType 'Integer,
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "addressType", "endpoints" ],
    predicates.records.record
    {
      addressType = predicates.isType '"String",
      apiVersion = predicates.isType '"String",
      endpoints = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "EndpointSlice" ] ],
      metadata = definitions.predicate.always,
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "EndpointSliceList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "eventTime" ],
    predicates.records.record
    {
      action = predicates.isType '"String",
      apiVersion = predicates.isType '"String",
      deprecatedCount = predicates.isType 'Integer,
      deprecatedFirstTimestamp = definitions.predicate.always,
      deprecatedLastTimestamp = definitions.predicate.always,
      deprecatedSource = definitions.predicate.always,
      eventTime = definitions.predicate.always,
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Event" ] ],
      metadata = definitions.predicate.always,
      note = predicates.isType '"String",
      reason = predicates.isType '"String",
      regarding = definitions.predicate.always,
      related = definitions.predicate.always,
      reportingController = predicates.isType '"String",
      reportingInstance = predicates.isType '"String",
      series = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "EventList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "count", "lastObservedTime" ],
    predicates.records.record
    {
      count = predicates.isType 'Integer,
      lastObservedTime = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lendablePercent = predicates.isType 'Integer,
      nominalConcurrencyShares = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record { type = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "FlowSchema" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "FlowSchemaList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "priorityLevelConfiguration" ],
    predicates.records.record
    {
      distinguisherMethod = definitions.predicate.always,
      matchingPrecedence = predicates.isType 'Integer,
      priorityLevelConfiguration = definitions.predicate.always,
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      queuing = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      borrowingLimitPercent = predicates.isType 'Integer,
      lendablePercent = predicates.isType 'Integer,
      limitResponse = definitions.predicate.always,
      nominalConcurrencyShares = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "nonResourceURLs", "verbs" ],
    predicates.records.record
    {
      nonResourceURLs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "subjects" ],
    predicates.records.record
    {
      nonResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      subjects = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PriorityLevelConfiguration" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PriorityLevelConfigurationList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      exempt = definitions.predicate.always,
      limited = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      handSize = predicates.isType 'Integer,
      queueLengthLimit = predicates.isType 'Integer,
      queues = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "apiGroups", "resources", "verbs" ],
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      clusterScope = predicates.isType '"Bool",
      namespaces = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "namespace" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind" ],
    predicates.records.record
    {
      group = definitions.predicate.always,
      kind = predicates.isType '"String",
      serviceAccount = definitions.predicate.always,
      user = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lendablePercent = predicates.isType 'Integer,
      nominalConcurrencyShares = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record { type = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "FlowSchema" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "FlowSchemaList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "priorityLevelConfiguration" ],
    predicates.records.record
    {
      distinguisherMethod = definitions.predicate.always,
      matchingPrecedence = predicates.isType 'Integer,
      priorityLevelConfiguration = definitions.predicate.always,
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      queuing = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      borrowingLimitPercent = predicates.isType 'Integer,
      lendablePercent = predicates.isType 'Integer,
      limitResponse = definitions.predicate.always,
      nominalConcurrencyShares = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "nonResourceURLs", "verbs" ],
    predicates.records.record
    {
      nonResourceURLs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "subjects" ],
    predicates.records.record
    {
      nonResourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceRules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      subjects = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PriorityLevelConfiguration" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PriorityLevelConfigurationList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "type" ],
    predicates.records.record
    {
      exempt = definitions.predicate.always,
      limited = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      handSize = predicates.isType 'Integer,
      queueLengthLimit = predicates.isType 'Integer,
      queues = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "apiGroups", "resources", "verbs" ],
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      clusterScope = predicates.isType '"Bool",
      namespaces = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "namespace" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind" ],
    predicates.records.record
    {
      group = definitions.predicate.always,
      kind = predicates.isType '"String",
      serviceAccount = definitions.predicate.always,
      user = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "backend", "pathType" ],
    predicates.records.record
    {
      backend = definitions.predicate.always,
      path = predicates.isType '"String",
      pathType = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "paths" ],
    predicates.records.record
    {
      paths = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "cidr" ],
    predicates.records.record
    {
      cidr = predicates.isType '"String",
      except = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Ingress" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      resource = definitions.predicate.always,
      service = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "IngressClass" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "IngressClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      scope = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      controller = predicates.isType '"String",
      parameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "IngressList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      hostname = predicates.isType '"String",
      ip = predicates.isType '"String",
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      ingress = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "port", "protocol" ],
    predicates.records.record
    {
      error = predicates.isType '"String",
      port = predicates.isType 'Integer,
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { host = predicates.isType '"String", http = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    { name = predicates.isType '"String", port = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      defaultBackend = definitions.predicate.always,
      ingressClassName = predicates.isType '"String",
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      tls = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { loadBalancer = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      hosts = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      secretName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "NetworkPolicy" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      to = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      from = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      ports = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "NetworkPolicyList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      ipBlock = definitions.predicate.always,
      namespaceSelector = definitions.predicate.always,
      podSelector = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      endPort = predicates.isType 'Integer,
      port = definitions.predicate.always,
      protocol = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "podSelector" ],
    predicates.records.record
    {
      egress = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      ingress = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      podSelector = definitions.predicate.always,
      policyTypes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { name = predicates.isType '"String", number = predicates.isType 'Integer, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "IPAddress" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "IPAddressList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "parentRef" ],
    predicates.records.record { parentRef = definitions.predicate.always, } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "resource" ],
    predicates.records.record
    {
      group = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      resource = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ServiceCIDR" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ServiceCIDRList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      cidrs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      podFixed = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "handler" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      handler = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "RuntimeClass" ] ],
      metadata = definitions.predicate.always,
      overhead = definitions.predicate.always,
      scheduling = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "RuntimeClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      nodeSelector = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      tolerations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      deleteOptions = definitions.predicate.always,
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Eviction" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PodDisruptionBudget" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PodDisruptionBudgetList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      maxUnavailable = definitions.predicate.always,
      minAvailable = definitions.predicate.always,
      selector = definitions.predicate.always,
      unhealthyPodEvictionPolicy = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [
      "currentHealthy",
      "desiredHealthy",
      "disruptionsAllowed",
      "expectedPods"
    ],
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      currentHealthy = predicates.isType 'Integer,
      desiredHealthy = predicates.isType 'Integer,
      disruptedPods = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      disruptionsAllowed = predicates.isType 'Integer,
      expectedPods = predicates.isType 'Integer,
      observedGeneration = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      clusterRoleSelectors = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      aggregationRule = definitions.predicate.always,
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ClusterRole" ] ],
      metadata = definitions.predicate.always,
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "roleRef" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ClusterRoleBinding" ]
          ],
      metadata = definitions.predicate.always,
      roleRef = definitions.predicate.always,
      subjects = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ClusterRoleBindingList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ClusterRoleList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "verbs" ],
    predicates.records.record
    {
      apiGroups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      nonResourceURLs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resourceNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Role" ] ],
      metadata = definitions.predicate.always,
      rules = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "roleRef" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "RoleBinding" ] ],
      metadata = definitions.predicate.always,
      roleRef = definitions.predicate.always,
      subjects = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "RoleBindingList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "RoleList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "apiGroup", "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      availableOnNodes = definitions.predicate.always,
      resourceHandles = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      shareable = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      namedResources = definitions.predicate.always,
      vendorRequestParameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      driverName = predicates.isType '"String",
      requests = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      vendorParameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record { name = predicates.isType '"String", } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      bool = predicates.isType '"Bool",
      int = predicates.isType 'Integer,
      intSlice = definitions.predicate.always,
      name = predicates.isType '"String",
      quantity = definitions.predicate.always,
      string = predicates.isType '"String",
      stringSlice = definitions.predicate.always,
      version = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector" ],
    predicates.records.record { selector = predicates.isType '"String", } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name" ],
    predicates.records.record
    {
      attributes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "ints" ],
    predicates.records.record
    {
      ints = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType 'Integer)
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "selector" ],
    predicates.records.record { selector = predicates.isType '"String", } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "instances" ],
    predicates.records.record
    {
      instances = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "strings" ],
    predicates.records.record
    {
      strings = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PodSchedulingContext" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PodSchedulingContextList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      potentialNodes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      selectedNode = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      resourceClaims = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ResourceClaim" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "resource", "uid" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      name = predicates.isType '"String",
      resource = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClaimList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      driverRequests = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      generatedFrom = definitions.predicate.always,
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClaimParameters" ]
          ],
      metadata = definitions.predicate.always,
      shareable = predicates.isType '"Bool",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClaimParametersList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      unsuitableNodes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "resourceClassName" ],
    predicates.records.record
    {
      allocationMode = predicates.isType '"String",
      parametersRef = definitions.predicate.always,
      resourceClassName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      allocation = definitions.predicate.always,
      deallocationRequested = predicates.isType '"Bool",
      driverName = predicates.isType '"String",
      reservedFor = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClaimTemplate" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClaimTemplateList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driverName" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      driverName = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ResourceClass" ] ],
      metadata = definitions.predicate.always,
      parametersRef = definitions.predicate.always,
      structuredParameters = predicates.isType '"Bool",
      suitableNodes = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      filters = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      generatedFrom = definitions.predicate.always,
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClassParameters" ]
          ],
      metadata = definitions.predicate.always,
      vendorParameters = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceClassParametersList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "name" ],
    predicates.records.record
    {
      apiGroup = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      driverName = predicates.isType '"String",
      namedResources = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      data = predicates.isType '"String",
      driverName = predicates.isType '"String",
      structuredData = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      namedResources = definitions.predicate.always,
      vendorParameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driverName" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      driverName = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "ResourceSlice" ] ],
      metadata = definitions.predicate.always,
      namedResources = definitions.predicate.always,
      nodeName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "ResourceSliceList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "results" ],
    predicates.records.record
    {
      nodeName = predicates.isType '"String",
      results = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      vendorClaimParameters = definitions.predicate.always,
      vendorClassParameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      driverName = predicates.isType '"String",
      parameters = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "value" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      description = predicates.isType '"String",
      globalDefault = predicates.isType '"Bool",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "PriorityClass" ] ],
      metadata = definitions.predicate.always,
      preemptionPolicy = predicates.isType '"String",
      value = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "PriorityClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CSIDriver" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CSIDriverList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      attachRequired = predicates.isType '"Bool",
      fsGroupPolicy = predicates.isType '"String",
      podInfoOnMount = predicates.isType '"Bool",
      requiresRepublish = predicates.isType '"Bool",
      seLinuxMount = predicates.isType '"Bool",
      storageCapacity = predicates.isType '"Bool",
      tokenRequests = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      volumeLifecycleModes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CSINode" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "nodeID" ],
    predicates.records.record
    {
      allocatable = definitions.predicate.always,
      name = predicates.isType '"String",
      nodeID = predicates.isType '"String",
      topologyKeys = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "CSINodeList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "drivers" ],
    predicates.records.record
    {
      drivers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "storageClassName" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      capacity = definitions.predicate.always,
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CSIStorageCapacity" ]
          ],
      maximumVolumeSize = definitions.predicate.always,
      metadata = definitions.predicate.always,
      nodeTopology = definitions.predicate.always,
      storageClassName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CSIStorageCapacityList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "provisioner" ],
    predicates.records.record
    {
      allowVolumeExpansion = predicates.isType '"Bool",
      allowedTopologies = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "StorageClass" ] ],
      metadata = definitions.predicate.always,
      mountOptions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      parameters = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      provisioner = predicates.isType '"String",
      reclaimPolicy = predicates.isType '"String",
      volumeBindingMode = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "StorageClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "audience" ],
    predicates.records.record
    {
      audience = predicates.isType '"String",
      expirationSeconds = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "VolumeAttachment" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "VolumeAttachmentList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      inlineVolumeSpec = definitions.predicate.always,
      persistentVolumeName = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "attacher", "nodeName", "source" ],
    predicates.records.record
    {
      attacher = predicates.isType '"String",
      nodeName = predicates.isType '"String",
      source = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "attached" ],
    predicates.records.record
    {
      attachError = definitions.predicate.always,
      attached = predicates.isType '"Bool",
      attachmentMetadata = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      detachError = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      message = predicates.isType '"String",
      time = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record { count = predicates.isType 'Integer, } {  } false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "driverName" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      driverName = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "VolumeAttributesClass" ]
          ],
      metadata = definitions.predicate.always,
      parameters = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "VolumeAttributesClassList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      group = predicates.isType '"String",
      resource = predicates.isType '"String",
      version = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastUpdateTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "StorageVersionMigration" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "StorageVersionMigrationList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "resource" ],
    predicates.records.record
    {
      continueToken = predicates.isType '"String",
      resource = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceVersion = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "jsonPath", "name", "type" ],
    predicates.records.record
    {
      description = predicates.isType '"String",
      format = predicates.isType '"String",
      jsonPath = predicates.isType '"String",
      name = predicates.isType '"String",
      "priority" = predicates.isType 'Integer,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "strategy" ],
    predicates.records.record
    {
      strategy = predicates.isType '"String",
      webhook = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "spec" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CustomResourceDefinition" ]
          ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "CustomResourceDefinitionList" ]
          ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "kind", "plural" ],
    predicates.records.record
    {
      categories = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      kind = predicates.isType '"String",
      listKind = predicates.isType '"String",
      plural = predicates.isType '"String",
      shortNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      singular = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "group", "names", "scope", "versions" ],
    predicates.records.record
    {
      conversion = definitions.predicate.always,
      group = predicates.isType '"String",
      names = definitions.predicate.always,
      preserveUnknownFields = predicates.isType '"Bool",
      scope = predicates.isType '"String",
      versions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      acceptedNames = definitions.predicate.always,
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      storedVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "served", "storage" ],
    predicates.records.record
    {
      additionalPrinterColumns = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      deprecated = predicates.isType '"Bool",
      deprecationWarning = predicates.isType '"String",
      name = predicates.isType '"String",
      schema = definitions.predicate.always,
      selectableFields = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      served = predicates.isType '"Bool",
      storage = predicates.isType '"Bool",
      subresources = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "specReplicasPath", "statusReplicasPath" ],
    predicates.records.record
    {
      labelSelectorPath = predicates.isType '"String",
      specReplicasPath = predicates.isType '"String",
      statusReplicasPath = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType 'Record,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      scale = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    { openAPIV3Schema = definitions.predicate.always, }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      description = predicates.isType '"String",
      url = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.always,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      "$ref" = predicates.isType '"String",
      "$schema" = predicates.isType '"String",
      additionalItems = definitions.predicate.always,
      additionalProperties = definitions.predicate.always,
      allOf = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      anyOf = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      "default" = definitions.predicate.always,
      definitions = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      dependencies = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      description = predicates.isType '"String",
      enum = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      example = definitions.predicate.always,
      exclusiveMaximum = predicates.isType '"Bool",
      exclusiveMinimum = predicates.isType '"Bool",
      externalDocs = definitions.predicate.always,
      format = predicates.isType '"String",
      id = predicates.isType '"String",
      items = definitions.predicate.always,
      maxItems = predicates.isType 'Integer,
      maxLength = predicates.isType 'Integer,
      maxProperties = predicates.isType 'Integer,
      maximum = predicates.isType '"Number",
      minItems = predicates.isType 'Integer,
      minLength = predicates.isType 'Integer,
      minProperties = predicates.isType 'Integer,
      minimum = predicates.isType '"Number",
      multipleOf = predicates.isType '"Number",
      not = definitions.predicate.always,
      nullable = predicates.isType '"Bool",
      oneOf = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      pattern = predicates.isType '"String",
      patternProperties = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      properties = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            definitions.predicate.always
          ],
      required = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      title = predicates.isType '"String",
      type = predicates.isType '"String",
      uniqueItems = predicates.isType '"Bool",
      x-kubernetes-embedded-resource = predicates.isType '"Bool",
      x-kubernetes-int-or-string = predicates.isType '"Bool",
      x-kubernetes-list-map-keys = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      x-kubernetes-list-type = predicates.isType '"String",
      x-kubernetes-map-type = predicates.isType '"String",
      x-kubernetes-preserve-unknown-fields = predicates.isType '"Bool",
      x-kubernetes-validations = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.always,
  predicates.always,
  predicates.always,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "jsonPath" ],
    predicates.records.record { jsonPath = predicates.isType '"String", } {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "namespace" ],
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      path = predicates.isType '"String",
      port = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "rule" ],
    predicates.records.record
    {
      fieldPath = predicates.isType '"String",
      message = predicates.isType '"String",
      messageExpression = predicates.isType '"String",
      optionalOldSelf = predicates.isType '"Bool",
      reason = predicates.isType '"String",
      rule = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      caBundle = predicates.isType '"String",
      service = definitions.predicate.always,
      url = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "conversionReviewVersions" ],
    predicates.records.record
    {
      clientConfig = definitions.predicate.always,
      conversionReviewVersions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.oneOf [ predicates.isType '"String", predicates.isType '"Number" ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "name", "versions" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "APIGroup" ] ],
      name = predicates.isType '"String",
      preferredVersion = definitions.predicate.always,
      serverAddressByClientCIDRs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      versions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "groups" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      groups = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "APIGroupList" ] ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "kind", "name", "namespaced", "singularName", "verbs" ],
    predicates.records.record
    {
      categories = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      group = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      namespaced = predicates.isType '"Bool",
      shortNames = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      singularName = predicates.isType '"String",
      storageVersionHash = predicates.isType '"String",
      verbs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      version = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "groupVersion", "resources" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      groupVersion = predicates.isType '"String",
      kind = predicates.allOf
          [
            predicates.isType '"String",
            predicates.enum [ "APIResourceList" ]
          ],
      resources = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "serverAddressByClientCIDRs", "versions" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "APIVersions" ] ],
      serverAddressByClientCIDRs = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      versions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [ "lastTransitionTime", "message", "reason", "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      observedGeneration = predicates.isType 'Integer,
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      dryRun = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      gracePeriodSeconds = predicates.isType 'Integer,
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "DeleteOptions" ] ],
      orphanDependents = predicates.isType '"Bool",
      preconditions = definitions.predicate.always,
      propagationPolicy = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType 'Record,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "groupVersion", "version" ],
    predicates.records.record
    {
      groupVersion = predicates.isType '"String",
      version = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      matchExpressions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      matchLabels = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "key", "operator" ],
    predicates.records.record
    {
      key = predicates.isType '"String",
      operator = predicates.isType '"String",
      values = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      continue = predicates.isType '"String",
      remainingItemCount = predicates.isType 'Integer,
      resourceVersion = predicates.isType '"String",
      selfLink = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      fieldsType = predicates.isType '"String",
      fieldsV1 = definitions.predicate.always,
      manager = predicates.isType '"String",
      operation = predicates.isType '"String",
      subresource = predicates.isType '"String",
      time = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType '"String",
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      annotations = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      creationTimestamp = definitions.predicate.always,
      deletionGracePeriodSeconds = predicates.isType 'Integer,
      deletionTimestamp = definitions.predicate.always,
      finalizers = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf (predicates.isType '"String")
          ],
      generateName = predicates.isType '"String",
      generation = predicates.isType 'Integer,
      labels = predicates.allOf
          [
            predicates.isType 'Record,
            predicates.records.record {  } {  } true
            (predicates.isType '"String")
          ],
      managedFields = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      ownerReferences = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      resourceVersion = predicates.isType '"String",
      selfLink = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "apiVersion", "kind", "name", "uid" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      blockOwnerDeletion = predicates.isType '"Bool",
      controller = predicates.isType '"Bool",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType 'Record,
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      resourceVersion = predicates.isType '"String",
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "clientCIDR", "serverAddress" ],
    predicates.records.record
    {
      clientCIDR = predicates.isType '"String",
      serverAddress = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      code = predicates.isType 'Integer,
      details = definitions.predicate.always,
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "Status" ] ],
      message = predicates.isType '"String",
      metadata = definitions.predicate.always,
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      field = predicates.isType '"String",
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      causes = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      group = predicates.isType '"String",
      kind = predicates.isType '"String",
      name = predicates.isType '"String",
      retryAfterSeconds = predicates.isType 'Integer,
      uid = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType '"String",
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "object", "type" ],
    predicates.records.record
    {
      object = definitions.predicate.always,
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.isType 'Record,
  predicates.oneOf [ predicates.isType '"String", predicates.isType 'Integer ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required
    [
      "buildDate",
      "compiler",
      "gitCommit",
      "gitTreeState",
      "gitVersion",
      "goVersion",
      "major",
      "minor",
      "platform"
    ],
    predicates.records.record
    {
      buildDate = predicates.isType '"String",
      compiler = predicates.isType '"String",
      gitCommit = predicates.isType '"String",
      gitTreeState = predicates.isType '"String",
      gitVersion = predicates.isType '"String",
      goVersion = predicates.isType '"String",
      major = predicates.isType '"String",
      minor = predicates.isType '"String",
      platform = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "APIService" ] ],
      metadata = definitions.predicate.always,
      spec = definitions.predicate.always,
      status = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "status", "type" ],
    predicates.records.record
    {
      lastTransitionTime = definitions.predicate.always,
      message = predicates.isType '"String",
      reason = predicates.isType '"String",
      status = predicates.isType '"String",
      type = predicates.isType '"String",
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "items" ],
    predicates.records.record
    {
      apiVersion = predicates.isType '"String",
      items = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
      kind = predicates.allOf
          [ predicates.isType '"String", predicates.enum [ "APIServiceList" ] ],
      metadata = definitions.predicate.always,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.required [ "groupPriorityMinimum", "versionPriority" ],
    predicates.records.record
    {
      caBundle = predicates.isType '"String",
      group = predicates.isType '"String",
      groupPriorityMinimum = predicates.isType 'Integer,
      insecureSkipTLSVerify = predicates.isType '"Bool",
      service = definitions.predicate.always,
      version = predicates.isType '"String",
      versionPriority = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      conditions = predicates.allOf
          [
            predicates.isType '"Array",
            predicates.arrays.arrayOf definitions.predicate.always
          ],
    }
    {  }
    false
    predicates.never
  ],
  predicates.allOf
  [
    predicates.isType 'Record,
    predicates.records.record
    {
      name = predicates.isType '"String",
      namespace = predicates.isType '"String",
      port = predicates.isType 'Integer,
    }
    {  }
    false
    predicates.never
  ]
])