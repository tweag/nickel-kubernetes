# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      hard
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record {} {} true
                (_js2n__-prdslib.oneOf
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
                  ])
            ])
        | doc "Hard is the set of enforced hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/"
        | optional,
      used
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record {} {} true
                (_js2n__-prdslib.oneOf
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
                  ])
            ])
        | doc "Used is the current observed total usage of the resource in the namespace."
        | optional,
    }