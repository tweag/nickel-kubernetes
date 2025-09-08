# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"internal.apiserver.k8s.io/v1alpha1" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"internal.apiserver.k8s.io/v1alpha1" |]
                  | optional,
                kind | std.enum.TagOrString | [| 'StorageVersion |] | optional,
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
                spec | { _ | Dyn },
                status
                  | {
                    commonEncodingVersion | js2n.Nullable String | optional,
                    conditions
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              lastTransitionTime
                                | js2n.Nullable String
                                | optional,
                              message | String,
                              observedGeneration
                                | js2n.Nullable std.number.Integer
                                | optional,
                              reason | String,
                              status | String,
                              type | String
                            }
                        ))
                      | optional,
                    storageVersions
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              apiServerID | js2n.Nullable String | optional,
                              decodableVersions
                                | js2n.Nullable (Array (js2n.Nullable String))
                                | optional,
                              encodingVersion | js2n.Nullable String | optional,
                              servedVersions
                                | js2n.Nullable (Array (js2n.Nullable String))
                                | optional
                            }
                        ))
                      | optional
                  }
              }
          )),
      kind | std.enum.TagOrString | [| 'StorageVersionList |] | optional,
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