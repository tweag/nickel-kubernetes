# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| '"autoscaling/v2" |] | optional,
      kind | std.enum.TagOrString | [| 'HorizontalPodAutoscaler |] | optional,
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
            labels | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
            managedFields
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldsType | js2n.Nullable String | optional,
                      fieldsV1 | js2n.Nullable ({ _ | Dyn }) | optional,
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
                      blockOwnerDeletion | js2n.Nullable Bool | optional,
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
            behavior
              | js2n.Nullable
                {
                  scaleDown
                    | js2n.Nullable
                      {
                        policies
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable
                                {
                                  periodSeconds | std.number.Integer,
                                  type | String,
                                  value | std.number.Integer
                                }
                            ))
                          | optional,
                        selectPolicy | js2n.Nullable String | optional,
                        stabilizationWindowSeconds
                          | js2n.Nullable std.number.Integer
                          | optional
                      }
                    | optional,
                  scaleUp
                    | js2n.Nullable
                      {
                        policies
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable
                                {
                                  periodSeconds | std.number.Integer,
                                  type | String,
                                  value | std.number.Integer
                                }
                            ))
                          | optional,
                        selectPolicy | js2n.Nullable String | optional,
                        stabilizationWindowSeconds
                          | js2n.Nullable std.number.Integer
                          | optional
                      }
                    | optional
                }
              | optional,
            maxReplicas | std.number.Integer,
            metrics
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      containerResource
                        | js2n.Nullable
                          {
                            container | String,
                            name | String,
                            target
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                type | String,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              }
                          }
                        | optional,
                      external
                        | js2n.Nullable
                          {
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              },
                            target
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                type | String,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              }
                          }
                        | optional,
                      object
                        | js2n.Nullable
                          {
                            describedObject
                              | {
                                apiVersion | js2n.Nullable String | optional,
                                kind | String,
                                name | String
                              },
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              },
                            target
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                type | String,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              }
                          }
                        | optional,
                      pods
                        | js2n.Nullable
                          {
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              },
                            target
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                type | String,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              }
                          }
                        | optional,
                      resource
                        | js2n.Nullable
                          {
                            name | String,
                            target
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                type | String,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              }
                          }
                        | optional,
                      type | String
                    }
                ))
              | optional,
            minReplicas | js2n.Nullable std.number.Integer | optional,
            scaleTargetRef
              | {
                apiVersion | js2n.Nullable String | optional,
                kind | String,
                name | String
              }
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
                      lastTransitionTime | js2n.Nullable String | optional,
                      message | js2n.Nullable String | optional,
                      reason | js2n.Nullable String | optional,
                      status | String,
                      type | String
                    }
                ))
              | optional,
            currentMetrics
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      containerResource
                        | js2n.Nullable
                          {
                            container | String,
                            current
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              },
                            name | String
                          }
                        | optional,
                      external
                        | js2n.Nullable
                          {
                            current
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              },
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              }
                          }
                        | optional,
                      object
                        | js2n.Nullable
                          {
                            current
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              },
                            describedObject
                              | {
                                apiVersion | js2n.Nullable String | optional,
                                kind | String,
                                name | String
                              },
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              }
                          }
                        | optional,
                      pods
                        | js2n.Nullable
                          {
                            current
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              },
                            metric
                              | {
                                name | String,
                                selector
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
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                          ))
                                        | optional,
                                      matchLabels
                                        | js2n.Nullable
                                          ({ _ | js2n.Nullable String })
                                        | optional
                                    }
                                  | optional
                              }
                          }
                        | optional,
                      resource
                        | js2n.Nullable
                          {
                            current
                              | {
                                averageUtilization
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                averageValue
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional,
                                value
                                  | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                  | optional
                              },
                            name | String
                          }
                        | optional,
                      type | String
                    }
                ))
              | optional,
            currentReplicas | js2n.Nullable std.number.Integer | optional,
            desiredReplicas | std.number.Integer,
            lastScaleTime | js2n.Nullable String | optional,
            observedGeneration | js2n.Nullable std.number.Integer | optional
          }
        | optional
    }