# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      availableOnNodes
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
      resourceHandles
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
                        data =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        driverName =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc m%"
          ResourceHandles contain the state associated with an allocation that should be maintained throughout the lifetime of a claim. Each ResourceHandle contains data that should be passed to a specific kubelet plugin once it lands on a node. This data is returned by the driver after a successful allocation and is opaque to Kubernetes. Driver documentation may explain to users how to interpret this data if needed.
          
          Setting this field is optional. It has a maximum size of 32 entries. If null (or empty), it is assumed this allocation will be processed by a single kubelet plugin with no ResourceHandle data attached. The name of the kubelet plugin invoked will match the DriverName set in the ResourceClaimStatus this AllocationResult is embedded in.
        "%
        | optional,
      shareable
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"Bool", _js2n__-prdslib.isType 'Null ])
        | doc "Shareable determines whether the resource supports more than one consumer at a time."
        | optional,
    }