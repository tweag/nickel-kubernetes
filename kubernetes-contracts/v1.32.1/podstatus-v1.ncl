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
      conditions
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
                    _js2n__-prdslib.records.required [ "status", "type" ],
                    _js2n__-prdslib.records.record
                      {
                        lastProbeTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        lastTransitionTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        message =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        reason =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        status = _js2n__-prdslib.isType '"String",
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Current service state of pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions"
        | optional,
      containerStatuses
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
                      [ "image", "imageID", "name", "ready", "restartCount" ],
                    _js2n__-prdslib.records.record
                      {
                        allocatedResources =
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
                        allocatedResourcesStatus =
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
                                          resources =
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
                                                          [ "resourceID" ],
                                                        _js2n__-prdslib.records.record
                                                          {
                                                            health =
                                                              _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                      '"String",
                                                                    _js2n__-prdslib.isType
                                                                      'Null
                                                                  ],
                                                            resourceID =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ])
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        containerID =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        image = _js2n__-prdslib.isType '"String",
                        imageID = _js2n__-prdslib.isType '"String",
                        lastState =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        name = _js2n__-prdslib.isType '"String",
                        ready = _js2n__-prdslib.isType '"Bool",
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
                        restartCount = _js2n__-prdslib.isType 'Integer,
                        started =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        state =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        user =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    linux =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "gid", "uid" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                gid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                supplementalGroups =
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
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                                uid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Statuses of containers in this pod. Each container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status"
        | optional,
      ephemeralContainerStatuses
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
                      [ "image", "imageID", "name", "ready", "restartCount" ],
                    _js2n__-prdslib.records.record
                      {
                        allocatedResources =
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
                        allocatedResourcesStatus =
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
                                          resources =
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
                                                          [ "resourceID" ],
                                                        _js2n__-prdslib.records.record
                                                          {
                                                            health =
                                                              _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                      '"String",
                                                                    _js2n__-prdslib.isType
                                                                      'Null
                                                                  ],
                                                            resourceID =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ])
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        containerID =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        image = _js2n__-prdslib.isType '"String",
                        imageID = _js2n__-prdslib.isType '"String",
                        lastState =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        name = _js2n__-prdslib.isType '"String",
                        ready = _js2n__-prdslib.isType '"Bool",
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
                        restartCount = _js2n__-prdslib.isType 'Integer,
                        started =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        state =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        user =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    linux =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "gid", "uid" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                gid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                supplementalGroups =
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
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                                uid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Statuses for any ephemeral containers that have run in this pod. Each ephemeral container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status"
        | optional,
      hostIP
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "hostIP holds the IP address of the host to which the pod is assigned. Empty if the pod has not started yet. A pod can be assigned to a node that has a problem in kubelet which in turns mean that HostIP will not be updated even if there is a node is assigned to pod"
        | optional,
      hostIPs
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
                      { ip = _js2n__-prdslib.isType '"String", } {} false
                      _js2n__-prdslib.never
                  ])
            ])
        | doc "hostIPs holds the IP addresses allocated to the host. If this field is specified, the first entry must match the hostIP field. This list is empty if the pod has not started yet. A pod can be assigned to a node that has a problem in kubelet which in turns means that HostIPs will not be updated even if there is a node is assigned to this pod."
        | optional,
      initContainerStatuses
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
                      [ "image", "imageID", "name", "ready", "restartCount" ],
                    _js2n__-prdslib.records.record
                      {
                        allocatedResources =
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
                        allocatedResourcesStatus =
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
                                          resources =
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
                                                          [ "resourceID" ],
                                                        _js2n__-prdslib.records.record
                                                          {
                                                            health =
                                                              _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                      '"String",
                                                                    _js2n__-prdslib.isType
                                                                      'Null
                                                                  ],
                                                            resourceID =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ])
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        containerID =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        image = _js2n__-prdslib.isType '"String",
                        imageID = _js2n__-prdslib.isType '"String",
                        lastState =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        name = _js2n__-prdslib.isType '"String",
                        ready = _js2n__-prdslib.isType '"Bool",
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
                        restartCount = _js2n__-prdslib.isType 'Integer,
                        started =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"Bool",
                                _js2n__-prdslib.isType 'Null
                              ],
                        state =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    running =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    terminated =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "exitCode" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                containerID =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                exitCode =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                finishedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                signal =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          'Integer,
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                startedAt =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    waiting =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.record
                                              {
                                                message =
                                                  _js2n__-prdslib.anyOf
                                                      [
                                                        _js2n__-prdslib.isType
                                                          '"String",
                                                        _js2n__-prdslib.isType
                                                          'Null
                                                      ],
                                                reason =
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
                        user =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
                                    linux =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType 'Record,
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.records.required
                                              [ "gid", "uid" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                gid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                                supplementalGroups =
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
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                                uid =
                                                  _js2n__-prdslib.isType
                                                      'Integer,
                                              } {} false _js2n__-prdslib.never
                                          ],
                                  } {} false _js2n__-prdslib.never
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Statuses of init containers in this pod. The most recent successful non-restartable init container will have ready = true, the most recently started container will have startTime set. Each init container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-and-container-status"
        | optional,
      message
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "A human readable message indicating details about why the pod is in this condition."
        | optional,
      nominatedNodeName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "nominatedNodeName is set only when this pod preempts other pods on the node, but it cannot be scheduled right away as preemption victims receive their graceful termination periods. This field does not guarantee that the pod will be scheduled on this node. Scheduler may decide to place the pod elsewhere if other nodes become available sooner. Scheduler may also decide to give the resources on this node to a higher priority pod that is created after preemption. As a result, this field may be different than PodSpec.nodeName when the pod is scheduled."
        | optional,
      phase
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The conditions array, the reason and message fields, and the individual container status arrays contain more detail about the pod's status. There are five possible phase values:
          
          Pending: The pod has been accepted by the Kubernetes system, but one or more of the container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while. Running: The pod has been bound to a node, and all of the containers have been created. At least one container is still running, or is in the process of starting or restarting. Succeeded: All containers in the pod have terminated in success, and will not be restarted. Failed: All containers in the pod have terminated, and at least one container has terminated in failure. The container either exited with non-zero status or was terminated by the system. Unknown: For some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod.
          
          More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase
        "%
        | optional,
      podIP
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "podIP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated."
        | optional,
      podIPs
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
                      { ip = _js2n__-prdslib.isType '"String", } {} false
                      _js2n__-prdslib.never
                  ])
            ])
        | doc "podIPs holds the IP addresses allocated to the pod. If this field is specified, the 0th entry must match the podIP field. Pods may be allocated at most 1 value for each of IPv4 and IPv6. This list is empty if no IPs have been allocated yet."
        | optional,
      qosClass
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-qos/#quality-of-service-classes"
        | optional,
      reason
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "A brief CamelCase message indicating details about why the pod is in this state. e.g. 'Evicted'"
        | optional,
      resize
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Status of resources resize desired for pod's containers. It is empty if no resources resize is pending. Any changes to container resources will automatically set this to \"Proposed\""
        | optional,
      resourceClaimStatuses
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
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Status of resource claims."
        | optional,
      startTime
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers."
        | optional,
    }