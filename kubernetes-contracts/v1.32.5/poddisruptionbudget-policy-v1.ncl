# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| '"policy/v1" |] | optional,
      kind | std.enum.TagOrString | [| 'PodDisruptionBudget |] | optional,
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
            maxUnavailable
              | js2n.OneOf
                [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
              | optional,
            minAvailable
              | js2n.OneOf
                [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
              | optional,
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
                              | js2n.Nullable (Array (js2n.Nullable String))
                              | optional
                          }
                      ))
                    | optional,
                  matchLabels
                    | js2n.Nullable ({ _ | js2n.Nullable String })
                    | optional
                }
              | optional,
            unhealthyPodEvictionPolicy | js2n.Nullable String | optional
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
                      lastTransitionTime | String,
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
            currentHealthy | std.number.Integer,
            desiredHealthy | std.number.Integer,
            disruptedPods
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional,
            disruptionsAllowed | std.number.Integer,
            expectedPods | std.number.Integer,
            observedGeneration | js2n.Nullable std.number.Integer | optional
          }
        | optional
    }