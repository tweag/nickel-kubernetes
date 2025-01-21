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
      activeDeadlineSeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer."
        | optional,
      affinity
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
                  nodeAffinity =
                    _js2n__-prdslib.allOf
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
                                                                            } {}
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
                                                                            } {}
                                                                            false
                                                                            _js2n__-prdslib.never
                                                                        ])
                                                                  ],
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                                weight =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              requiredDuringSchedulingIgnoredDuringExecution =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
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
                                                                            } {}
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
                                                                            } {}
                                                                            false
                                                                            _js2n__-prdslib.never
                                                                        ])
                                                                  ],
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ])
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  podAffinity =
                    _js2n__-prdslib.allOf
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
                                              [ "podAffinityTerm", "weight" ],
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
                                                                                        {}
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
                                                                                  {}
                                                                                  {}
                                                                                  true
                                                                                  (_js2n__-prdslib.anyOf
                                                                                    [
                                                                                      _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                      _js2n__-prdslib.isType
                                                                                        'Null
                                                                                    ])
                                                                              ],
                                                                      } {} false
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
                                                                                        {}
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
                                                                                  {}
                                                                                  {}
                                                                                  true
                                                                                  (_js2n__-prdslib.anyOf
                                                                                    [
                                                                                      _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                      _js2n__-prdslib.isType
                                                                                        'Null
                                                                                    ])
                                                                              ],
                                                                      } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                                weight =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              requiredDuringSchedulingIgnoredDuringExecution =
                                _js2n__-prdslib.allOf
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
                                                                            } {}
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
                                                                      {} {} true
                                                                      (_js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                          _js2n__-prdslib.isType
                                                                            'Null
                                                                        ])
                                                                  ],
                                                          } {} false
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
                                                                            } {}
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
                                                                      {} {} true
                                                                      (_js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                          _js2n__-prdslib.isType
                                                                            'Null
                                                                        ])
                                                                  ],
                                                          } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  podAntiAffinity =
                    _js2n__-prdslib.allOf
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
                                              [ "podAffinityTerm", "weight" ],
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
                                                                                        {}
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
                                                                                  {}
                                                                                  {}
                                                                                  true
                                                                                  (_js2n__-prdslib.anyOf
                                                                                    [
                                                                                      _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                      _js2n__-prdslib.isType
                                                                                        'Null
                                                                                    ])
                                                                              ],
                                                                      } {} false
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
                                                                                        {}
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
                                                                                  {}
                                                                                  {}
                                                                                  true
                                                                                  (_js2n__-prdslib.anyOf
                                                                                    [
                                                                                      _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                      _js2n__-prdslib.isType
                                                                                        'Null
                                                                                    ])
                                                                              ],
                                                                      } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                                weight =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              requiredDuringSchedulingIgnoredDuringExecution =
                                _js2n__-prdslib.allOf
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
                                                                            } {}
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
                                                                      {} {} true
                                                                      (_js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                          _js2n__-prdslib.isType
                                                                            'Null
                                                                        ])
                                                                  ],
                                                          } {} false
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
                                                                            } {}
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
                                                                      {} {} true
                                                                      (_js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                          _js2n__-prdslib.isType
                                                                            'Null
                                                                        ])
                                                                  ],
                                                          } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "Affinity is a group of affinity scheduling rules."
        | optional,
      automountServiceAccountToken
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "AutomountServiceAccountToken indicates whether a service account token should be automatically mounted."
        | optional,
      containers
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
                    _js2n__-prdslib.records.required [ "name" ],
                    _js2n__-prdslib.records.record
                      {
                        args =
                          _js2n__-prdslib.allOf
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
                        command =
                          _js2n__-prdslib.allOf
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
                        env =
                          _js2n__-prdslib.allOf
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
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          value =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        envFrom =
                          _js2n__-prdslib.allOf
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                          prefix =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        image =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        imagePullPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        lifecycle =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    postStart =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    preStop =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        livenessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        name = _js2n__-prdslib.isType '"String",
                        ports =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                          hostIP =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          hostPort =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          protocol =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        readinessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        resizePolicy =
                          _js2n__-prdslib.allOf
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
                                        [ "resourceName", "restartPolicy" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          resourceName =
                                            _js2n__-prdslib.isType '"String",
                                          restartPolicy =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        resources =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    claims =
                                      _js2n__-prdslib.allOf
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
                                                      request =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    limits =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                  } {} false _js2n__-prdslib.never
                              ],
                        restartPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        securityContext =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    appArmorProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    capabilities =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    privileged =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    procMount =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnlyRootFilesystem =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsGroup =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsNonRoot =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsUser =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    seLinuxOptions =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    seccompProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    windowsOptions =
                                      _js2n__-prdslib.allOf
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        startupProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        stdin =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        stdinOnce =
                          _js2n__-prdslib.anyOf
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
                        tty =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        volumeDevices =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        volumeMounts =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          mountPropagation =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          readOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"Bool",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          recursiveReadOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPath =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPathExpr =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        workingDir =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.",
      dnsConfig
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
                  nameservers =
                    _js2n__-prdslib.allOf
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
                  options =
                    _js2n__-prdslib.allOf
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
                                    name =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    value =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  searches =
                    _js2n__-prdslib.allOf
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
                } {} false _js2n__-prdslib.never
            ])
        | doc "PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy."
        | optional,
      dnsPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Set DNS policy for the pod. Defaults to \"ClusterFirst\". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'."
        | optional,
      enableServiceLinks
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. Optional: Defaults to true."
        | optional,
      ephemeralContainers
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
                    _js2n__-prdslib.records.required [ "name" ],
                    _js2n__-prdslib.records.record
                      {
                        args =
                          _js2n__-prdslib.allOf
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
                        command =
                          _js2n__-prdslib.allOf
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
                        env =
                          _js2n__-prdslib.allOf
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
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          value =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        envFrom =
                          _js2n__-prdslib.allOf
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                          prefix =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        image =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        imagePullPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        lifecycle =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    postStart =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    preStop =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        livenessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        name = _js2n__-prdslib.isType '"String",
                        ports =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                          hostIP =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          hostPort =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          protocol =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        readinessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        resizePolicy =
                          _js2n__-prdslib.allOf
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
                                        [ "resourceName", "restartPolicy" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          resourceName =
                                            _js2n__-prdslib.isType '"String",
                                          restartPolicy =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        resources =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    claims =
                                      _js2n__-prdslib.allOf
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
                                                      request =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    limits =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                  } {} false _js2n__-prdslib.never
                              ],
                        restartPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        securityContext =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    appArmorProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    capabilities =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    privileged =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    procMount =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnlyRootFilesystem =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsGroup =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsNonRoot =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsUser =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    seLinuxOptions =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    seccompProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    windowsOptions =
                                      _js2n__-prdslib.allOf
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        startupProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        stdin =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        stdinOnce =
                          _js2n__-prdslib.anyOf
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
                        tty =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        volumeDevices =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        volumeMounts =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          mountPropagation =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          readOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"Bool",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          recursiveReadOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPath =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPathExpr =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        workingDir =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of ephemeral containers run in this pod. Ephemeral containers may be run in an existing pod to perform user-initiated actions such as debugging. This list cannot be specified when creating a pod, and it cannot be modified by updating the pod spec. In order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers subresource."
        | optional,
      hostAliases
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
                    _js2n__-prdslib.records.required [ "ip" ],
                    _js2n__-prdslib.records.record
                      {
                        hostnames =
                          _js2n__-prdslib.allOf
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
                        ip = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified."
        | optional,
      hostIPC
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Use the host's ipc namespace. Optional: Default to false."
        | optional,
      hostNetwork
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified. Default to false."
        | optional,
      hostPID
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Use the host's pid namespace. Optional: Default to false."
        | optional,
      hostUsers
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Use the host's user namespace. Optional: Default to true. If set to true or not present, the pod will be run in the host user namespace, useful for when the pod needs a feature only available to the host user namespace, such as loading a kernel module with CAP_SYS_MODULE. When set to false, a new userns is created for the pod. Setting false is useful for mitigating container breakout vulnerabilities even allowing users to run their containers as root without actually having root privileges on the host. This field is alpha-level and is only honored by servers that enable the UserNamespacesSupport feature."
        | optional,
      hostname
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value."
        | optional,
      imagePullSecrets
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
                    _js2n__-prdslib.records.record
                      {
                        name =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod"
        | optional,
      initContainers
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
                    _js2n__-prdslib.records.required [ "name" ],
                    _js2n__-prdslib.records.record
                      {
                        args =
                          _js2n__-prdslib.allOf
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
                        command =
                          _js2n__-prdslib.allOf
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
                        env =
                          _js2n__-prdslib.allOf
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
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          value =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
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
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        envFrom =
                          _js2n__-prdslib.allOf
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                          prefix =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        image =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        imagePullPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        lifecycle =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    postStart =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    preStop =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                          } {} false
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
                                                                            } {}
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
                                                          } {} false
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
                                                          } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        livenessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        name = _js2n__-prdslib.isType '"String",
                        ports =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                          hostIP =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          hostPort =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          protocol =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        readinessProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        resizePolicy =
                          _js2n__-prdslib.allOf
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
                                        [ "resourceName", "restartPolicy" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          resourceName =
                                            _js2n__-prdslib.isType '"String",
                                          restartPolicy =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        resources =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    claims =
                                      _js2n__-prdslib.allOf
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
                                                      request =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    limits =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
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
                                  } {} false _js2n__-prdslib.never
                              ],
                        restartPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        securityContext =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    appArmorProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    capabilities =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    privileged =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    procMount =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnlyRootFilesystem =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsGroup =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsNonRoot =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    runAsUser =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    seLinuxOptions =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    seccompProfile =
                                      _js2n__-prdslib.allOf
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
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                type =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    windowsOptions =
                                      _js2n__-prdslib.allOf
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        startupProbe =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    exec =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    failureThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    grpc =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    httpGet =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                } {} false
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    initialDelaySeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    periodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    successThreshold =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    tcpSocket =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminationGracePeriodSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    timeoutSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        stdin =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        stdinOnce =
                          _js2n__-prdslib.anyOf
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
                        tty =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        volumeDevices =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        volumeMounts =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                          mountPropagation =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          readOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"Bool",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          recursiveReadOnly =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPath =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          subPathExpr =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        workingDir =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/"
        | optional,
      nodeName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "NodeName indicates in which node this pod is scheduled. If empty, this pod is a candidate for scheduling by the scheduler defined in schedulerName. Once this field is set, the kubelet for this node becomes responsible for the lifecycle of this pod. This field should not be used to express a desire for the pod to be scheduled on a specific node. https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodename"
        | optional,
      nodeSelector
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
        | doc "NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/"
        | optional,
      os
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ])
        | doc "PodOS defines the OS parameters of a pod."
        | optional,
      overhead
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record {} {} true
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
            ])
        | doc "Overhead represents the resource overhead associated with running a pod for a given RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass admission controller. If the RuntimeClass admission controller is enabled, overhead must not be set in Pod create requests. The RuntimeClass admission controller will reject Pod create requests which have the overhead already set. If RuntimeClass is configured and selected in the PodSpec, Overhead will be set to the value defined in the corresponding RuntimeClass, otherwise it will remain unset and treated as zero. More info: https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md"
        | optional,
      preemptionPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset."
        | optional,
      "priority"
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority."
        | optional,
      priorityClassName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "If specified, indicates the pod's priority. \"system-node-critical\" and \"system-cluster-critical\" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default."
        | optional,
      readinessGates
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
                    _js2n__-prdslib.records.required [ "conditionType" ],
                    _js2n__-prdslib.records.record
                      { conditionType = _js2n__-prdslib.isType '"String", } {}
                      false _js2n__-prdslib.never
                  ])
            ])
        | doc "If specified, all readiness gates will be evaluated for pod readiness. A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to \"True\" More info: https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates"
        | optional,
      resourceClaims
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
                    _js2n__-prdslib.records.required [ "name" ],
                    _js2n__-prdslib.records.record
                      {
                        name = _js2n__-prdslib.isType '"String",
                        resourceClaimName =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        resourceClaimTemplateName =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc m%"
          ResourceClaims defines which ResourceClaims must be allocated and reserved before the Pod is allowed to start. The resources will be made available to those containers which consume them by name.
          
          This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
          
          This field is immutable.
        "%
        | optional,
      restartPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Restart policy for all containers within the pod. One of Always, OnFailure, Never. In some contexts, only a subset of those values may be permitted. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy"
        | optional,
      runtimeClassName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should be used to run this pod.  If no RuntimeClass resource matches the named class, the pod will not be run. If unset or empty, the \"legacy\" RuntimeClass will be used, which is an implicit class with an empty definition that uses the default runtime handler. More info: https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class"
        | optional,
      schedulerName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler."
        | optional,
      schedulingGates
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
                    _js2n__-prdslib.records.required [ "name" ],
                    _js2n__-prdslib.records.record
                      { name = _js2n__-prdslib.isType '"String", } {} false
                      _js2n__-prdslib.never
                  ])
            ])
        | doc m%"
          SchedulingGates is an opaque list of values that if specified will block scheduling the pod. If schedulingGates is not empty, the pod will stay in the SchedulingGated state and the scheduler will not attempt to schedule the pod.
          
          SchedulingGates can only be set at pod creation time, and be removed only afterwards.
        "%
        | optional,
      securityContext
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
                  appArmorProfile =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              localhostProfile =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                            } {} false _js2n__-prdslib.never
                        ],
                  fsGroup =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Integer,
                          _js2n__-prdslib.isType 'Null
                        ],
                  fsGroupChangePolicy =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  runAsGroup =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Integer,
                          _js2n__-prdslib.isType 'Null
                        ],
                  runAsNonRoot =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"Bool",
                          _js2n__-prdslib.isType 'Null
                        ],
                  runAsUser =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Integer,
                          _js2n__-prdslib.isType 'Null
                        ],
                  seLinuxOptions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              level =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              role =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              type =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              user =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  seccompProfile =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              localhostProfile =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                            } {} false _js2n__-prdslib.never
                        ],
                  supplementalGroups =
                    _js2n__-prdslib.allOf
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
                  supplementalGroupsPolicy =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  sysctls =
                    _js2n__-prdslib.allOf
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
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  windowsOptions =
                    _js2n__-prdslib.allOf
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
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              gmsaCredentialSpecName =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              hostProcess =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"Bool",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              runAsUserName =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext."
        | optional,
      serviceAccount
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "DeprecatedServiceAccount is a deprecated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead."
        | optional,
      serviceAccountName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/"
        | optional,
      setHostnameAsFQDN
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "If true the pod's hostname will be configured as the pod's FQDN, rather than the leaf name (the default). In Linux containers, this means setting the FQDN in the hostname field of the kernel (the nodename field of struct utsname). In Windows containers, this means setting the registry value of hostname for the registry key HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters to FQDN. If a pod does not have FQDN, this has no effect. Default to false."
        | optional,
      shareProcessNamespace
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Default to false."
        | optional,
      subdomain
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "If specified, the fully qualified Pod hostname will be \"<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>\". If not specified, the pod will not have a domainname at all."
        | optional,
      terminationGracePeriodSeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds."
        | optional,
      tolerations
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
                    _js2n__-prdslib.records.record
                      {
                        effect =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        key =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        operator =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        tolerationSeconds =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        value =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "If specified, the pod's tolerations."
        | optional,
      topologySpreadConstraints
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
                    _js2n__-prdslib.records.required
                      [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
                    _js2n__-prdslib.records.record
                      {
                        labelSelector =
                          _js2n__-prdslib.allOf
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
                                                _js2n__-prdslib.isType '"Array",
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    matchLabels =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
                                              true
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        matchLabelKeys =
                          _js2n__-prdslib.allOf
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
                        minDomains =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        nodeAffinityPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        nodeTaintsPolicy =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        topologyKey = _js2n__-prdslib.isType '"String",
                        whenUnsatisfiable = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "TopologySpreadConstraints describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints. All topologySpreadConstraints are ANDed."
        | optional,
      volumes
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
                                _js2n__-prdslib.records.required [ "volumeID" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    partition =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volumeID = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        azureDisk =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    diskName = _js2n__-prdslib.isType '"String",
                                    diskURI = _js2n__-prdslib.isType '"String",
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    kind =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        azureFile =
                          _js2n__-prdslib.allOf
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
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretName =
                                      _js2n__-prdslib.isType '"String",
                                    shareName =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        cephfs =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "monitors" ],
                                _js2n__-prdslib.records.record
                                  {
                                    monitors =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.arrays.arrayOf
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    path =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretFile =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    user =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        cinder =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "volumeID" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    volumeID = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        configMap =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    items =
                                      _js2n__-prdslib.allOf
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    name =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    "optional" =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        csi =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "driver" ],
                                _js2n__-prdslib.records.record
                                  {
                                    driver = _js2n__-prdslib.isType '"String",
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    nodePublishSecretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volumeAttributes =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
                                              true
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        downwardAPI =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    items =
                                      _js2n__-prdslib.allOf
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
                                                                } {} false
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
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        emptyDir =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    medium =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    sizeLimit =
                                      _js2n__-prdslib.oneOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType
                                                  '"String",
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType
                                                  '"Number",
                                                _js2n__-prdslib.isType 'Null
                                              ]
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        ephemeral =
                          _js2n__-prdslib.allOf
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
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                                                      {} {} true
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
                                                                      {} {} true
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
                                                                            } {}
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
                                                                            } {}
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
                                                          } {} false
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
                                                                      } {} false
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
                                                                      } {} false
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
                                                                                  {}
                                                                                  {}
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
                                                                                  {}
                                                                                  {}
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
                                                                      } {} false
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
                                                                                        {}
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
                                                                                  {}
                                                                                  {}
                                                                                  true
                                                                                  (_js2n__-prdslib.anyOf
                                                                                    [
                                                                                      _js2n__-prdslib.isType
                                                                                        '"String",
                                                                                      _js2n__-prdslib.isType
                                                                                        'Null
                                                                                    ])
                                                                              ],
                                                                      } {} false
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
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        fc =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    lun =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    targetWWNs =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType '"Array",
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.arrays.arrayOf
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    wwids =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType '"Array",
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.arrays.arrayOf
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        flexVolume =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "driver" ],
                                _js2n__-prdslib.records.record
                                  {
                                    driver = _js2n__-prdslib.isType '"String",
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    options =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record {} {}
                                              true
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        flocker =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    datasetUUID =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        gcePersistentDisk =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "pdName" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    partition =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    pdName = _js2n__-prdslib.isType '"String",
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        gitRepo =
                          _js2n__-prdslib.allOf
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
                                    directory =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    repository =
                                      _js2n__-prdslib.isType '"String",
                                    revision =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        glusterfs =
                          _js2n__-prdslib.allOf
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
                                    endpoints =
                                      _js2n__-prdslib.isType '"String",
                                    path = _js2n__-prdslib.isType '"String",
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        hostPath =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "path" ],
                                _js2n__-prdslib.records.record
                                  {
                                    path = _js2n__-prdslib.isType '"String",
                                    type =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        image =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    pullPolicy =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    reference =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        iscsi =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    chapAuthSession =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    initiatorName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    iqn = _js2n__-prdslib.isType '"String",
                                    iscsiInterface =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    lun = _js2n__-prdslib.isType 'Integer,
                                    portals =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType '"Array",
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.arrays.arrayOf
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    targetPortal =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        name = _js2n__-prdslib.isType '"String",
                        nfs =
                          _js2n__-prdslib.allOf
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
                                    path = _js2n__-prdslib.isType '"String",
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    server = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
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
                                    claimName =
                                      _js2n__-prdslib.isType '"String",
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        photonPersistentDisk =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "pdID" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    pdID = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        portworxVolume =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "volumeID" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volumeID = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        projected =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    sources =
                                      _js2n__-prdslib.allOf
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
                                                                                              {}
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
                                                                                        {}
                                                                                        {}
                                                                                        true
                                                                                        (_js2n__-prdslib.anyOf
                                                                                          [
                                                                                            _js2n__-prdslib.isType
                                                                                              '"String",
                                                                                            _js2n__-prdslib.isType
                                                                                              'Null
                                                                                          ])
                                                                                    ],
                                                                            } {}
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
                                                                } {} false
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
                                                                                  {}
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
                                                                } {} false
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
                                                                                              {}
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
                                                                                              {}
                                                                                              false
                                                                                              _js2n__-prdslib.never
                                                                                          ],
                                                                                  }
                                                                                  {}
                                                                                  false
                                                                                  _js2n__-prdslib.never
                                                                              ])
                                                                        ],
                                                                } {} false
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
                                                                                  {}
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
                                                                } {} false
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
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        quobyte =
                          _js2n__-prdslib.allOf
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
                                    group =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    registry = _js2n__-prdslib.isType '"String",
                                    tenant =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    user =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volume = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        rbd =
                          _js2n__-prdslib.allOf
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
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    image = _js2n__-prdslib.isType '"String",
                                    keyring =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    monitors =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType '"Array",
                                            _js2n__-prdslib.arrays.arrayOf
                                              (_js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    pool =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    user =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        scaleIO =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "gateway", "secretRef", "system" ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    gateway = _js2n__-prdslib.isType '"String",
                                    protectionDomain =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    sslEnabled =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    storageMode =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    storagePool =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    system = _js2n__-prdslib.isType '"String",
                                    volumeName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        secret =
                          _js2n__-prdslib.allOf
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
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    items =
                                      _js2n__-prdslib.allOf
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
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    "optional" =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        storageos =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    readOnly =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    secretRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    volumeName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volumeNamespace =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        vsphereVolume =
                          _js2n__-prdslib.allOf
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
                                    fsType =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    storagePolicyID =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    storagePolicyName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    volumePath =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes"
        | optional,
    }