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
                      _js2n__-prdslib.enum [ "certificates.k8s.io/v1alpha1" ]
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
                            _js2n__-prdslib.records.required [ "spec" ],
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
                                          [ "certificates.k8s.io/v1alpha1" ]
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
                                          [ "ClusterTrustBundle" ]
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
                                        _js2n__-prdslib.isType 'Record,
                                        _js2n__-prdslib.records.required
                                          [ "trustBundle" ],
                                        _js2n__-prdslib.records.record
                                          {
                                            signerName =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            trustBundle =
                                              _js2n__-prdslib.isType '"String",
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
                      _js2n__-prdslib.enum [ "ClusterTrustBundleList" ]
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