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
      args
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
        | doc "Arguments to the entrypoint. The image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell"
        | optional,
      command
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
        | doc "Entrypoint array. Not executed within a shell. The image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell"
        | optional,
      env
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
                        value =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        valueFrom =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    configMapKeyRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    fieldRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    resourceFieldRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    secretKeyRef =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of environment variables to set in the container. Cannot be updated."
        | optional,
      envFrom
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
                        configMapRef =
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
                        prefix =
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
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER. All invalid keys will be reported as an event when the container is starting. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated."
        | optional,
      image
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Container image name. More info: https://kubernetes.io/docs/concepts/containers/images"
        | optional,
      imagePullPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images"
        | optional,
      lifecycle
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
                                                  _js2n__-prdslib.isType 'Null
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
                                                          [ "name", "value" ],
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
                                                  _js2n__-prdslib.isType 'Null
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
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ],
                              sleep =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.required
                                        [ "seconds" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          seconds =
                                            _js2n__-prdslib.isType 'Integer,
                                        } {} false _js2n__-prdslib.never
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
                                                  _js2n__-prdslib.isType 'Null
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
                                                  _js2n__-prdslib.isType 'Null
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
                                                          [ "name", "value" ],
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
                                                  _js2n__-prdslib.isType 'Null
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
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ],
                              sleep =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.required
                                        [ "seconds" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          seconds =
                                            _js2n__-prdslib.isType 'Integer,
                                        } {} false _js2n__-prdslib.never
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
                                                  _js2n__-prdslib.isType 'Null
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
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted."
        | optional,
      livenessProbe
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              port = _js2n__-prdslib.isType 'Integer,
                              service =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              httpHeaders =
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
                                                name =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                value =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              path =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
                              scheme =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
            ])
        | doc "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
        | optional,
      name
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Name of the ephemeral container specified as a DNS_LABEL. This name must be unique among all containers, init containers and ephemeral containers.",
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
                    _js2n__-prdslib.records.required [ "containerPort" ],
                    _js2n__-prdslib.records.record
                      {
                        containerPort = _js2n__-prdslib.isType 'Integer,
                        hostIP =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        hostPort =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        name =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        protocol =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Ports are not allowed for ephemeral containers."
        | optional,
      readinessProbe
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              port = _js2n__-prdslib.isType 'Integer,
                              service =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              httpHeaders =
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
                                                name =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                value =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              path =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
                              scheme =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
            ])
        | doc "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
        | optional,
      resizePolicy
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
                      [ "resourceName", "restartPolicy" ],
                    _js2n__-prdslib.records.record
                      {
                        resourceName = _js2n__-prdslib.isType '"String",
                        restartPolicy = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Resources resize policy for the container."
        | optional,
      resources
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
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "name" ],
                                _js2n__-prdslib.records.record
                                  {
                                    name = _js2n__-prdslib.isType '"String",
                                    request =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
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
                        ],
                  requests =
                    _js2n__-prdslib.allOf
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
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ResourceRequirements describes the compute resource requirements."
        | optional,
      restartPolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Restart policy for the container to manage the restart behavior of each container within a pod. This may only be set for init containers. You cannot set this field on ephemeral containers."
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
                              drop =
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
        | doc "SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence."
        | optional,
      startupProbe
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              port = _js2n__-prdslib.isType 'Integer,
                              service =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              httpHeaders =
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
                                                name =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                value =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              path =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
                              scheme =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
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
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
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
            ])
        | doc "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
        | optional,
      stdin
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false."
        | optional,
      stdinOnce
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false"
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
        | doc "Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated."
        | optional,
      terminationMessagePolicy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated."
        | optional,
      tty
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false."
        | optional,
      volumeDevices
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
                    _js2n__-prdslib.records.required [ "devicePath", "name" ],
                    _js2n__-prdslib.records.record
                      {
                        devicePath = _js2n__-prdslib.isType '"String",
                        name = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "volumeDevices is the list of block devices to be used by the container."
        | optional,
      volumeMounts
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
                    _js2n__-prdslib.records.required [ "mountPath", "name" ],
                    _js2n__-prdslib.records.record
                      {
                        mountPath = _js2n__-prdslib.isType '"String",
                        mountPropagation =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        name = _js2n__-prdslib.isType '"String",
                        readOnly =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        recursiveReadOnly =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        subPath =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        subPathExpr =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Pod volumes to mount into the container's filesystem. Subpath mounts are not allowed for ephemeral containers. Cannot be updated."
        | optional,
      workingDir
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated."
        | optional,
    }