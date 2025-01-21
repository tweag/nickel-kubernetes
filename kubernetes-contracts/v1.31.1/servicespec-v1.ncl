# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = let error_lib
    : {
      at_field : String
      -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
      -> [|
        'Ok,
        'Error {
          message : String,
          source : Array [| '"Array" Number, 'Field String |]
        }
      |],
      at_index : Number
      -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
      -> [|
        'Ok,
        'Error {
          message : String,
          source : Array [| '"Array" Number, 'Field String |]
        }
      |],
      combine : String
      -> Array
          {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
      -> {
        message : String,
        source : Array [| '"Array" Number, 'Field String |]
      },
      error_to_string : {
          message : String,
          source : Array [| '"Array" Number, 'Field String |]
        }
      -> String,
      to_validator_result : [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
      -> [|
        'Ok,
        'Error { message | String | optional, notes | Array String | optional, }
      |],
      source_to_string : {
          message : String,
          source : Array [| '"Array" Number, 'Field String |]
        }
      -> String,
      mk_error : String
      -> [|
        'Ok,
        'Error {
          message : String,
          source : Array [| '"Array" Number, 'Field String |]
        }
      |]
    }
    = {
      at_field
        | doc m%"
          Prepend a given field name to the error source of this result, if it is an
          `'Error`. Returns the result unchanged if it is an `'Ok`.
        "%
        = fun
            field
            =>
            match {
              'Ok =>
                'Ok,
              'Error
              error =>
                'Error
                  {
                    message = error.message,
                    source = std.array.prepend ('Field field) error.source,
                  },
            },
      at_index
        | doc m%"
          Prepend an array access at the specificed index to the error source of
          this result, if it is an `'Error`. Returns the result unchanged if it is
          an `'Ok`.
        "%
        = fun
            index
            =>
            match {
              'Ok =>
                'Ok,
              'Error
              error =>
                'Error
                  {
                    message = error.message,
                    source = std.array.prepend ('"Array" index) error.source,
                  },
            },
      combine
        | doc m%"
          Combines an array of errors into a single error with a given initial message.
          Each error message will be listed after the initial message together
          with their source rendered as a path.
        "%
        = fun
            init_msg
            errors
            =>
            let msgs
              = std.string.join
                m%"
                  
                  
                "%
                (std.array.map (fun error => " • %{error_to_string error}")
                  errors)
              in
            {
                message =
                  m%"
                      %{init_msg}
                      %{msgs}
                    "%,
                source = [  ],
              },
      error_to_string
        | doc "Converts an error to a string representation, including the source."
        = fun
            error
            =>
            let location
              = if error.source == [  ] then
                ""
              else
                "at %{source_to_string error}: "
              in
            "%{location}%{error.message}",
      mk_error
        | doc "Creates a fresh error with a given message and an empty source."
        = fun msg => 'Error { message = msg, source = [  ], },
      source_to_string
        : {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        -> String
        | doc "Renders an error source location as a string."
        = fun
            { source, .. }
            =>
            std.array.fold_left
              (fun
                acc
                =>
                match {
                  '"Array"
                  index =>
                    "%{acc}[%{std.string.from_number index}]",
                  'Field
                  field =>
                    "%{acc}.%{field}",
                }) "" source,
      to_validator_result
        | doc m%"
          Converts a json-schema-to-nickel result type to the error type expected
          from validators in the Nickel stdlib.
        "%
        = match {
            'Ok =>
              'Ok,
            'Error
            error =>
              ('Error { message = error_to_string error, notes = [  ], })
              | _,
          },
    }
    in
  {
      allOf
        : Array (
            Dyn
            -> [|
              'Ok,
              'Error {
                message : String,
                source : Array [| '"Array" Number, 'Field String |]
              }
            |]
          )
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `allOf preds` succeeds if all of the predicates in `preds` succeed
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.1]
        "%
        = fun
            preds
            x
            =>
            std.array.fold_right
              (fun
                pred
                acc
                =>
                (match { 'Ok => acc, error @ 'Error _ => error, }) (pred x)) 'Ok
              preds,
      always
        : Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        = std.function.const 'Ok,
      anyOf
        : Array (
            Dyn
            -> [|
              'Ok,
              'Error {
                message : String,
                source : Array [| '"Array" Number, 'Field String |]
              }
            |]
          )
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `anyOf preds` succeeds if at least one of the predicates in `preds` succeeds
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.2]
        "%
        = fun
            preds
            x
            =>
            (match {
              'Ok =>
                'Ok,
              'Errors
              errors =>
                'Error
                  (error_lib.combine "anyOf: none of the options matched"
                    errors),
            })
              (std.array.fold_right
                (fun
                  pred
                  acc
                  =>
                  (match {
                    'Ok =>
                      'Ok,
                    'Errors
                    errors =>
                      (match {
                        'Ok =>
                          'Ok,
                        'Error
                        error =>
                          'Errors (std.array.prepend error errors),
                      }) (pred x),
                  }) acc) ('Errors [  ]) preds),
      arrays =
        let error_lib
            : {
              at_field : String
              -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |],
              at_index : Number
              -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |],
              combine : String
              -> Array
                  {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
              -> {
                message : String,
                source : Array [| '"Array" Number, 'Field String |]
              },
              error_to_string : {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              -> String,
              to_validator_result : [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message | String | optional,
                  notes | Array String | optional,
                }
              |],
              source_to_string : {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              -> String,
              mk_error : String
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
            }
            = {
              at_field
                | doc m%"
                  Prepend a given field name to the error source of this result, if it is an
                  `'Error`. Returns the result unchanged if it is an `'Ok`.
                "%
                = fun
                    field
                    =>
                    match {
                      'Ok =>
                        'Ok,
                      'Error
                      error =>
                        'Error
                          {
                            message = error.message,
                            source =
                              std.array.prepend ('Field field) error.source,
                          },
                    },
              at_index
                | doc m%"
                  Prepend an array access at the specificed index to the error source of
                  this result, if it is an `'Error`. Returns the result unchanged if it is
                  an `'Ok`.
                "%
                = fun
                    index
                    =>
                    match {
                      'Ok =>
                        'Ok,
                      'Error
                      error =>
                        'Error
                          {
                            message = error.message,
                            source =
                              std.array.prepend ('"Array" index) error.source,
                          },
                    },
              combine
                | doc m%"
                  Combines an array of errors into a single error with a given initial message.
                  Each error message will be listed after the initial message together
                  with their source rendered as a path.
                "%
                = fun
                    init_msg
                    errors
                    =>
                    let msgs
                      = std.string.join
                        m%"
                          
                          
                        "%
                        (std.array.map
                          (fun error => " • %{error_to_string error}") errors)
                      in
                    {
                        message =
                          m%"
                              %{init_msg}
                              %{msgs}
                            "%,
                        source = [  ],
                      },
              error_to_string
                | doc "Converts an error to a string representation, including the source."
                = fun
                    error
                    =>
                    let location
                      = if error.source == [  ] then
                        ""
                      else
                        "at %{source_to_string error}: "
                      in
                    "%{location}%{error.message}",
              mk_error
                | doc "Creates a fresh error with a given message and an empty source."
                = fun msg => 'Error { message = msg, source = [  ], },
              source_to_string
                : {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                -> String
                | doc "Renders an error source location as a string."
                = fun
                    { source, .. }
                    =>
                    std.array.fold_left
                      (fun
                        acc
                        =>
                        match {
                          '"Array"
                          index =>
                            "%{acc}[%{std.string.from_number index}]",
                          'Field
                          field =>
                            "%{acc}.%{field}",
                        }) "" source,
              to_validator_result
                | doc m%"
                  Converts a json-schema-to-nickel result type to the error type expected
                  from validators in the Nickel stdlib.
                "%
                = match {
                    'Ok =>
                      'Ok,
                    'Error
                    error =>
                      ('Error
                        { message = error_to_string error, notes = [  ], })
                      | _,
                  },
            }
            in
          {
              additionalItems
                : (Dyn
                  -> [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |])
                -> Number
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.2]"
                = fun
                    pred
                    start
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      let x
                        | Array Dyn
                        = x
                        in
                      let value_length
                          = std.array.length x
                          in
                        if start >= value_length then
                            'Ok
                          else
                            arrayOf pred
                              ((std.array.slice start value_length x)
                              | Dyn),
              arrayOf
                : (Dyn
                  -> [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |])
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  Apply a predicate to all elements of an array, succeeding if all
                  applications succeed.
                "%
                = fun
                    pred
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      let x
                        | Array Dyn
                        = x
                        in
                      std.array.fold_right
                          (fun
                            { index, value, }
                            acc
                            =>
                            (match { 'Ok => acc, error @ 'Error msg => error, })
                              (error_lib.at_index index (pred value))) 'Ok
                          (std.array.map_with_index
                            (fun idx elt => { index = idx, value = elt, }) x),
              contains
                : (Dyn
                  -> [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |])
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.6]"
                = fun
                    pred
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      let x
                        | Array Dyn
                        = x
                        in
                      (match {
                          'Ok =>
                            'Ok,
                          'Errors
                          errors =>
                            'Error
                              (error_lib.combine "contains: no elements matched"
                                errors),
                        })
                          (std.array.fold_right
                            (fun
                              x
                              acc
                              =>
                              (match {
                                'Ok =>
                                  'Ok,
                                'Errors
                                errors =>
                                  (match {
                                    'Ok =>
                                      'Ok,
                                    'Error
                                    error =>
                                      'Errors (std.array.prepend error errors),
                                  }) (pred x),
                              }) acc) ('Errors [  ]) x),
              items
                : Array (
                    Dyn
                    -> [|
                      'Ok,
                      'Error {
                        message : String,
                        source : Array [| '"Array" Number, 'Field String |]
                      }
                    |]
                  )
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.1]"
                = fun
                    preds
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      let x
                        | Array Dyn
                        = x
                        in
                      let length_to_check
                          = std.number.min (std.array.length preds)
                            (std.array.length x)
                          in
                        std.array.fold_right
                            (fun
                              i
                              acc
                              =>
                              (match { 'Ok => acc, err @ 'Error msg => err, })
                                (error_lib.at_index i
                                  (std.array.at i preds (std.array.at i x))))
                            'Ok (std.array.range 0 length_to_check),
              maxItems
                : Number
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  `maxItems n x` fails if `x` is an array of length strictly greater than `n` and succeeds otherwise.
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.3]
                "%
                = fun
                    n
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      if (std.array.length (x | Array Dyn)) > n then
                        error_lib.mk_error
                          "array is longer than %{std.string.from_number
                            n} items"
                      else
                        'Ok,
              minItems
                : Number
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  `minItems n x` fails if `x` is an array of length strictly smaller than `n` and succeeds otherwise.
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.4]
                "%
                = fun
                    n
                    x
                    =>
                    if !(std.is_array x) then
                      'Ok
                    else
                      if (std.array.length (x | Array Dyn)) < n then
                        error_lib.mk_error
                          "array is shorter than %{std.string.from_number
                            n} items"
                      else
                        'Ok,
              uniqueItems
                : Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  Succeeds for any array if its elements are pairwise distinct.
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.4.5]
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
                          let index
                            = std.serialize 'Json elt
                            in
                          if std.record.has_field index acc.seen then
                              {
                                duplicate = elt,
                                has_duplicate = true,
                                seen = acc.seen,
                              }
                            else
                              {
                                duplicate = null,
                                has_duplicate = false,
                                seen = std.record.insert index true acc.seen,
                              })
                      { duplicate = null, has_duplicate = false, seen = {}, }
                    in
                  fun
                      x
                      =>
                      if !(std.is_array x) then
                        'Ok
                      else
                        let { has_duplicate, duplicate, .. }
                          = find_duplicate (x | Array Dyn)
                          in
                        if has_duplicate then
                            error_lib.mk_error
                              "duplicate found: %{std.serialize 'Json
                                duplicate}"
                          else
                            'Ok,
            },
      const
        : Dyn
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `const value x` succeeds if and only if `x` is equal to `value`
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.1.3]
        "%
        = fun
            value
            x
            =>
            if x == value then
              'Ok
            else
              error_lib.mk_error "expected %{std.serialize 'Json value}",
      contract_from_predicate
        : (Dyn
          -> [|
            'Ok,
            'Error {
              message : String,
              source : Array [| '"Array" Number, 'Field String |]
            }
          |])
        -> Dyn
        = fun
            predicate
            =>
            std.contract.from_validator
              (fun value => error_lib.to_validator_result (predicate value)),
      enum
        : Array Dyn
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `enum values x` succeeds if and only if `x` is equal to one of the elements of `values`.
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.1.2]
        "%
        = let checkEqual
            = fun
              input
              variant
              =>
              (input == variant)
              || ((std.is_enum input)
              && (((std.string.from_enum input) == variant)
              | Bool))
            in
          fun
              values
              x
              =>
              std.array.fold_right
                (fun value acc => if checkEqual x value then 'Ok else acc)
                (error_lib.mk_error
                  "expected one of %{std.serialize 'Json (values | Dyn)}")
                values,
      from_simple_predicate
        : String
        -> (Dyn -> Bool)
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc "Convert a simple boolean predicate into a predicate supporting error messages"
        = fun msg pred x => if pred x then 'Ok else error_lib.mk_error msg,
      ifThenElse
        : (Dyn
          -> [|
            'Ok,
            'Error {
              message : String,
              source : Array [| '"Array" Number, 'Field String |]
            }
          |])
        -> (Dyn
          -> [|
            'Ok,
            'Error {
              message : String,
              source : Array [| '"Array" Number, 'Field String |]
            }
          |])
        -> (Dyn
          -> [|
            'Ok,
            'Error {
              message : String,
              source : Array [| '"Array" Number, 'Field String |]
            }
          |])
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `ifThenElse i t e` first checks if the predicate `i` succeeds. If it does, it's equivalent to `t`, otherwise it's equivalent to `e`.
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.6]
        "%
        = fun
            cond
            ok
            err
            x
            =>
            (match { 'Ok => ok x, 'Error _ => err x, }) (cond x),
      isType
        : [|
            '"Array",
            '"Bool",
            'Integer,
            'Null,
            '"Number",
            'Record,
            '"String"
          |]
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        = fun
            t
            =>
            (match {
              'Null =>
                from_simple_predicate "expected `null`" (fun x => x == null),
              'Integer =>
                from_simple_predicate "expected an integer"
                  (fun
                    x
                    =>
                    (std.is_number x) && (std.number.is_integer (x | Number))),
              _ =>
                from_simple_predicate
                  "value is not of type %{std.string.from_enum t}"
                  (fun x => (std.typeof x) == t),
            }) t,
      never
        : Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        = std.function.const (error_lib.mk_error "never"),
      not
        : (Dyn
          -> [|
            'Ok,
            'Error {
              message : String,
              source : Array [| '"Array" Number, 'Field String |]
            }
          |])
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `not pred` succeeds if and only if `pred` fails
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.4]
        "%
        = fun
            pred
            x
            =>
            (match {
              'Ok =>
                error_lib.mk_error "Inverted predicate succeeded unexpectedly",
              'Error
              _ =>
                'Ok,
            }) (pred x),
      numbers =
        {
            exclusiveMaximum
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.3]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_number x) then
                    'Ok
                  else
                    if (x | Number) < limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected an exclusive maximum of %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            exclusiveMinimum
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.5]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_number x) then
                    'Ok
                  else
                    if (x | Number) > limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected an exclusive minimum of %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            maximum
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.2]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_number x) then
                    'Ok
                  else
                    if (x | Number) <= limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a maximum of %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            minimum
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.4]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_number x) then
                    'Ok
                  else
                    if (x | Number) >= limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a minimum of %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            multipleOf
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.2.1]"
              = fun
                  mult
                  x
                  =>
                  if !(std.is_number x) then
                    'Ok
                  else
                    if std.number.is_integer ((x | Number) / mult) then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a multiple of %{std.string.from_number
                                mult}",
                          source = [  ],
                        },
          },
      oneOf
        : Array (
            Dyn
            -> [|
              'Ok,
              'Error {
                message : String,
                source : Array [| '"Array" Number, 'Field String |]
              }
            |]
          )
        -> Dyn
        -> [|
          'Ok,
          'Error {
            message : String,
            source : Array [| '"Array" Number, 'Field String |]
          }
        |]
        | doc m%"
          `oneOf preds` succeeds if precisely one of the predicates in `preds` succeeds
          Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.7.3]
        "%
        = fun
            preds
            x
            =>
            let count_ok
              : Array
                  [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |]
              -> Number
              = fun
                results
                =>
                std.array.fold_left (fun n b => if b == 'Ok then n + 1 else n) 0
                  results
              in
            let results
                = std.array.map (fun pred => pred x) preds
                in
              let count
                  = count_ok results
                  in
                if count == 0 then
                    let errors
                      = std.array.flat_map
                        (match { 'Ok => [  ], 'Error error => [ error ], })
                        results
                      in
                    'Error
                        (error_lib.combine "oneOf: none of the options matched"
                          errors)
                  else
                    if count > 1 then
                      error_lib.mk_error
                        "oneOf: more than one of the options matched"
                    else
                      'Ok,
      records =
        let error_lib
            : {
              at_field : String
              -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |],
              at_index : Number
              -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |],
              combine : String
              -> Array
                  {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
              -> {
                message : String,
                source : Array [| '"Array" Number, 'Field String |]
              },
              error_to_string : {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              -> String,
              to_validator_result : [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
              -> [|
                'Ok,
                'Error {
                  message | String | optional,
                  notes | Array String | optional,
                }
              |],
              source_to_string : {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              -> String,
              mk_error : String
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
            }
            = {
              at_field
                | doc m%"
                  Prepend a given field name to the error source of this result, if it is an
                  `'Error`. Returns the result unchanged if it is an `'Ok`.
                "%
                = fun
                    field
                    =>
                    match {
                      'Ok =>
                        'Ok,
                      'Error
                      error =>
                        'Error
                          {
                            message = error.message,
                            source =
                              std.array.prepend ('Field field) error.source,
                          },
                    },
              at_index
                | doc m%"
                  Prepend an array access at the specificed index to the error source of
                  this result, if it is an `'Error`. Returns the result unchanged if it is
                  an `'Ok`.
                "%
                = fun
                    index
                    =>
                    match {
                      'Ok =>
                        'Ok,
                      'Error
                      error =>
                        'Error
                          {
                            message = error.message,
                            source =
                              std.array.prepend ('"Array" index) error.source,
                          },
                    },
              combine
                | doc m%"
                  Combines an array of errors into a single error with a given initial message.
                  Each error message will be listed after the initial message together
                  with their source rendered as a path.
                "%
                = fun
                    init_msg
                    errors
                    =>
                    let msgs
                      = std.string.join
                        m%"
                          
                          
                        "%
                        (std.array.map
                          (fun error => " • %{error_to_string error}") errors)
                      in
                    {
                        message =
                          m%"
                              %{init_msg}
                              %{msgs}
                            "%,
                        source = [  ],
                      },
              error_to_string
                | doc "Converts an error to a string representation, including the source."
                = fun
                    error
                    =>
                    let location
                      = if error.source == [  ] then
                        ""
                      else
                        "at %{source_to_string error}: "
                      in
                    "%{location}%{error.message}",
              mk_error
                | doc "Creates a fresh error with a given message and an empty source."
                = fun msg => 'Error { message = msg, source = [  ], },
              source_to_string
                : {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                -> String
                | doc "Renders an error source location as a string."
                = fun
                    { source, .. }
                    =>
                    std.array.fold_left
                      (fun
                        acc
                        =>
                        match {
                          '"Array"
                          index =>
                            "%{acc}[%{std.string.from_number index}]",
                          'Field
                          field =>
                            "%{acc}.%{field}",
                        }) "" source,
              to_validator_result
                | doc m%"
                  Converts a json-schema-to-nickel result type to the error type expected
                  from validators in the Nickel stdlib.
                "%
                = match {
                    'Ok =>
                      'Ok,
                    'Error
                    error =>
                      ('Error
                        { message = error_to_string error, notes = [  ], })
                      | _,
                  },
            }
            in
          {
              dependencies
                : { _ : Dyn }
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.7]"
                = let mustHaveFields
                    : Array String
                    -> { _ : Dyn }
                    -> [|
                      'Ok,
                      'Error {
                        message : String,
                        source : Array [| '"Array" Number, 'Field String |]
                      }
                    |]
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
                            error_lib.mk_error "expected field `%{field}`"
                          else
                            acc) 'Ok fields
                    in
                  fun
                      deps
                      x
                      =>
                      if !(std.is_record x) then
                        'Ok
                      else
                        let x
                          | { _ : Dyn }
                          = x
                          in
                        std.array.fold_right
                            (fun
                              { field, value, }
                              acc
                              =>
                              if !(std.record.has_field field x) then
                                acc
                              else
                                let result
                                  = if std.is_array value then
                                    mustHaveFields (value | Array String) x
                                  else
                                    let pred
                                      | Dyn
                                      -> [|
                                        'Ok,
                                        'Error {
                                          message : String,
                                          source : Array
                                            [| '"Array" Number, 'Field String |]
                                        }
                                      |]
                                      = value
                                      in
                                    pred (x | Dyn)
                                  in
                                (match {
                                    'Ok =>
                                      acc,
                                    'Error
                                    error =>
                                      'Error
                                        {
                                          message =
                                            "dependency of `%{field}` failed: %{error.message}",
                                          source =
                                            std.array.prepend ('Field field)
                                                error.source,
                                        },
                                  }) result) 'Ok (std.record.to_array deps),
              maxProperties
                : Number
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  `maxProperties n x` fails if `x` is a record containing stricly more than `n` fields.
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.1]
                "%
                = fun
                    n
                    x
                    =>
                    if !(std.is_record x) then
                      'Ok
                    else
                      if (std.record.length (x | { _ : Dyn })) > n then
                        error_lib.mk_error
                          "record contains more than %{std.string.from_number
                            n} fields"
                      else
                        'Ok,
              minProperties
                : Number
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  `minProperties n x` fails if `x` is a record containing stricly less than `n` fields.
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.1]
                "%
                = fun
                    n
                    x
                    =>
                    if !(std.is_record x) then
                      'Ok
                    else
                      if (std.record.length (x | { _ : Dyn })) < n then
                        error_lib.mk_error
                          "record contains fewer than %{std.string.from_number
                            n} fields"
                      else
                        'Ok,
              propertyNames
                : (Dyn
                  -> [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |])
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.8]"
                = fun
                    pred
                    x
                    =>
                    if !(std.is_record x) then
                      'Ok
                    else
                      std.array.fold_right
                        (fun
                          field
                          acc
                          =>
                          (match {
                            'Error
                            error =>
                              'Error
                                {
                                  message =
                                    "field `%{field}` did not validate against `propertyNames` schema: %{error.message}",
                                  source =
                                    std.array.prepend ('Field field)
                                        error.source,
                                },
                            'Ok =>
                              acc,
                          }) (pred (field | Dyn))) 'Ok
                        (std.record.fields (x | { _ : Dyn })),
              record
                : {
                    _ : Dyn
                    -> [|
                      'Ok,
                      'Error {
                        message : String,
                        source : Array [| '"Array" Number, 'Field String |]
                      }
                    |]
                  }
                -> {
                    _ : Dyn
                    -> [|
                      'Ok,
                      'Error {
                        message : String,
                        source : Array [| '"Array" Number, 'Field String |]
                      }
                    |]
                  }
                -> Bool
                -> (Dyn
                  -> [|
                    'Ok,
                    'Error {
                      message : String,
                      source : Array [| '"Array" Number, 'Field String |]
                    }
                  |])
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc m%"
                  `record properties patternProperties additionalAllowed
                  additionalProperties x` is a combination of the `properties`,
                  `patternProperties` and `additionalProperties` validation keywords in
                  JSON schema.
                  
                  Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5]
                "%
                = fun
                    properties
                    patternProperties
                    additionalAllowed
                    additionalProperties
                    x
                    =>
                    if !(std.is_record x) then
                      'Ok
                    else
                      let x
                        | { _ : Dyn }
                        = x
                        in
                      let check_properties
                          : {
                            result : [|
                              'Ok,
                              'Error {
                                message : String,
                                source : Array
                                  [| '"Array" Number, 'Field String |]
                              }
                            |],
                            checked : { _ : Bool }
                          }
                          = std.array.fold_right
                            (fun
                              { field, value, }
                              acc
                              =>
                              if !(std.record.has_field field x) then
                                acc
                              else
                                (match {
                                  'Ok =>
                                    {
                                      checked =
                                        std.record.insert field true
                                            acc.checked,
                                      result = acc.result,
                                    },
                                  error @ 'Error
                                  _ =>
                                    { checked = {}, result = error, },
                                })
                                  (error_lib.at_field field
                                    (value x."%{field}")))
                            { checked = {}, result = 'Ok, }
                            (std.record.to_array properties)
                          in
                        let matching_fields
                            : String -> { _ : Dyn }
                            = fun
                              pattern
                              =>
                              let matcher
                                = std.string.is_match pattern
                                in
                              std.array.fold_left
                                  (fun
                                    acc
                                    { field, value, }
                                    =>
                                    if matcher field then
                                      std.record.insert field value acc
                                    else
                                      acc) {} (std.record.to_array x)
                            in
                          let check_pattern_properties
                              : {
                                result : [|
                                  'Ok,
                                  'Error {
                                    message : String,
                                    source : Array
                                      [| '"Array" Number, 'Field String |]
                                  }
                                |],
                                checked : { _ : Bool }
                              }
                              = std.array.fold_right
                                (fun
                                  { field = pattern, value = pred, }
                                  acc
                                  =>
                                  (match {
                                    r @ { result = 'Error _, .. } =>
                                      r,
                                    { result = 'Ok, checked = ch, } =>
                                      {
                                        checked =
                                          std.array.fold_left
                                              (fun
                                                r
                                                field
                                                =>
                                                if !(std.record.has_field field
                                                  r) then
                                                  std.record.insert field true r
                                                else
                                                  r) acc.checked
                                              (std.record.fields ch),
                                        result = acc.result,
                                      },
                                  })
                                    (std.array.fold_right
                                      (fun
                                        { field, value, }
                                        acc
                                        =>
                                        (match {
                                          'Ok =>
                                            {
                                              checked =
                                                std.record.insert field true
                                                    acc.checked,
                                              result = acc.result,
                                            },
                                          error @ 'Error
                                          _ =>
                                            {
                                              checked : { _ : Bool } = {},
                                              result =
                                                error_lib.at_field field error,
                                            },
                                        }) (pred value))
                                      {
                                        checked : { _ : Bool } = {},
                                        result = 'Ok,
                                      }
                                      (std.record.to_array
                                        (matching_fields pattern))))
                                { checked : { _ : Bool } = {}, result = 'Ok, }
                                (std.record.to_array patternProperties)
                              in
                            let remaining_fields
                                = std.array.fold_left
                                  (fun
                                    acc
                                    field
                                    =>
                                    if !(std.record.has_field field acc) then
                                      acc
                                    else
                                      std.record.remove field acc) x
                                  ((std.record.fields check_properties.checked)
                                  @ (std.record.fields
                                    check_pattern_properties.checked))
                                in
                              let check_additional_properties
                                  : [|
                                    'Ok,
                                    'Error {
                                      message : String,
                                      source : Array
                                        [| '"Array" Number, 'Field String |]
                                    }
                                  |]
                                  = if (!additionalAllowed)
                                  && (!(std.record.is_empty
                                    remaining_fields)) then
                                    error_lib.mk_error
                                      "extra fields %{std.serialize 'Json
                                        ((std.record.fields remaining_fields)
                                        | Dyn)}"
                                  else
                                    std.array.fold_right
                                      (fun
                                        { field, value, }
                                        acc
                                        =>
                                        (match {
                                          'Ok =>
                                            acc,
                                          error @ 'Error
                                          _ =>
                                            error,
                                        })
                                          (error_lib.at_field field
                                            (additionalProperties value))) 'Ok
                                      (std.record.to_array remaining_fields)
                                  in
                                (match {
                                    'Ok =>
                                      (match {
                                        'Ok =>
                                          check_additional_properties,
                                        error @ 'Error
                                        _ =>
                                          error,
                                      }) check_pattern_properties.result,
                                    error @ 'Error
                                    _ =>
                                      error,
                                  }) check_properties.result,
              required
                : Array String
                -> Dyn
                -> [|
                  'Ok,
                  'Error {
                    message : String,
                    source : Array [| '"Array" Number, 'Field String |]
                  }
                |]
                | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.5.3]"
                = fun
                    fields
                    x
                    =>
                    if !(std.is_record x) then
                      'Ok
                    else
                      std.array.fold_right
                        (fun
                          field
                          acc
                          =>
                          if !(std.record.has_field field
                            (x
                            | { _ : Dyn })) then
                            error_lib.mk_error "missing required field %{field}"
                          else
                            acc) 'Ok fields,
            },
      strings =
        {
            maxLength
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.1]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_string x) then
                    'Ok
                  else
                    if (std.string.length (x | String)) <= limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a string of length no larger than %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            minLength
              : Number
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.2]"
              = fun
                  limit
                  x
                  =>
                  if !(std.is_string x) then
                    'Ok
                  else
                    if (std.string.length (x | String)) >= limit then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a string of length no smaller than %{std.string.from_number
                                limit}",
                          source = [  ],
                        },
            pattern
              : String
              -> Dyn
              -> [|
                'Ok,
                'Error {
                  message : String,
                  source : Array [| '"Array" Number, 'Field String |]
                }
              |]
              | doc "Cf. [https://datatracker.ietf.org/doc/html/draft-handrews-json-schema-validation-01#section-6.3.3]"
              = fun
                  pattern
                  x
                  =>
                  if !(std.is_string x) then
                    'Ok
                  else
                    if std.string.is_match pattern (x | String) then
                      'Ok
                    else
                      'Error
                        {
                          message =
                            "expected a string matching the pattern `%{pattern}`",
                          source = [  ],
                        },
          },
    }
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      allocateLoadBalancerNodePorts
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is \"true\". It may be set to \"false\" if the cluster load-balancer does not rely on NodePorts.  If the caller requests specific NodePorts (by specifying a value), those requests will be respected, regardless of this field. This field may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type."
        | optional,
      clusterIP
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are \"None\", empty string (\"\"), or a valid IP address. Setting this to \"None\" makes a \"headless service\" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies"
        | optional,
      clusterIPs
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
            ])
        | doc m%"
          ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value.
          
          This field may hold a maximum of two entries (dual-stack IPs, in either order). These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
        "%
        | optional,
      externalIPs
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
            ])
        | doc "externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system."
        | optional,
      externalName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be \"ExternalName\"."
        | optional,
      externalTrafficPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "externalTrafficPolicy describes how nodes distribute service traffic they receive on one of the Service's \"externally-facing\" addresses (NodePorts, ExternalIPs, and LoadBalancer IPs). If set to \"Local\", the proxy will configure the service in a way that assumes that external load balancers will take care of balancing the service traffic between nodes, and so each node will deliver traffic only to the node-local endpoints of the service, without masquerading the client source IP. (Traffic mistakenly sent to a node with no endpoints will be dropped.) The default value, \"Cluster\", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features). Note that traffic sent to an External IP or LoadBalancer IP from within the cluster will always get \"Cluster\" semantics, but clients sending to a NodePort from within the cluster may need to take traffic policy into account when picking a node."
        | optional,
      healthCheckNodePort
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type). This field cannot be updated once set."
        | optional,
      internalTrafficPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "InternalTrafficPolicy describes how nodes distribute service traffic they receive on the ClusterIP. If set to \"Local\", the proxy will assume that pods only want to talk to endpoints of the service on the same node as the pod, dropping the traffic if there are no local endpoints. The default value, \"Cluster\", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features)."
        | optional,
      ipFamilies
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
            ])
        | doc m%"
          IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service. This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail. This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service. Valid values are "IPv4" and "IPv6".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless" services. This field will be wiped when updating a Service to type ExternalName.
          
          This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.
        "%
        | optional,
      ipFamilyPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "IPFamilyPolicy represents the dual-stack-ness requested or required by this Service. If there is no value provided, then this field will be set to SingleStack. Services can be \"SingleStack\" (a single IP family), \"PreferDualStack\" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or \"RequireDualStack\" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field. This field will be wiped when updating a service to type ExternalName."
        | optional,
      loadBalancerClass
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. \"internal-vip\" or \"example.com/internal-vip\". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type."
        | optional,
      loadBalancerIP
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Only applies to Service Type: LoadBalancer. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature. Deprecated: This field was under-specified and its meaning varies across implementations. Using it is non-portable and it may not support dual-stack. Users are encouraged to use implementation-specific annotations when available."
        | optional,
      loadBalancerSourceRanges
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
            ])
        | doc "If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature.\" More info: https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/"
        | optional,
      ports
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
                    _js2n__-prdslib.records.required [ "port" ],
                    _js2n__-prdslib.records.record
                      {
                        appProtocol =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        name =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        nodePort =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        port = _js2n__-prdslib.isType 'Integer,
                        protocol =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        targetPort =
                          _js2n__-prdslib.oneOf
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
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies"
        | optional,
      publishNotReadyAddresses
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered \"ready\" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior."
        | optional,
      selector
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record {} {} true
                (_js2n__-prdslib.anyOf
                  [
                    _js2n__-prdslib.isType '"String",
                    _js2n__-prdslib.isType 'Null
                  ])
            ])
        | doc "Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/"
        | optional,
      sessionAffinity
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Supports \"ClientIP\" and \"None\". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies"
        | optional,
      sessionAffinityConfig
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record
                {
                  clientIP =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              timeoutSeconds =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "SessionAffinityConfig represents the configurations of session affinity."
        | optional,
      trafficDistribution
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "TrafficDistribution offers a way to express preferences for how traffic is distributed to Service endpoints. Implementations can use this field as a hint, but are not required to guarantee strict adherence. If the field is not set, the implementation will apply its default routing strategy. If set to \"PreferClose\", implementations should prioritize endpoints that are topologically close (e.g., same zone). This is an alpha field and requires enabling ServiceTrafficDistribution feature."
        | optional,
      type
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. \"ClusterIP\" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is \"None\", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. \"NodePort\" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. \"LoadBalancer\" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. \"ExternalName\" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types"
        | optional,
    }