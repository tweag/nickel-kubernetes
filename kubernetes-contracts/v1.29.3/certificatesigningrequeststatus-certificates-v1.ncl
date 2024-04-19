# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      certificate
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          certificate is populated with an issued certificate by the signer after an Approved condition is present. This field is set via the /status subresource. Once populated, this field is immutable.
          
          If the certificate signing request is denied, a condition of type "Denied" is added and this field remains empty. If the signer cannot issue the certificate, a condition of type "Failed" is added and this field remains empty.
          
          Validation requirements:
           1. certificate must contain one or more PEM blocks.
           2. All PEM blocks must have the "CERTIFICATE" label, contain no headers, and the encoded data
            must be a BER-encoded ASN.1 Certificate structure as described in section 4 of RFC5280.
           3. Non-PEM content may appear before or after the "CERTIFICATE" PEM blocks and is unvalidated,
            to allow for explanatory text as described in section 5.2 of RFC7468.
          
          If more than one PEM block is present, and the definition of the requested spec.signerName does not indicate otherwise, the first block is the issued certificate, and subsequent blocks should be treated as intermediate certificates and presented in TLS handshakes.
          
          The certificate is encoded in PEM format.
          
          When serialized as JSON or YAML, the data is additionally base64-encoded, so it consists of:
          
              base64(
              -----BEGIN CERTIFICATE-----
              ...
              -----END CERTIFICATE-----
              )
        "%
        | optional,
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
                    _js2n__-prdslib.records.required [ "status", "type" ],
                    _js2n__-prdslib.records.record
                      {
                        lastTransitionTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        lastUpdateTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        message =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        reason =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        status = _js2n__-prdslib.isType '"String",
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "conditions applied to the request. Known conditions are \"Approved\", \"Denied\", and \"Failed\"."
        | optional,
    }