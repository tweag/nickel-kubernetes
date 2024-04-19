# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      postStart
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
                  exec =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              command =
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
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  httpGet =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              httpHeaders =
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
                                              [ "name", "value" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                name =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                value =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              path =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              scheme =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  sleep =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "seconds" ],
                          _js2n__-prdslib.records.record
                            { seconds = _js2n__-prdslib.isType 'Integer, } {}
                            false _js2n__-prdslib.never
                        ],
                  tcpSocket =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One and only one of the fields, except TCPSocket must be specified."
        | optional,
      preStop
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
                  exec =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              command =
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
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  httpGet =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              httpHeaders =
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
                                              [ "name", "value" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                name =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                value =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              path =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                              scheme =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  sleep =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "seconds" ],
                          _js2n__-prdslib.records.record
                            { seconds = _js2n__-prdslib.isType 'Integer, } {}
                            false _js2n__-prdslib.never
                        ],
                  tcpSocket =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.required [ "port" ],
                          _js2n__-prdslib.records.record
                            {
                              host =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              port =
                                _js2n__-prdslib.oneOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType '"String",
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Integer,
                                          _js2n__-prdslib.isType 'Null
                                        ]
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One and only one of the fields, except TCPSocket must be specified."
        | optional,
    }