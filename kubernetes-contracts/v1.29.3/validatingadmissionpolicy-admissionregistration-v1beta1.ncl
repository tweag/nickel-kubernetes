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
                      _js2n__-prdslib.enum
                        [ "admissionregistration.k8s.io/v1beta1" ]
                    ],
              kind =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum [ "ValidatingAdmissionPolicy" ]
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
                          auditAnnotations =
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
                                          [ "key", "valueExpression" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            key =
                                              _js2n__-prdslib.isType '"String",
                                            valueExpression =
                                              _js2n__-prdslib.isType '"String",
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          failurePolicy =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          matchConditions =
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
                                          [ "expression", "name" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            expression =
                                              _js2n__-prdslib.isType '"String",
                                            name =
                                              _js2n__-prdslib.isType '"String",
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          matchConstraints =
                            _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                  _js2n__-prdslib.records.record
                                    {
                                      excludeResourceRules =
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
                                                    _js2n__-prdslib.records.record
                                                      {
                                                        apiGroups =
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
                                                        apiVersions =
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
                                                        operations =
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
                                                        resourceNames =
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
                                                        scope =
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
                                      matchPolicy =
                                        _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                      namespaceSelector =
                                        _js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Record,
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
                                                } {} false _js2n__-prdslib.never
                                            ],
                                      objectSelector =
                                        _js2n__-prdslib.allOf
                                            [
                                              _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Record,
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
                                                } {} false _js2n__-prdslib.never
                                            ],
                                      resourceRules =
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
                                                    _js2n__-prdslib.records.record
                                                      {
                                                        apiGroups =
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
                                                        apiVersions =
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
                                                        operations =
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
                                                        resourceNames =
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
                                                        scope =
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
                                    } {} false _js2n__-prdslib.never
                                ],
                          paramKind =
                            _js2n__-prdslib.allOf
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
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                      kind =
                                        _js2n__-prdslib.anyOf
                                            [
                                              _js2n__-prdslib.isType '"String",
                                              _js2n__-prdslib.isType 'Null
                                            ],
                                    } {} false _js2n__-prdslib.never
                                ],
                          validations =
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
                                          [ "expression" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            expression =
                                              _js2n__-prdslib.isType '"String",
                                            message =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            messageExpression =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            reason =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                          } {} false _js2n__-prdslib.never
                                      ])
                                ],
                          variables =
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
                                          [ "expression", "name" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            expression =
                                              _js2n__-prdslib.isType '"String",
                                            name =
                                              _js2n__-prdslib.isType '"String",
                                          } {} false _js2n__-prdslib.never
                                      ])
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
                          observedGeneration =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
                                ],
                          typeChecking =
                            _js2n__-prdslib.allOf
                                [
                                  _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Record,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                                  _js2n__-prdslib.records.record
                                    {
                                      expressionWarnings =
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
                                                      [ "fieldRef", "warning" ],
                                                    _js2n__-prdslib.records.record
                                                      {
                                                        fieldRef =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        warning =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ])
                                            ],
                                    } {} false _js2n__-prdslib.never
                                ],
                        } {} false _js2n__-prdslib.never
                    ],
            } {} false _js2n__-prdslib.never
        ])