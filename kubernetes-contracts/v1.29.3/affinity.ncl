# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      nodeAffinity
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
                  preferredDuringSchedulingIgnoredDuringExecution =
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
                                  [ "preference", "weight" ],
                                _js2n__-prdslib.records.record
                                  {
                                    preference =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
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
                                                matchFields =
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
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    weight = _js2n__-prdslib.isType 'Integer,
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required
                            [ "nodeSelectorTerms" ],
                          _js2n__-prdslib.records.record
                            {
                              nodeSelectorTerms =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.isType '"Array",
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
                                                matchFields =
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
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "Node affinity is a group of node affinity scheduling rules."
        | optional,
      podAffinity
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
                  preferredDuringSchedulingIgnoredDuringExecution =
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
                                  [ "podAffinityTerm", "weight" ],
                                _js2n__-prdslib.records.record
                                  {
                                    podAffinityTerm =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.required
                                              [ "topologyKey" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                labelSelector =
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
                                                matchLabelKeys =
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
                                                mismatchLabelKeys =
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
                                                topologyKey =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    weight = _js2n__-prdslib.isType 'Integer,
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
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
                                  [ "topologyKey" ],
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
                                    matchLabelKeys =
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
                                    mismatchLabelKeys =
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
                                    namespaceSelector =
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
                                    namespaces =
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
                                    topologyKey =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "Pod affinity is a group of inter pod affinity scheduling rules."
        | optional,
      podAntiAffinity
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
                  preferredDuringSchedulingIgnoredDuringExecution =
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
                                  [ "podAffinityTerm", "weight" ],
                                _js2n__-prdslib.records.record
                                  {
                                    podAffinityTerm =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.required
                                              [ "topologyKey" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                labelSelector =
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
                                                matchLabelKeys =
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
                                                mismatchLabelKeys =
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
                                                topologyKey =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    weight = _js2n__-prdslib.isType 'Integer,
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
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
                                  [ "topologyKey" ],
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
                                    matchLabelKeys =
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
                                    mismatchLabelKeys =
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
                                    namespaceSelector =
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
                                    namespaces =
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
                                    topologyKey =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "Pod anti affinity is a group of inter pod anti affinity scheduling rules."
        | optional,
    }