# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      preferredDuringSchedulingIgnoredDuringExecution
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
                    _js2n__-prdslib.records.required [ "preference", "weight" ],
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
                                    matchFields =
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
                                  } {} false _js2n__-prdslib.never
                              ],
                        weight = _js2n__-prdslib.isType 'Integer,
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred."
        | optional,
      requiredDuringSchedulingIgnoredDuringExecution
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "nodeSelectorTerms" ],
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
                                    matchFields =
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
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms."
        | optional,
    }