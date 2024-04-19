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
                                        _js2n__-prdslib.enum [ "Ingress" ]
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
                                            defaultBackend =
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
                                                                    "kind",
                                                                    "name"
                                                                  ],
                                                                _js2n__-prdslib.records.record
                                                                  {
                                                                    apiGroup =
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
                                                        service =
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
                                                                    port =
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
                                                                                name =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          '"String",
                                                                                        _js2n__-prdslib.isType
                                                                                          'Null
                                                                                      ],
                                                                                number =
                                                                                  _js2n__-prdslib.anyOf
                                                                                      [
                                                                                        _js2n__-prdslib.isType
                                                                                          'Integer,
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
                                            ingressClassName =
                                              _js2n__-prdslib.anyOf
                                                  [
                                                    _js2n__-prdslib.isType
                                                      '"String",
                                                    _js2n__-prdslib.isType 'Null
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
                                                          _js2n__-prdslib.records.record
                                                            {
                                                              host =
                                                                _js2n__-prdslib.anyOf
                                                                    [
                                                                      _js2n__-prdslib.isType
                                                                        '"String",
                                                                      _js2n__-prdslib.isType
                                                                        'Null
                                                                    ],
                                                              http =
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
                                                                          "paths"
                                                                        ],
                                                                      _js2n__-prdslib.records.record
                                                                        {
                                                                          paths =
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
                                                                                            "backend",
                                                                                            "pathType"
                                                                                          ],
                                                                                        _js2n__-prdslib.records.record
                                                                                          {
                                                                                            backend =
                                                                                              _js2n__-prdslib.allOf
                                                                                                  [
                                                                                                    _js2n__-prdslib.isType
                                                                                                      'Record,
                                                                                                    _js2n__-prdslib.records.record
                                                                                                      {
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
                                                                                                                    "kind",
                                                                                                                    "name"
                                                                                                                  ],
                                                                                                                _js2n__-prdslib.records.record
                                                                                                                  {
                                                                                                                    apiGroup =
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
                                                                                                        service =
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
                                                                                                                    port =
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
                                                                                                                                name =
                                                                                                                                  _js2n__-prdslib.anyOf
                                                                                                                                      [
                                                                                                                                        _js2n__-prdslib.isType
                                                                                                                                          '"String",
                                                                                                                                        _js2n__-prdslib.isType
                                                                                                                                          'Null
                                                                                                                                      ],
                                                                                                                                number =
                                                                                                                                  _js2n__-prdslib.anyOf
                                                                                                                                      [
                                                                                                                                        _js2n__-prdslib.isType
                                                                                                                                          'Integer,
                                                                                                                                        _js2n__-prdslib.isType
                                                                                                                                          'Null
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
                                                                                                      }
                                                                                                      {}
                                                                                                      false
                                                                                                      _js2n__-prdslib.never
                                                                                                  ],
                                                                                            path =
                                                                                              _js2n__-prdslib.anyOf
                                                                                                  [
                                                                                                    _js2n__-prdslib.isType
                                                                                                      '"String",
                                                                                                    _js2n__-prdslib.isType
                                                                                                      'Null
                                                                                                  ],
                                                                                            pathType =
                                                                                              _js2n__-prdslib.isType
                                                                                                  '"String",
                                                                                          }
                                                                                          {}
                                                                                          false
                                                                                          _js2n__-prdslib.never
                                                                                      ])
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ],
                                                            } {} false
                                                            _js2n__-prdslib.never
                                                        ])
                                                  ],
                                            tls =
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
                                                              hosts =
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
                                                              secretName =
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
                                            loadBalancer =
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
                                                        ingress =
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
                                                                          hostname =
                                                                            _js2n__-prdslib.anyOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                  _js2n__-prdslib.isType
                                                                                    'Null
                                                                                ],
                                                                          ip =
                                                                            _js2n__-prdslib.anyOf
                                                                                [
                                                                                  _js2n__-prdslib.isType
                                                                                    '"String",
                                                                                  _js2n__-prdslib.isType
                                                                                    'Null
                                                                                ],
                                                                          ports =
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
                                                                                            "port",
                                                                                            "protocol"
                                                                                          ],
                                                                                        _js2n__-prdslib.records.record
                                                                                          {
                                                                                            error =
                                                                                              _js2n__-prdslib.anyOf
                                                                                                  [
                                                                                                    _js2n__-prdslib.isType
                                                                                                      '"String",
                                                                                                    _js2n__-prdslib.isType
                                                                                                      'Null
                                                                                                  ],
                                                                                            port =
                                                                                              _js2n__-prdslib.isType
                                                                                                  'Integer,
                                                                                            protocol =
                                                                                              _js2n__-prdslib.isType
                                                                                                  '"String",
                                                                                          }
                                                                                          {}
                                                                                          false
                                                                                          _js2n__-prdslib.never
                                                                                      ])
                                                                                ],
                                                                        } {}
                                                                        false
                                                                        _js2n__-prdslib.never
                                                                    ])
                                                              ],
                                                      } {} false
                                                      _js2n__-prdslib.never
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
                      _js2n__-prdslib.enum [ "IngressList" ]
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