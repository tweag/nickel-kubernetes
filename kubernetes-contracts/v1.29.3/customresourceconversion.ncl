# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      strategy
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          strategy specifies how custom resources are converted between versions. Allowed values are: - `"None"`: The converter only change the apiVersion and would not touch any other field in the custom resource. - `"Webhook"`: API Server will call to an external webhook to do the conversion. Additional information
            is needed for this option. This requires spec.preserveUnknownFields to be false, and spec.conversion.webhook to be set.
        "%,
      webhook
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "conversionReviewVersions" ],
              _js2n__-prdslib.records.record
                {
                  clientConfig =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              caBundle =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                              service =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.required
                                        [ "name", "namespace" ],
                                      _js2n__-prdslib.records.record
                                        {
                                          name =
                                            _js2n__-prdslib.isType '"String",
                                          namespace =
                                            _js2n__-prdslib.isType '"String",
                                          path =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                          port =
                                            _js2n__-prdslib.anyOf
                                                [
                                                  _js2n__-prdslib.isType
                                                    'Integer,
                                                  _js2n__-prdslib.isType 'Null
                                                ],
                                        } {} false _js2n__-prdslib.never
                                    ],
                              url =
                                _js2n__-prdslib.anyOf
                                    [
                                      _js2n__-prdslib.isType '"String",
                                      _js2n__-prdslib.isType 'Null
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  conversionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "WebhookConversion describes how to call a conversion webhook"
        | optional,
    }