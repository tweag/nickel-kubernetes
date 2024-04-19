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
                      _js2n__-prdslib.enum [ "v1" ]
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
                                        _js2n__-prdslib.enum [ "v1" ]
                                      ],
                                kind =
                                  _js2n__-prdslib.allOf
                                      [
                                        _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                        _js2n__-prdslib.enum [ "Node" ]
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
                                        _js2n__-prdslib.records.record
                                          {
                                            configSource =
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
                                                        configMap =
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
                                                                    "kubeletConfigKey",
                                                                    "name",
                                                                    "namespace"
                                                                  ],
                                                                _js2n__-prdslib.records.record
                                                                  {
                                                                    kubeletConfigKey =
                                                                      _js2n__-prdslib.isType
                                                                          '"String",
                                                                    name =
                                                                      _js2n__-prdslib.isType
                                                                          '"String",
                                                                    namespace =
                                                                      _js2n__-prdslib.isType
                                                                          '"String",
                                                                    resourceVersion =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                    uid =
                                                                      _js2n__-prdslib.anyOf
                                                                          [
                                                                            _js2n__-prdslib.isType
                                                                              '"String",
                                                                            _js2n__-prdslib.isType
                                                                              'Null
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            externalID =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            podCIDR =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            podCIDRs =
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
                                            providerID =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            taints =
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
                                                            [ "effect", "key" ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              effect =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                              key =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                              timeAdded =
                                                                _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                        '"String",
                                                                      _js2n__-prdslib.isType
                                                                        'Null
                                                                    ],
                                                              value =
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
                                            unschedulable =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"Bool",
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
                                        _js2n__-prdslib.records.record
                                          {
                                            addresses =
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
                                                              "address",
                                                              "type"
                                                            ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              address =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                              type =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            allocatable =
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
                                            capacity =
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
                                                              lastHeartbeatTime =
                                                                _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                        '"String",
                                                                      _js2n__-prdslib.isType
                                                                        'Null
                                                                    ],
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
                                            config =
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
                                                        active =
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
                                                                    configMap =
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
                                                                                "kubeletConfigKey",
                                                                                "name",
                                                                                "namespace"
                                                                              ],
                                                                            _js2n__-prdslib.records.record
                                                                              {
                                                                                kubeletConfigKey =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                name =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                namespace =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                resourceVersion =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                                uid =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                              }
                                                                              {}
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                        assigned =
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
                                                                    configMap =
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
                                                                                "kubeletConfigKey",
                                                                                "name",
                                                                                "namespace"
                                                                              ],
                                                                            _js2n__-prdslib.records.record
                                                                              {
                                                                                kubeletConfigKey =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                name =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                namespace =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                resourceVersion =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                                uid =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                              }
                                                                              {}
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                        error =
                                                          _js2n__-prdslib.anyOf
                                                              [
                                                                _js2n__-prdslib.isType
                                                                  '"String",
                                                                _js2n__-prdslib.isType
                                                                  'Null
                                                              ],
                                                        lastKnownGood =
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
                                                                    configMap =
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
                                                                                "kubeletConfigKey",
                                                                                "name",
                                                                                "namespace"
                                                                              ],
                                                                            _js2n__-prdslib.records.record
                                                                              {
                                                                                kubeletConfigKey =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                name =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                namespace =
                                                                                  _js2n__-prdslib.isType
                                                                                      '"String",
                                                                                resourceVersion =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                                uid =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                              }
                                                                              {}
                                                                              false
                                                                              _js2n__-prdslib.never
                                                                          ],
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            daemonEndpoints =
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
                                                        kubeletEndpoint =
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
                                                                  [ "Port" ],
                                                                _js2n__-prdslib.records.record
                                                                  {
                                                                    Port =
                                                                      _js2n__-prdslib.isType
                                                                          'Integer,
                                                                  } {} false
                                                                  _js2n__-prdslib.never
                                                              ],
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            images =
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
                                                              names =
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
                                                              sizeBytes =
                                                                _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                        'Integer,
                                                                      _js2n__-prdslib.isType
                                                                        'Null
                                                                    ],
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            nodeInfo =
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
                                                        "architecture",
                                                        "bootID",
                                                        "containerRuntimeVersion",
                                                        "kernelVersion",
                                                        "kubeProxyVersion",
                                                        "kubeletVersion",
                                                        "machineID",
                                                        "operatingSystem",
                                                        "osImage",
                                                        "systemUUID"
                                                      ],
                                                    _js2n__-prdslib.records.record
                                                      {
                                                        architecture =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        bootID =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        containerRuntimeVersion =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        kernelVersion =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        kubeProxyVersion =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        kubeletVersion =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        machineID =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        operatingSystem =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        osImage =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                        systemUUID =
                                                          _js2n__-prdslib.isType
                                                              '"String",
                                                      } {} false
                                                      _js2n__-prdslib.never
                                                  ],
                                            phase =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
                                                  ],
                                            volumesAttached =
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
                                                              "devicePath",
                                                              "name"
                                                            ],
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              devicePath =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                              name =
                                                                _js2n__-prdslib.isType
                                                                    '"String",
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            volumesInUse =
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
                      _js2n__-prdslib.enum [ "NodeList" ]
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