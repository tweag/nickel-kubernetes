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
                    _js2n__-prdslib.records.required
                      [
                        "lastTransitionTime",
                        "message",
                        "reason",
                        "status",
                        "type"
                      ],
                    _js2n__-prdslib.records.record
                      {
                        lastTransitionTime = _js2n__-prdslib.isType '"String",
                        message = _js2n__-prdslib.isType '"String",
                        observedGeneration =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType 'Integer,
                                _js2n__-prdslib.isType 'Null
                              ],
                        reason = _js2n__-prdslib.isType '"String",
                        status = _js2n__-prdslib.isType '"String",
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "conditions holds an array of metav1.Condition that describe the state of the ServiceCIDR. Current service state"
        | optional,
    }