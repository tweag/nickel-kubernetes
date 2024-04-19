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
          _js2n__-prdslib.records.required [ "name", "versions" ],
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
                      _js2n__-prdslib.enum [ "APIGroup" ]
                    ],
              name =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              preferredVersion =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.required
                        [ "groupVersion", "version" ],
                      _js2n__-prdslib.records.record
                        {
                          groupVersion = _js2n__-prdslib.isType '"String",
                          version = _js2n__-prdslib.isType '"String",
                        } {} false _js2n__-prdslib.never
                    ],
              serverAddressByClientCIDRs =
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
                              [ "clientCIDR", "serverAddress" ],
                            _js2n__-prdslib.records.record
                              {
                                clientCIDR = _js2n__-prdslib.isType '"String",
                                serverAddress =
                                  _js2n__-prdslib.isType '"String",
                              } {} false _js2n__-prdslib.never
                          ])
                    ],
              versions =
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
                              [ "groupVersion", "version" ],
                            _js2n__-prdslib.records.record
                              {
                                groupVersion = _js2n__-prdslib.isType '"String",
                                version = _js2n__-prdslib.isType '"String",
                              } {} false _js2n__-prdslib.never
                          ])
                    ],
            } {} false _js2n__-prdslib.never
        ])