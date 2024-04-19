# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      egress
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
                                      _js2n__-prdslib.records.record
                                        {
                                          endPort =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
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
                        to =
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
                                          ipBlock =
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
                                                    [ "cidr" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      cidr =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      except =
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
                                                                      } {} false
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
                                          podSelector =
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
                                                                      } {} false
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "egress is a list of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8"
        | optional,
      ingress
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
                        from =
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
                                          ipBlock =
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
                                                    [ "cidr" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      cidr =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      except =
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
                                                                      } {} false
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
                                          podSelector =
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
                                                                      } {} false
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
                                        } {} false _js2n__-prdslib.never
                                    ])
                              ],
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
                                      _js2n__-prdslib.records.record
                                        {
                                          endPort =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
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
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "ingress is a list of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default)"
        | optional,
      podSelector
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
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "key", "operator" ],
                                _js2n__-prdslib.records.record
                                  {
                                    key = _js2n__-prdslib.isType '"String",
                                    operator = _js2n__-prdslib.isType '"String",
                                    values =
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
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.",
      policyTypes
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
        | doc "policyTypes is a list of rule types that the NetworkPolicy relates to. Valid options are [\"Ingress\"], [\"Egress\"], or [\"Ingress\", \"Egress\"]. If this field is not specified, it will default based on the existence of ingress or egress rules; policies that contain an egress section are assumed to affect egress, and all policies (whether or not they contain an ingress section) are assumed to affect ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ \"Egress\" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include \"Egress\" (since such a policy would not include an egress section and would otherwise default to just [ \"Ingress\" ]). This field is beta-level in 1.8"
        | optional,
    }