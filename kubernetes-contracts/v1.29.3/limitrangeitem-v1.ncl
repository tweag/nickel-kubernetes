# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      "default"
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
        | doc "Default resource requirement limit value by resource name if resource limit is omitted."
        | optional,
      defaultRequest
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
        | doc "DefaultRequest is the default resource requirement request value by resource name if resource request is omitted."
        | optional,
      max
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
        | doc "Max usage constraints on this kind by resource name."
        | optional,
      maxLimitRequestRatio
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
        | doc "MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource."
        | optional,
      min
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
        | doc "Min usage constraints on this kind by resource name."
        | optional,
      type
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Type of resource that this limit applies to.",
    }