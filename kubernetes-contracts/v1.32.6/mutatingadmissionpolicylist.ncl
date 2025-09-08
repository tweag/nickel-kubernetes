# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion | js2n.Nullable String | optional,
                kind
                  | std.enum.TagOrString
                  | [| 'MutatingAdmissionPolicy |]
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
                spec
                  | js2n.Nullable
                    {
                      failurePolicy | js2n.Nullable String | optional,
                      matchConditions
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable { expression | String, name | String }
                          ))
                        | optional,
                      matchConstraints
                        | js2n.Nullable
                          {
                            excludeResourceRules
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
                                      resourceNames
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
                            matchPolicy | js2n.Nullable String | optional,
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
                                    | js2n.Nullable
                                      ({ _ | js2n.Nullable String })
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
                                    | js2n.Nullable
                                      ({ _ | js2n.Nullable String })
                                    | optional
                                }
                              | optional,
                            resourceRules
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
                                      resourceNames
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
                              | optional
                          }
                        | optional,
                      mutations
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                applyConfiguration
                                  | js2n.Nullable
                                    {
                                      expression
                                        | js2n.Nullable String
                                        | optional
                                    }
                                  | optional,
                                jsonPatch
                                  | js2n.Nullable
                                    {
                                      expression
                                        | js2n.Nullable String
                                        | optional
                                    }
                                  | optional,
                                patchType | String
                              }
                          ))
                        | optional,
                      paramKind
                        | js2n.Nullable
                          {
                            apiVersion | js2n.Nullable String | optional,
                            kind | js2n.Nullable String | optional
                          }
                        | optional,
                      reinvocationPolicy | js2n.Nullable String | optional,
                      variables
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable { expression | String, name | String }
                          ))
                        | optional
                    }
                  | optional
              }
          )),
      kind
        | std.enum.TagOrString
        | [| 'MutatingAdmissionPolicyList |]
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