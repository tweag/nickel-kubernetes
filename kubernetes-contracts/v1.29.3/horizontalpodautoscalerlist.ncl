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
          _js2n__-prdslib.records.required [ "items" ],
          _js2n__-prdslib.records.record
            {
              apiVersion =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
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
                                  _js2n__-prdslib.allOf
                                      [
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                        _js2n__-prdslib.enum
                                          [ "HorizontalPodAutoscaler" ]
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
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            deletionGracePeriodSeconds =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            deletionTimestamp =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
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
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            generation =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
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
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            name =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            namespace =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
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
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            resourceVersion =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            selfLink =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            uid =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
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
                                        _js2n__-prdslib.records.required
                                          [ "maxReplicas", "scaleTargetRef" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            behavior =
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
                                                        scaleDown =
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
                                                                    policies =
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
                                                                                      "periodSeconds",
                                                                                      "type",
                                                                                      "value"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      periodSeconds =
                                                                                        _js2n__-prdslib.isType
                                                                                            'Integer,
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
                                                                                        _js2n__-prdslib.isType
                                                                                            'Integer,
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ])
                                                                          ],
                                                                    selectPolicy =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                    stabilizationWindowSeconds =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              'Integer,
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                        scaleUp =
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
                                                                    policies =
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
                                                                                      "periodSeconds",
                                                                                      "type",
                                                                                      "value"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      periodSeconds =
                                                                                        _js2n__-prdslib.isType
                                                                                            'Integer,
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
                                                                                        _js2n__-prdslib.isType
                                                                                            'Integer,
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ])
                                                                          ],
                                                                    selectPolicy =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                    stabilizationWindowSeconds =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              'Integer,
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            maxReplicas =
                                              _js2n__-prdslib.isType 'Integer,
                                            metrics =
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
                                                            [ "type" ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              containerResource =
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
                                                                          "container",
                                                                          "name",
                                                                          "target"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          container =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                          name =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                          target =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "type"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              external =
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
                                                                          "metric",
                                                                          "target"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          target =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "type"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              object =
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
                                                                          "describedObject",
                                                                          "metric",
                                                                          "target"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          describedObject =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "kind",
                                                                                      "name"
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
                                                                                      kind =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          target =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "type"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              pods =
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
                                                                          "metric",
                                                                          "target"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          target =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "type"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              resource =
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
                                                                          "name",
                                                                          "target"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          name =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                          target =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "type"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      type =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              type =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            minReplicas =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            scaleTargetRef =
                                              _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Record,
                                                    _js2n__-prdslib.records.required
                                                      [ "kind", "name" ],
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
                                                        kind =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        name =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                      } {} false
                                                      _js2n__-prdslib.never
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
                                          [ "desiredReplicas" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            conditions =
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
                                                              "status",
                                                              "type"
                                                            ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              lastTransitionTime =
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
                                                              status =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                              type =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            currentMetrics =
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
                                                            [ "type" ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              containerResource =
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
                                                                          "container",
                                                                          "current",
                                                                          "name"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          container =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                          current =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          name =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              external =
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
                                                                          "current",
                                                                          "metric"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          current =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              object =
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
                                                                          "current",
                                                                          "describedObject",
                                                                          "metric"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          current =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          describedObject =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "kind",
                                                                                      "name"
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
                                                                                      kind =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              pods =
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
                                                                          "current",
                                                                          "metric"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          current =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          metric =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.required
                                                                                    [
                                                                                      "name"
                                                                                    ],
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      name =
                                                                                        _js2n__-prdslib.isType
                                                                                            '"String",
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
                                                                                                }
                                                                                                {}
                                                                                                false
                                                                                                _js2n__-prdslib.never
                                                                                            ],
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              resource =
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
                                                                          "current",
                                                                          "name"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          current =
                                                                            _js2n__-prdslib.allOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    'Record,
                                                                                  _js2n__-prdslib.records.record
                                                                                    {
                                                                                      averageUtilization =
                                                                                        _js2n__-prdslib.anyOf
                                                                                            [
                                                                                              _js2n__-prdslib.isType
                                                                                                'Integer,
                                                                                              _js2n__-prdslib.isType
                                                                                                'Null
                                                                                            ],
                                                                                      averageValue =
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
                                                                                      value =
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
                                                                                    }
                                                                                    {}
                                                                                    false
                                                                                    _js2n__-prdslib.never
                                                                                ],
                                                                          name =
                                                                            _js2n__-prdslib.isType
                                                                                '"String",
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                              type =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            currentReplicas =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            desiredReplicas =
                                              _js2n__-prdslib.isType 'Integer,
                                            lastScaleTime =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            observedGeneration =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                          } {} false _js2n__-prdslib.never
                                      ],
                              } {} false _js2n__-prdslib.never
                          ])
                    ],
              kind =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum [ "HorizontalPodAutoscalerList" ]
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
                          continue =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          remainingItemCount =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType 'Integer,
                                  _js2n__-prdslib.isType 'Null
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
                        } {} false _js2n__-prdslib.never
                    ],
            } {} false _js2n__-prdslib.never
        ])