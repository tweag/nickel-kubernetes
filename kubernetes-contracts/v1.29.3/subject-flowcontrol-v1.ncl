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
          _js2n__-prdslib.records.required [ "kind" ],
          _js2n__-prdslib.records.record
            {
              group =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.required [ "name" ],
                      _js2n__-prdslib.records.record
                        { name = _js2n__-prdslib.isType '"String", } {} false
                        _js2n__-prdslib.never
                    ],
              kind =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
              serviceAccount =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.required [ "name", "namespace" ],
                      _js2n__-prdslib.records.record
                        {
                          name = _js2n__-prdslib.isType '"String",
                          namespace = _js2n__-prdslib.isType '"String",
                        } {} false _js2n__-prdslib.never
                    ],
              user =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.required [ "name" ],
                      _js2n__-prdslib.records.record
                        { name = _js2n__-prdslib.isType '"String", } {} false
                        _js2n__-prdslib.never
                    ],
            } {} false _js2n__-prdslib.never
        ])