# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      distinguisherMethod
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                { type = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ])
        | doc "FlowDistinguisherMethod specifies the method of a flow distinguisher."
        | optional,
      matchingPrecedence
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "`matchingPrecedence` is used to choose among the FlowSchemas that match a given request. The chosen FlowSchema is among those with the numerically lowest (which we take to be logically highest) MatchingPrecedence.  Each MatchingPrecedence value must be ranged in [1,10000]. Note that if the precedence is not specified, it will be set to 1000 as default."
        | optional,
      priorityLevelConfiguration
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
        | doc "PriorityLevelConfigurationReference contains information that points to the \"request-priority\" being used.",
      rules
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
                    _js2n__-prdslib.records.required [ "subjects" ],
                    _js2n__-prdslib.records.record
                      {
                        nonResourceRules =
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
                                        [ "nonResourceURLs", "verbs" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          nonResourceURLs =
                                            _js2n__-prdslib.allOf
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
                                          verbs =
                                            _js2n__-prdslib.allOf
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        resourceRules =
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
                                        [ "apiGroups", "resources", "verbs" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          apiGroups =
                                            _js2n__-prdslib.allOf
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
                                          clusterScope =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"Bool",
                                                  _js2n__-prdslib.isType 'Null
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
                                          resources =
                                            _js2n__-prdslib.allOf
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
                                          verbs =
                                            _js2n__-prdslib.allOf
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                        subjects =
                          _js2n__-prdslib.allOf
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
                                      _js2n__-prdslib.records.required
                                        [ "kind" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          group =
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
                                                    [ "name" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                          kind =
                                            _js2n__-prdslib.isType '"String",
                                          serviceAccount =
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
                                                    [ "name", "namespace" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      namespace =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                          user =
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
                                                    [ "name" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      name =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "`rules` describes which requests will match this flow schema. This FlowSchema matches a request if and only if at least one member of rules matches the request. if it is an empty slice, there will be no requests matching the FlowSchema."
        | optional,
    }