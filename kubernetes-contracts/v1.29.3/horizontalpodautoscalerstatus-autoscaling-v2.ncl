# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      conditions
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
                    _js2n__-prdslib.records.required [ "status", "type" ],
                    _js2n__-prdslib.records.record
                      {
                        lastTransitionTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        message =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        reason =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        status = _js2n__-prdslib.isType '"String",
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "conditions is the set of conditions required for this autoscaler to scale its target, and indicates whether or not those conditions are met."
        | optional,
      currentMetrics
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
                    _js2n__-prdslib.records.required [ "type" ],
                    _js2n__-prdslib.records.record
                      {
                        containerResource =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "container", "current", "name" ],
                                _js2n__-prdslib.records.record
                                  {
                                    container =
                                      _js2n__-prdslib.isType '"String",
                                    current =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    name = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        external =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "current", "metric" ],
                                _js2n__-prdslib.records.record
                                  {
                                    current =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    metric =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.required
                                              [ "name" ],
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
                                                                            } {}
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
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        object =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "current", "describedObject", "metric" ],
                                _js2n__-prdslib.records.record
                                  {
                                    current =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    describedObject =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    metric =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.required
                                              [ "name" ],
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
                                                                            } {}
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
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        pods =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "current", "metric" ],
                                _js2n__-prdslib.records.record
                                  {
                                    current =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    metric =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.required
                                              [ "name" ],
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
                                                                            } {}
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
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ],
                        resource =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "current", "name" ],
                                _js2n__-prdslib.records.record
                                  {
                                    current =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    name = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "currentMetrics is the last read state of the metrics used by this autoscaler."
        | optional,
      currentReplicas
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler."
        | optional,
      desiredReplicas
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.",
      lastScaleTime
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers."
        | optional,
      observedGeneration
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "observedGeneration is the most recent generation observed by this autoscaler."
        | optional,
    }