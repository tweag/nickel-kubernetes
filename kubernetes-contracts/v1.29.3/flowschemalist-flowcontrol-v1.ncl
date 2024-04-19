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
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum [ "flowcontrol.apiserver.k8s.io/v1" ]
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
                                  _js2n__-prdslib.allOf
                                      [
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                        _js2n__-prdslib.enum
                                          [ "flowcontrol.apiserver.k8s.io/v1" ]
                                      ],
                                kind =
                                  _js2n__-prdslib.allOf
                                      [
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                        _js2n__-prdslib.enum [ "FlowSchema" ]
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
                                          [ "priorityLevelConfiguration" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            distinguisherMethod =
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
                                                      [ "type" ],
                                                    _js2n__-prdslib.records.record
                                                      {
                                                        type =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            matchingPrecedence =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Integer,
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            priorityLevelConfiguration =
                                              _js2n__-prdslib.allOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      'Record,
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
                                            rules =
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
                                                            [ "subjects" ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              nonResourceRules =
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
                                                                                "nonResourceURLs",
                                                                                "verbs"
                                                                              ],
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
                                                                              }
                                                                              {}
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                          ])
                                                                    ],
                                                              resourceRules =
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
                                                                                "apiGroups",
                                                                                "resources",
                                                                                "verbs"
                                                                              ],
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
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
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
                                                                              }
                                                                              {}
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                          ])
                                                                    ],
                                                              subjects =
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
                                                                            _js2n__-prdslib.records.required
                                                                              [
                                                                                "kind"
                                                                              ],
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
                                                                                          [
                                                                                            "name"
                                                                                          ],
                                                                                        _js2n__-prdslib.records.record
                                                                                          {
                                                                                            name =
                                                                                              _js2n__-prdslib.isType
                                                                                                  '"String",
                                                                                          }
                                                                                          {}
                                                                                          false
                                                                                          _js2n__-prdslib.never
                                                                                      ],
                                                                                kind =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
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
                                                                                          [
                                                                                            "name",
                                                                                            "namespace"
                                                                                          ],
                                                                                        _js2n__-prdslib.records.record
                                                                                          {
                                                                                            name =
                                                                                              _js2n__-prdslib.isType
                                                                                                  '"String",
                                                                                            namespace =
                                                                                              _js2n__-prdslib.isType
                                                                                                  '"String",
                                                                                          }
                                                                                          {}
                                                                                          false
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
                                                                                          [
                                                                                            "name"
                                                                                          ],
                                                                                        _js2n__-prdslib.records.record
                                                                                          {
                                                                                            name =
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
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
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
                      _js2n__-prdslib.enum [ "FlowSchemaList" ]
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