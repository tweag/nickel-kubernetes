# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  _js2n__-prdslib.contract_from_predicate
      (_js2n__-prdslib.allOf
        [
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.records.record
            {
              apiVersion =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum [ "policy/v1" ]
                    ],
              kind =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum [ "PodDisruptionBudget" ]
                    ],
              metadata =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.record
                        {
                          annotations =
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
                          creationTimestamp =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          deletionGracePeriodSeconds =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                          deletionTimestamp =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          finalizers =
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
                          generateName =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          generation =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                          labels =
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
                          managedFields =
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
                                            apiVersion =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            fieldsType =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            fieldsV1 =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Record,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            manager =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            operation =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            subresource =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            time =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          name =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          namespace =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          ownerReferences =
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
                                          [
                                            "apiVersion",
                                            "kind",
                                            "name",
                                            "uid"
                                          ],
                                        _js2n__-prdslib.records.record
                                          {
                                            apiVersion =
                                              _js2n__-prdslib.isType '"String",
                                            blockOwnerDeletion =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            controller =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"Bool",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            kind =
                                              _js2n__-prdslib.isType '"String",
                                            name =
                                              _js2n__-prdslib.isType '"String",
                                            uid =
                                              _js2n__-prdslib.isType '"String",
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          resourceVersion =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          selfLink =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          uid =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                        } {} false _js2n__-prdslib.never
                    ],
              spec =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.record
                        {
                          maxUnavailable =
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
                          minAvailable =
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
                          selector =
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
                                                  _js2n__-prdslib.isType
                                                    '"Array",
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
                                                  _js2n__-prdslib.isType
                                                    'Record,
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                              _js2n__-prdslib.records.record {}
                                                {} true
                                                (_js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ])
                                            ],
                                    } {} false _js2n__-prdslib.never
                                ],
                          unhealthyPodEvictionPolicy =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                        } {} false _js2n__-prdslib.never
                    ],
              status =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.required
                        [
                          "currentHealthy",
                          "desiredHealthy",
                          "disruptionsAllowed",
                          "expectedPods"
                        ],
                      _js2n__-prdslib.records.record
                        {
                          conditions =
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
                                          [
                                            "lastTransitionTime",
                                            "message",
                                            "reason",
                                            "status",
                                            "type"
                                          ],
                                        _js2n__-prdslib.records.record
                                          {
                                            lastTransitionTime =
                                              _js2n__-prdslib.isType '"String",
                                            message =
                                              _js2n__-prdslib.isType '"String",
                                            observedGeneration =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            reason =
                                              _js2n__-prdslib.isType '"String",
                                            status =
                                              _js2n__-prdslib.isType '"String",
                                            type =
                                              _js2n__-prdslib.isType '"String",
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          currentHealthy = _js2n__-prdslib.isType 'Integer,
                          desiredHealthy = _js2n__-prdslib.isType 'Integer,
                          disruptedPods =
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
                          disruptionsAllowed = _js2n__-prdslib.isType 'Integer,
                          expectedPods = _js2n__-prdslib.isType 'Integer,
                          observedGeneration =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                        } {} false _js2n__-prdslib.never
                    ],
            } {} false _js2n__-prdslib.never
        ])