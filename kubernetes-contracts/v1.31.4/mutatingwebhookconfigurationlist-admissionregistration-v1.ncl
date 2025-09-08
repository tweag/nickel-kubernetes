# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"admissionregistration.k8s.io/v1" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"admissionregistration.k8s.io/v1" |]
                  | optional,
                kind
                  | std.enum.TagOrString
                  | [| 'MutatingWebhookConfiguration |]
                  | optional,
                metadata
                  | js2n.Nullable
                    {
                      annotations
                        | js2n.Nullable ({ _ | js2n.Nullable String })
                        | optional,
                      creationTimestamp | js2n.Nullable String | optional,
                      deletionGracePeriodSeconds
                        | js2n.Nullable std.number.Integer
                        | optional,
                      deletionTimestamp | js2n.Nullable String | optional,
                      finalizers
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      generateName | js2n.Nullable String | optional,
                      generation | js2n.Nullable std.number.Integer | optional,
                      labels
                        | js2n.Nullable ({ _ | js2n.Nullable String })
                        | optional,
                      managedFields
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                apiVersion | js2n.Nullable String | optional,
                                fieldsType | js2n.Nullable String | optional,
                                fieldsV1
                                  | js2n.Nullable ({ _ | Dyn })
                                  | optional,
                                manager | js2n.Nullable String | optional,
                                operation | js2n.Nullable String | optional,
                                subresource | js2n.Nullable String | optional,
                                time | js2n.Nullable String | optional
                              }
                          ))
                        | optional,
                      name | js2n.Nullable String | optional,
                      namespace | js2n.Nullable String | optional,
                      ownerReferences
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                apiVersion | String,
                                blockOwnerDeletion
                                  | js2n.Nullable Bool
                                  | optional,
                                controller | js2n.Nullable Bool | optional,
                                kind | String,
                                name | String,
                                uid | String
                              }
                          ))
                        | optional,
                      resourceVersion | js2n.Nullable String | optional,
                      selfLink | js2n.Nullable String | optional,
                      uid | js2n.Nullable String | optional
                    }
                  | optional,
                webhooks
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          admissionReviewVersions
                            | Array (js2n.Nullable String),
                          clientConfig
                            | {
                              caBundle | js2n.Nullable String | optional,
                              service
                                | js2n.Nullable
                                  {
                                    name | String,
                                    namespace | String,
                                    path | js2n.Nullable String | optional,
                                    port
                                      | js2n.Nullable std.number.Integer
                                      | optional
                                  }
                                | optional,
                              url | js2n.Nullable String | optional
                            },
                          failurePolicy | js2n.Nullable String | optional,
                          matchConditions
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  { expression | String, name | String }
                              ))
                            | optional,
                          matchPolicy | js2n.Nullable String | optional,
                          name | String,
                          namespaceSelector
                            | js2n.Nullable
                              {
                                matchExpressions
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          key | String,
                                          operator | String,
                                          values
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional
                                        }
                                    ))
                                  | optional,
                                matchLabels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional
                              }
                            | optional,
                          objectSelector
                            | js2n.Nullable
                              {
                                matchExpressions
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          key | String,
                                          operator | String,
                                          values
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional
                                        }
                                    ))
                                  | optional,
                                matchLabels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional
                              }
                            | optional,
                          reinvocationPolicy | js2n.Nullable String | optional,
                          rules
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    apiGroups
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional,
                                    apiVersions
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional,
                                    operations
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional,
                                    resources
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional,
                                    scope | js2n.Nullable String | optional
                                  }
                              ))
                            | optional,
                          sideEffects | String,
                          timeoutSeconds
                            | js2n.Nullable std.number.Integer
                            | optional
                        }
                    ))
                  | optional
              }
          )),
      kind
        | std.enum.TagOrString
        | [| 'MutatingWebhookConfigurationList |]
        | optional,
      metadata
        | js2n.Nullable
          {
            continue | js2n.Nullable String | optional,
            remainingItemCount | js2n.Nullable std.number.Integer | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional
          }
        | optional
    }