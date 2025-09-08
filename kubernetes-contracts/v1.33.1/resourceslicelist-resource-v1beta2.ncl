# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"resource.k8s.io/v1beta2" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"resource.k8s.io/v1beta2" |]
                  | optional,
                kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
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
                    allNodes | js2n.Nullable Bool | optional,
                    devices
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              allNodes | js2n.Nullable Bool | optional,
                              attributes
                                | js2n.Nullable
                                  ({
                                    _ | js2n.Nullable
                                      {
                                        bool | js2n.Nullable Bool | optional,
                                        int
                                          | js2n.Nullable std.number.Integer
                                          | optional,
                                        string
                                          | js2n.Nullable String
                                          | optional,
                                        version
                                          | js2n.Nullable String
                                          | optional
                                      }
                                  })
                                | optional,
                              capacity
                                | js2n.Nullable
                                  ({
                                    _ | js2n.Nullable
                                      {
                                        value
                                          | js2n.OneOf
                                            [
                                              js2n.Nullable String,
                                              js2n.Nullable Number
                                            ]
                                      }
                                  })
                                | optional,
                              consumesCounters
                                | js2n.Nullable
                                  (Array (
                                    js2n.Nullable
                                      {
                                        counterSet | String,
                                        counters
                                          | {
                                            _ | js2n.Nullable
                                              {
                                                value
                                                  | js2n.OneOf
                                                    [
                                                      js2n.Nullable String,
                                                      js2n.Nullable Number
                                                    ]
                                              }
                                          }
                                      }
                                  ))
                                | optional,
                              name | String,
                              nodeName | js2n.Nullable String | optional,
                              nodeSelector
                                | js2n.Nullable
                                  {
                                    nodeSelectorTerms
                                      | Array (
                                        js2n.Nullable
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
                                                          (Array (
                                                            js2n.Nullable String
                                                          ))
                                                        | optional
                                                    }
                                                ))
                                              | optional,
                                            matchFields
                                              | js2n.Nullable
                                                (Array (
                                                  js2n.Nullable
                                                    {
                                                      key | String,
                                                      operator | String,
                                                      values
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable String
                                                          ))
                                                        | optional
                                                    }
                                                ))
                                              | optional
                                          }
                                      )
                                  }
                                | optional,
                              taints
                                | js2n.Nullable
                                  (Array (
                                    js2n.Nullable
                                      {
                                        effect | String,
                                        key | String,
                                        timeAdded
                                          | js2n.Nullable String
                                          | optional,
                                        value | js2n.Nullable String | optional
                                      }
                                  ))
                                | optional
                            }
                        ))
                      | optional,
                    driver | String,
                    nodeName | js2n.Nullable String | optional,
                    nodeSelector
                      | js2n.Nullable
                        {
                          nodeSelectorTerms
                            | Array (
                              js2n.Nullable
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
                                  matchFields
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
                                    | optional
                                }
                            )
                        }
                      | optional,
                    perDeviceNodeSelection | js2n.Nullable Bool | optional,
                    pool
                      | {
                        generation | std.number.Integer,
                        name | String,
                        resourceSliceCount | std.number.Integer
                      },
                    sharedCounters
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              counters
                                | {
                                  _ | js2n.Nullable
                                    {
                                      value
                                        | js2n.OneOf
                                          [
                                            js2n.Nullable String,
                                            js2n.Nullable Number
                                          ]
                                    }
                                },
                              name | String
                            }
                        ))
                      | optional
                  }
              }
          )),
      kind | std.enum.TagOrString | [| 'ResourceSliceList |] | optional,
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