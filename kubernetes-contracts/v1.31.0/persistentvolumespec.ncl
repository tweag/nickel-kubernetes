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
  accessModes
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.anyOf
      [ predicates.isType '"String", predicates.isType 'Null ])
    ])
    | doc m%"
    accessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
    "%
    | optional,
  awsElasticBlockStore
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Persistent Disk resource in AWS.
    
    An AWS EBS disk must exist before mounting to a container. The disk must also be in the same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS EBS volumes support ownership management and SELinux relabeling.
    "%
    | optional,
  azureDisk
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
    "%
    | optional,
  azureFile
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "secretName", "shareName" ],
      predicates.records.record
      {
        readOnly = predicates.anyOf
            [ predicates.isType '"Bool", predicates.isType 'Null ],
        secretName = predicates.isType '"String",
        secretNamespace = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        shareName = predicates.isType '"String",
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
    "%
    | optional,
  capacity
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
    capacity is the description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
    "%
    | optional,
  cephfs
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "monitors" ],
      predicates.records.record
      {
        monitors = predicates.allOf
            [
              predicates.isType '"Array",
              predicates.arrays.arrayOf
              (predicates.anyOf
              [ predicates.isType '"String", predicates.isType 'Null ])
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  cinder
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
    "%
    | optional,
  claimRef
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        apiVersion = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        fieldPath = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        kind = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        name = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        namespace = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        resourceVersion = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        uid = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    ObjectReference contains enough information to let you inspect or modify the referred object.
    "%
    | optional,
  csi
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "driver", "volumeHandle" ],
      predicates.records.record
      {
        controllerExpandSecretRef = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        controllerPublishSecretRef = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        driver = predicates.isType '"String",
        fsType = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        nodeExpandSecretRef = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        nodePublishSecretRef = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
              }
              {  }
              false
              predicates.never
            ],
        nodeStageSecretRef = predicates.allOf
            [
              predicates.anyOf
              [ predicates.isType 'Record, predicates.isType 'Null ],
              predicates.records.record
              {
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ])
            ],
        volumeHandle = predicates.isType '"String",
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    Represents storage that is managed by an external CSI volume driver (Beta feature)
    "%
    | optional,
  fc
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ])
            ],
        wwids = predicates.allOf
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
    Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling.
    "%
    | optional,
  flexVolume
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ])
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
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
    FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin.
    "%
    | optional,
  flocker
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  gcePersistentDisk
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Persistent Disk resource in Google Compute Engine.
    
    A GCE PD must exist before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once or read-only many times. GCE PDs support ownership management and SELinux relabeling.
    "%
    | optional,
  glusterfs
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "endpoints", "path" ],
      predicates.records.record
      {
        endpoints = predicates.isType '"String",
        endpointsNamespace = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        path = predicates.isType '"String",
        readOnly = predicates.anyOf
            [ predicates.isType '"Bool", predicates.isType 'Null ],
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  hostPath
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  iscsi
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ])
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
    "%
    | optional,
  local
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "path" ],
      predicates.records.record
      {
        fsType = predicates.anyOf
            [ predicates.isType '"String", predicates.isType 'Null ],
        path = predicates.isType '"String",
      }
      {  }
      false
      predicates.never
    ])
    | doc m%"
    Local represents directly-attached storage with node affinity (Beta feature)
    "%
    | optional,
  mountOptions
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType '"Array", predicates.isType 'Null ],
      predicates.arrays.arrayOf
      (predicates.anyOf
      [ predicates.isType '"String", predicates.isType 'Null ])
    ])
    | doc m%"
    mountOptions is the list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
    "%
    | optional,
  nfs
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  nodeAffinity
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.record
      {
        required = predicates.allOf
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
                        [ predicates.isType 'Record, predicates.isType 'Null ],
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
    VolumeNodeAffinity defines constraints that limit what nodes this volume can be accessed from.
    "%
    | optional,
  persistentVolumeReclaimPolicy
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    persistentVolumeReclaimPolicy defines what happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
    "%
    | optional,
  photonPersistentDisk
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Photon Controller persistent disk resource.
    "%
    | optional,
  portworxVolume
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    PortworxVolumeSource represents a Portworx volume resource.
    "%
    | optional,
  quobyte
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling.
    "%
    | optional,
  rbd
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
              [ predicates.isType '"String", predicates.isType 'Null ])
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
    "%
    | optional,
  scaleIO
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
      predicates.records.required [ "gateway", "secretRef", "system" ],
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
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume
    "%
    | optional,
  storageClassName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    storageClassName is the name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
    "%
    | optional,
  storageos
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
                apiVersion = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                fieldPath = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                kind = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                name = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                namespace = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                resourceVersion = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
                uid = predicates.anyOf
                    [ predicates.isType '"String", predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a StorageOS persistent volume resource.
    "%
    | optional,
  volumeAttributesClassName
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    Name of VolumeAttributesClass to which this persistent volume belongs. Empty value is not allowed. When this field is not set, it indicates that this volume does not belong to any VolumeAttributesClass. This field is mutable and can be changed by the CSI driver after a volume has been updated successfully to a new class. For an unbound PersistentVolume, the volumeAttributesClassName will be matched with unbound PersistentVolumeClaims during the binding process. This is a beta field and requires enabling VolumeAttributesClass feature (off by default).
    "%
    | optional,
  volumeMode
    | predicates.contract_from_predicate
    (predicates.anyOf [ predicates.isType '"String", predicates.isType 'Null ])
    | doc m%"
    volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec.
    "%
    | optional,
  vsphereVolume
    | predicates.contract_from_predicate
    (predicates.allOf
    [
      predicates.anyOf [ predicates.isType 'Record, predicates.isType 'Null ],
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
    ])
    | doc m%"
    Represents a vSphere volume resource.
    "%
    | optional,
}