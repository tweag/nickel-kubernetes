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
          _js2n__-prdslib.records.record
            {
              apiVersion =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.enum
                        [
                          "v1",
                          "admission.k8s.io/v1",
                          "admission.k8s.io/v1beta1",
                          "admissionregistration.k8s.io/v1",
                          "admissionregistration.k8s.io/v1alpha1",
                          "admissionregistration.k8s.io/v1beta1",
                          "apiextensions.k8s.io/v1",
                          "apiextensions.k8s.io/v1beta1",
                          "apiregistration.k8s.io/v1",
                          "apiregistration.k8s.io/v1beta1",
                          "apps/v1",
                          "apps/v1beta1",
                          "apps/v1beta2",
                          "authentication.k8s.io/v1",
                          "authentication.k8s.io/v1alpha1",
                          "authentication.k8s.io/v1beta1",
                          "authorization.k8s.io/v1",
                          "authorization.k8s.io/v1beta1",
                          "autoscaling/v1",
                          "autoscaling/v2",
                          "autoscaling/v2beta1",
                          "autoscaling/v2beta2",
                          "batch/v1",
                          "batch/v1beta1",
                          "certificates.k8s.io/v1",
                          "certificates.k8s.io/v1alpha1",
                          "certificates.k8s.io/v1beta1",
                          "coordination.k8s.io/v1",
                          "coordination.k8s.io/v1beta1",
                          "discovery.k8s.io/v1",
                          "discovery.k8s.io/v1beta1",
                          "events.k8s.io/v1",
                          "events.k8s.io/v1beta1",
                          "extensions/v1beta1",
                          "flowcontrol.apiserver.k8s.io/v1",
                          "flowcontrol.apiserver.k8s.io/v1beta1",
                          "flowcontrol.apiserver.k8s.io/v1beta2",
                          "flowcontrol.apiserver.k8s.io/v1beta3",
                          "imagepolicy.k8s.io/v1alpha1",
                          "internal.apiserver.k8s.io/v1alpha1",
                          "networking.k8s.io/v1",
                          "networking.k8s.io/v1alpha1",
                          "networking.k8s.io/v1beta1",
                          "node.k8s.io/v1",
                          "node.k8s.io/v1alpha1",
                          "node.k8s.io/v1beta1",
                          "policy/v1",
                          "policy/v1beta1",
                          "rbac.authorization.k8s.io/v1",
                          "rbac.authorization.k8s.io/v1alpha1",
                          "rbac.authorization.k8s.io/v1beta1",
                          "resource.k8s.io/v1alpha2",
                          "scheduling.k8s.io/v1",
                          "scheduling.k8s.io/v1alpha1",
                          "scheduling.k8s.io/v1beta1",
                          "storage.k8s.io/v1",
                          "storage.k8s.io/v1alpha1",
                          "storage.k8s.io/v1beta1"
                        ]
                    ],
              dryRun =
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
                            _js2n__-prdslib.isType '"String",
                            _js2n__-prdslib.isType 'Null
                          ])
                    ],
              gracePeriodSeconds =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType 'Integer,
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
                      _js2n__-prdslib.enum [ "DeleteOptions" ]
                    ],
              orphanDependents =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"Bool",
                      _js2n__-prdslib.isType 'Null
                    ],
              preconditions =
                _js2n__-prdslib.allOf
                    [
                      _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.isType 'Null
                        ],
                      _js2n__-prdslib.records.record
                        {
                          resourceVersion =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                          uid =
                            _js2n__-prdslib.anyOf
                                [
                                  _js2n__-prdslib.isType '"String",
                                  _js2n__-prdslib.isType 'Null
                                ],
                        } {} false _js2n__-prdslib.never
                    ],
              propagationPolicy =
                _js2n__-prdslib.anyOf
                    [
                      _js2n__-prdslib.isType '"String",
                      _js2n__-prdslib.isType 'Null
                    ],
            } {} false _js2n__-prdslib.never
        ])