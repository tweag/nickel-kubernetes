# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"resource.k8s.io/v1alpha3" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"resource.k8s.io/v1alpha3" |]
                  | optional,
                kind | std.enum.TagOrString | [| 'DeviceTaintRule |] | optional,
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
                  | {
                    deviceSelector
                      | js2n.Nullable
                        {
                          device | js2n.Nullable String | optional,
                          deviceClassName | js2n.Nullable String | optional,
                          driver | js2n.Nullable String | optional,
                          pool | js2n.Nullable String | optional,
                          selectors
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    cel
                                      | js2n.Nullable { expression | String }
                                      | optional
                                  }
                              ))
                            | optional
                        }
                      | optional,
                    taint
                      | {
                        effect | String,
                        key | String,
                        timeAdded | js2n.Nullable String | optional,
                        value | js2n.Nullable String | optional
                      }
                  }
              }
          )),
      kind | std.enum.TagOrString | [| 'DeviceTaintRuleList |] | optional,
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