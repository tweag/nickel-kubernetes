# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      host
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          host is the fully qualified domain name of a network host, as defined by RFC 3986. Note the following deviations from the "host" part of the URI as defined in RFC 3986: 1. IPs are not allowed. Currently an IngressRuleValue can only apply to
             the IP in the Spec of the parent Ingress.
          2. The `:` delimiter is not respected because ports are not allowed.
          	  Currently the port of an Ingress is implicitly :80 for http and
          	  :443 for https.
          Both these may change in the future. Incoming requests are matched against the host before the IngressRuleValue. If the host is unspecified, the Ingress routes all traffic based on the specified IngressRuleValue.
          
          host can be "precise" which is a domain name without the terminating dot of a network host (e.g. "foo.bar.com") or "wildcard", which is a domain name prefixed with a single wildcard label (e.g. "*.foo.com"). The wildcard character '*' must appear by itself as the first DNS label and matches only a single label. You cannot have a wildcard label by itself (e.g. Host == "*"). Requests will be matched against the Host field in the following way: 1. If host is precise, the request matches this rule if the http host header is equal to Host. 2. If host is a wildcard, then the request matches this rule if the http host header is to equal to the suffix (removing the first label) of the wildcard rule.
        "%
        | optional,
      http
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "paths" ],
              _js2n__-prdslib.records.record
                {
                  paths =
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
                                _js2n__-prdslib.records.required
                                  [ "backend", "pathType" ],
                                _js2n__-prdslib.records.record
                                  {
                                    backend =
                                      _js2n__-prdslib.allOf
                                          [
                                            _js2n__-prdslib.isType 'Record,
                                            _js2n__-prdslib.records.record
                                              {
                                                resource =
                                                  _js2n__-prdslib.allOf
                                                      [
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                              'Record,
                                                            _js2n__-prdslib.isType
                                                              'Null
                                                          ],
                                                        _js2n__-prdslib.records.required
                                                          [ "kind", "name" ],
                                                        _js2n__-prdslib.records.record
                                                          {
                                                            apiGroup =
                                                              _js2n__-prdslib.anyOf
                                                                  [
                                                                    _js2n__-prdslib.isType
                                                                      '"String",
                                                                    _js2n__-prdslib.isType
                                                                      'Null
                                                                  ],
                                                            kind =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                            name =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                                service =
                                                  _js2n__-prdslib.allOf
                                                      [
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                              'Record,
                                                            _js2n__-prdslib.isType
                                                              'Null
                                                          ],
                                                        _js2n__-prdslib.records.required
                                                          [ "name" ],
                                                        _js2n__-prdslib.records.record
                                                          {
                                                            name =
                                                              _js2n__-prdslib.isType
                                                                  '"String",
                                                            port =
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
                                                                      {
                                                                        name =
                                                                          _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                  '"String",
                                                                                _js2n__-prdslib.isType
                                                                                  'Null
                                                                              ],
                                                                        number =
                                                                          _js2n__-prdslib.anyOf
                                                                              [
                                                                                _js2n__-prdslib.isType
                                                                                  'Integer,
                                                                                _js2n__-prdslib.isType
                                                                                  'Null
                                                                              ],
                                                                      } {} false
                                                                      _js2n__-prdslib.never
                                                                  ],
                                                          } {} false
                                                          _js2n__-prdslib.never
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ],
                                    path =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                    pathType = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://<host>/<path>?<searchpart> -> backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last '/' and before the first '?' or '#'."
        | optional,
    }