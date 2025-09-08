# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"flowcontrol.apiserver.k8s.io/v1" |]
        | optional,
      kind
        | std.enum.TagOrString
        | [| 'PriorityLevelConfiguration |]
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
            exempt
              | js2n.Nullable
                {
                  lendablePercent | js2n.Nullable std.number.Integer | optional,
                  nominalConcurrencyShares
                    | js2n.Nullable std.number.Integer
                    | optional
                }
              | optional,
            limited
              | js2n.Nullable
                {
                  borrowingLimitPercent
                    | js2n.Nullable std.number.Integer
                    | optional,
                  lendablePercent | js2n.Nullable std.number.Integer | optional,
                  limitResponse
                    | js2n.Nullable
                      {
                        queuing
                          | js2n.Nullable
                            {
                              handSize
                                | js2n.Nullable std.number.Integer
                                | optional,
                              queueLengthLimit
                                | js2n.Nullable std.number.Integer
                                | optional,
                              queues
                                | js2n.Nullable std.number.Integer
                                | optional
                            }
                          | optional,
                        type | String
                      }
                    | optional,
                  nominalConcurrencyShares
                    | js2n.Nullable std.number.Integer
                    | optional
                }
              | optional,
            type | String
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
                      status | js2n.Nullable String | optional,
                      type | js2n.Nullable String | optional
                    }
                ))
              | optional
          }
        | optional
    }