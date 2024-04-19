# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      items
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
                    _js2n__-prdslib.records.required [ "path" ],
                    _js2n__-prdslib.records.record
                      {
                        fieldRef =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required
                                  [ "fieldPath" ],
                                _js2n__-prdslib.records.record
                                  {
                                    apiVersion =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    fieldPath =
                                      _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                        mode =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        path = _js2n__-prdslib.isType '"String",
                        resourceFieldRef =
                          _js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.anyOf
                                  [
                                    _js2n__-prdslib.isType 'Record,
                                    _js2n__-prdslib.isType 'Null
                                  ],
                                _js2n__-prdslib.records.required [ "resource" ],
                                _js2n__-prdslib.records.record
                                  {
                                    containerName =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    divisor =
                                      _js2n__-prdslib.oneOf
                                          [
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType
                                                  '"String",
                                                _js2n__-prdslib.isType 'Null
                                              ],
                                            _js2n__-prdslib.anyOf
                                              [
                                                _js2n__-prdslib.isType
                                                  '"Number",
                                                _js2n__-prdslib.isType 'Null
                                              ]
                                          ],
                                    resource = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ],
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Items is a list of DownwardAPIVolume file"
        | optional,
    }