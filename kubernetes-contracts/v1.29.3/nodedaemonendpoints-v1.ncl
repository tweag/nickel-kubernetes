# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      kubeletEndpoint
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "Port" ],
              _js2n__-prdslib.records.record
                { Port = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ])
        | doc "DaemonEndpoint contains information about a single Daemon endpoint."
        | optional,
    }