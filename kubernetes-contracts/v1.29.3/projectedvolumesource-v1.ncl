# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      defaultMode
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "defaultMode are the mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set."
        | optional,
      sources
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
                        clusterTrustBundle =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "path" ],
                                _js2n__-prdslib.records.record
                                  {
                                    labelSelector =
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
                                    name =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    "optional" =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    path = _js2n__-prdslib.isType '"String",
                                    signerName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        configMap =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
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
                                                      _js2n__-prdslib.isType
                                                        'Record,
                                                      _js2n__-prdslib.isType
                                                        'Null
                                                    ],
                                                  _js2n__-prdslib.records.required
                                                    [ "key", "path" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      key =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      mode =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                      path =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    name =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    "optional" =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        downwardAPI =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
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
                                                      _js2n__-prdslib.isType
                                                        'Record,
                                                      _js2n__-prdslib.isType
                                                        'Null
                                                    ],
                                                  _js2n__-prdslib.records.required
                                                    [ "path" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      fieldRef =
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
                                                                [ "fieldPath" ],
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
                                                                  fieldPath =
                                                                    _js2n__-prdslib.isType
                                                                        '"String",
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                      mode =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                      path =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      resourceFieldRef =
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
                                                                [ "resource" ],
                                                              _js2n__-prdslib.records.record
                                                                {
                                                                  containerName =
                                                                    _js2n__-prdslib.anyOf
                                                                        [
                                                                          _js2n__-prdslib.isType
                                                                            '"String",
                                                                          _js2n__-prdslib.isType
                                                                            'Null
                                                                        ],
                                                                  divisor =
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
                                                                  resource =
                                                                    _js2n__-prdslib.isType
                                                                        '"String",
                                                                } {} false
                                                                _js2n__-prdslib.never
                                                            ],
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        secret =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.record
                                  {
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
                                                      _js2n__-prdslib.isType
                                                        'Record,
                                                      _js2n__-prdslib.isType
                                                        'Null
                                                    ],
                                                  _js2n__-prdslib.records.required
                                                    [ "key", "path" ],
                                                  _js2n__-prdslib.records.record
                                                    {
                                                      key =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                      mode =
                                                        _js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                'Integer,
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ],
                                                      path =
                                                        _js2n__-prdslib.isType
                                                            '"String",
                                                    } {} false
                                                    _js2n__-prdslib.never
                                                ])
                                          ],
                                    name =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    "optional" =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"Bool",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        serviceAccountToken =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "path" ],
                                _js2n__-prdslib.records.record
                                  {
                                    audience =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    expirationSeconds =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType 'Integer,
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    path = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "sources is the list of volume projections"
        | optional,
    }