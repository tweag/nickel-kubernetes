# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      containerResource
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required
                [ "container", "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  container = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  target =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              averageUtilization =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              averageValue =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                              value =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ContainerResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source.  Only one \"target\" type should be set."
        | optional,
      external
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "name" ],
                          _js2n__-prdslib.records.record
                            {
                              name = _js2n__-prdslib.isType '"String",
                              selector =
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
                            } {} false _js2n__-prdslib.never
                        ],
                  target =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              averageUtilization =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              averageValue =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                              value =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ExternalMetricSource indicates how to scale on a metric not associated with any Kubernetes object (for example length of queue in cloud messaging service, or QPS from loadbalancer running outside of cluster)."
        | optional,
      object
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required
                [ "describedObject", "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  describedObject =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "kind", "name" ],
                          _js2n__-prdslib.records.record
                            {
                              apiVersion =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              kind = _js2n__-prdslib.isType '"String",
                              name = _js2n__-prdslib.isType '"String",
                            } {} false _js2n__-prdslib.never
                        ],
                  metric =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "name" ],
                          _js2n__-prdslib.records.record
                            {
                              name = _js2n__-prdslib.isType '"String",
                              selector =
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
                            } {} false _js2n__-prdslib.never
                        ],
                  target =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              averageUtilization =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              averageValue =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                              value =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object)."
        | optional,
      pods
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "name" ],
                          _js2n__-prdslib.records.record
                            {
                              name = _js2n__-prdslib.isType '"String",
                              selector =
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
                            } {} false _js2n__-prdslib.never
                        ],
                  target =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              averageUtilization =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              averageValue =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                              value =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value."
        | optional,
      resource
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  target =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.required [ "type" ],
                          _js2n__-prdslib.records.record
                            {
                              averageUtilization =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType 'Integer,
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              averageValue =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              type = _js2n__-prdslib.isType '"String",
                              value =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"Number",
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source.  Only one \"target\" type should be set."
        | optional,
      type
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "type is the type of metric source.  It should be one of \"ContainerResource\", \"External\", \"Object\", \"Pods\" or \"Resource\", each mapping to a matching field in the object. Note: \"ContainerResource\" type is available on when the feature-gate HPAContainerMetrics is enabled",
    }