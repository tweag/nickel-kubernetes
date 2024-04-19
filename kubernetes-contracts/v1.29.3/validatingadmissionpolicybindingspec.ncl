# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      matchResources
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
                  excludeResourceRules =
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
                                _js2n__-prdslib.records.record
                                  {
                                    apiGroups =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    apiVersions =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    operations =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    resourceNames =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    resources =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    scope =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  matchPolicy =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  namespaceSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              matchExpressions =
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
                                              [ "key", "operator" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                key =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                operator =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                values =
                                                  _js2n__-prdslib.allOf
                                                      [
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                              '"Array",
                                                            _js2n__-prdslib.isType
                                                              'Null
                                                          ],
                                                        _js2n__-prdslib.arrays.arrayOf
                                                          (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              matchLabels =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.record {} {} true
                                        (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  objectSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              matchExpressions =
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
                                              [ "key", "operator" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                key =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                operator =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                values =
                                                  _js2n__-prdslib.allOf
                                                      [
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                              '"Array",
                                                            _js2n__-prdslib.isType
                                                              'Null
                                                          ],
                                                        _js2n__-prdslib.arrays.arrayOf
                                                          (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              matchLabels =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.record {} {} true
                                        (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                  resourceRules =
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
                                _js2n__-prdslib.records.record
                                  {
                                    apiGroups =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    apiVersions =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    operations =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    resourceNames =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    resources =
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
                                                  _js2n__-prdslib.isType
                                                    '"String",
                                                  _js2n__-prdslib.isType 'Null
                                                ])
                                          ],
                                    scope =
                                      _js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ],
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "MatchResources decides whether to run the admission control policy on an object based on whether it meets the match criteria. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"
        | optional,
      paramRef
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
                  name =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  namespace =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  parameterNotFoundAction =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  selector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Record,
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.records.record
                            {
                              matchExpressions =
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
                                              [ "key", "operator" ],
                                            _js2n__-prdslib.records.record
                                              {
                                                key =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                operator =
                                                  _js2n__-prdslib.isType
                                                      '"String",
                                                values =
                                                  _js2n__-prdslib.allOf
                                                      [
                                                        _js2n__-prdslib.anyOf
                                                          [
                                                            _js2n__-prdslib.isType
                                                              '"Array",
                                                            _js2n__-prdslib.isType
                                                              'Null
                                                          ],
                                                        _js2n__-prdslib.arrays.arrayOf
                                                          (_js2n__-prdslib.anyOf
                                                            [
                                                              _js2n__-prdslib.isType
                                                                '"String",
                                                              _js2n__-prdslib.isType
                                                                'Null
                                                            ])
                                                      ],
                                              } {} false _js2n__-prdslib.never
                                          ])
                                    ],
                              matchLabels =
                                _js2n__-prdslib.allOf
                                    [
                                      _js2n__-prdslib.anyOf
                                        [
                                          _js2n__-prdslib.isType 'Record,
                                          _js2n__-prdslib.isType 'Null
                                        ],
                                      _js2n__-prdslib.records.record {} {} true
                                        (_js2n__-prdslib.anyOf
                                          [
                                            _js2n__-prdslib.isType '"String",
                                            _js2n__-prdslib.isType 'Null
                                          ])
                                    ],
                            } {} false _js2n__-prdslib.never
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ParamRef describes how to locate the params to be used as input to expressions of rules applied by a policy binding."
        | optional,
      policyName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "PolicyName references a ValidatingAdmissionPolicy name which the ValidatingAdmissionPolicyBinding binds to. If the referenced resource does not exist, this binding is considered invalid and will be ignored Required."
        | optional,
      validationActions
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
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
            ])
        | doc m%"
          validationActions declares how Validations of the referenced ValidatingAdmissionPolicy are enforced. If a validation evaluates to false it is always enforced according to these actions.
          
          Failures defined by the ValidatingAdmissionPolicy's FailurePolicy are enforced according to these actions only if the FailurePolicy is set to Fail, otherwise the failures are ignored. This includes compilation errors, runtime errors and misconfigurations of the policy.
          
          validationActions is declared as a set of action values. Order does not matter. validationActions may not contain duplicates of the same action.
          
          The supported actions values are:
          
          "Deny" specifies that a validation failure results in a denied request.
          
          "Warn" specifies that a validation failure is reported to the request client in HTTP Warning headers, with a warning code of 299. Warnings can be sent both for allowed or denied admission responses.
          
          "Audit" specifies that a validation failure is included in the published audit event for the request. The audit event will contain a `validation.policy.admission.k8s.io/validation_failure` audit annotation with a value containing the details of the validation failures, formatted as a JSON list of objects, each with the following fields: - message: The validation failure message string - policy: The resource name of the ValidatingAdmissionPolicy - binding: The resource name of the ValidatingAdmissionPolicyBinding - expressionIndex: The index of the failed validations in the ValidatingAdmissionPolicy - validationActions: The enforcement actions enacted for the validation failure Example audit annotation: `"validation.policy.admission.k8s.io/validation_failure": "[{"message": "Invalid value", {"policy": "policy.example.com", {"binding": "policybinding.example.com", {"expressionIndex": "1", {"validationActions": ["Audit"]}]"`
          
          Clients should expect to handle additional values by ignoring any values not recognized.
          
          "Deny" and "Warn" may not be used together since this combination needlessly duplicates the validation failure both in the API response body and the HTTP warning headers.
          
          Required.
        "%
        | optional,
    }