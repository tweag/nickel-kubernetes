# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"flowcontrol.apiserver.k8s.io/v1" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"flowcontrol.apiserver.k8s.io/v1" |]
                  | optional,
                kind | std.enum.TagOrString | [| 'FlowSchema |] | optional,
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
                      distinguisherMethod
                        | js2n.Nullable { type | String }
                        | optional,
                      matchingPrecedence
                        | js2n.Nullable std.number.Integer
                        | optional,
                      priorityLevelConfiguration | { name | String },
                      rules
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                nonResourceRules
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          nonResourceURLs
                                            | Array (js2n.Nullable String),
                                          verbs | Array (js2n.Nullable String)
                                        }
                                    ))
                                  | optional,
                                resourceRules
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          apiGroups
                                            | Array (js2n.Nullable String),
                                          clusterScope
                                            | js2n.Nullable Bool
                                            | optional,
                                          namespaces
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional,
                                          resources
                                            | Array (js2n.Nullable String),
                                          verbs | Array (js2n.Nullable String)
                                        }
                                    ))
                                  | optional,
                                subjects
                                  | Array (
                                    js2n.Nullable
                                      {
                                        group
                                          | js2n.Nullable { name | String }
                                          | optional,
                                        kind | String,
                                        serviceAccount
                                          | js2n.Nullable
                                            {
                                              name | String,
                                              namespace | String
                                            }
                                          | optional,
                                        user
                                          | js2n.Nullable { name | String }
                                          | optional
                                      }
                                  )
                              }
                          ))
                        | optional
                    }
                  | optional,
                status
                  | js2n.Nullable
                    {
                      conditions
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                lastTransitionTime
                                  | js2n.Nullable String
                                  | optional,
                                message | js2n.Nullable String | optional,
                                reason | js2n.Nullable String | optional,
                                status | js2n.Nullable String | optional,
                                type | js2n.Nullable String | optional
                              }
                          ))
                        | optional
                    }
                  | optional
              }
          )),
      kind | std.enum.TagOrString | [| 'FlowSchemaList |] | optional,
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