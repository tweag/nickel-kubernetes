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
                kind | std.enum.TagOrString | [| 'CronJob |] | optional,
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
                      concurrencyPolicy | js2n.Nullable String | optional,
                      failedJobsHistoryLimit
                        | js2n.Nullable std.number.Integer
                        | optional,
                      jobTemplate
                        | {
                          metadata
                            | js2n.Nullable
                              {
                                annotations
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional,
                                creationTimestamp
                                  | js2n.Nullable String
                                  | optional,
                                deletionGracePeriodSeconds
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                deletionTimestamp
                                  | js2n.Nullable String
                                  | optional,
                                finalizers
                                  | js2n.Nullable (Array (js2n.Nullable String))
                                  | optional,
                                generateName | js2n.Nullable String | optional,
                                generation
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                labels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional,
                                managedFields
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          apiVersion
                                            | js2n.Nullable String
                                            | optional,
                                          fieldsType
                                            | js2n.Nullable String
                                            | optional,
                                          fieldsV1
                                            | js2n.Nullable ({ _ | Dyn })
                                            | optional,
                                          manager
                                            | js2n.Nullable String
                                            | optional,
                                          operation
                                            | js2n.Nullable String
                                            | optional,
                                          subresource
                                            | js2n.Nullable String
                                            | optional,
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
                                          controller
                                            | js2n.Nullable Bool
                                            | optional,
                                          kind | String,
                                          name | String,
                                          uid | String
                                        }
                                    ))
                                  | optional,
                                resourceVersion
                                  | js2n.Nullable String
                                  | optional,
                                selfLink | js2n.Nullable String | optional,
                                uid | js2n.Nullable String | optional
                              }
                            | optional,
                          spec
                            | js2n.Nullable
                              {
                                activeDeadlineSeconds
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                backoffLimit
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                backoffLimitPerIndex
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                completionMode
                                  | js2n.Nullable String
                                  | optional,
                                completions
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                managedBy | js2n.Nullable String | optional,
                                manualSelector | js2n.Nullable Bool | optional,
                                maxFailedIndexes
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                parallelism
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                podFailurePolicy
                                  | js2n.Nullable
                                    {
                                      rules
                                        | Array (
                                          js2n.Nullable
                                            {
                                              action | String,
                                              onExitCodes
                                                | js2n.Nullable
                                                  {
                                                    containerName
                                                      | js2n.Nullable String
                                                      | optional,
                                                    operator | String,
                                                    values
                                                      | Array (
                                                        js2n.Nullable
                                                          std.number.Integer
                                                      )
                                                  }
                                                | optional,
                                              onPodConditions
                                                | js2n.Nullable
                                                  (Array (
                                                    js2n.Nullable
                                                      {
                                                        status | String,
                                                        type | String
                                                      }
                                                  ))
                                                | optional
                                            }
                                        )
                                    }
                                  | optional,
                                podReplacementPolicy
                                  | js2n.Nullable String
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
                                  | optional,
                                successPolicy
                                  | js2n.Nullable
                                    {
                                      rules
                                        | Array (
                                          js2n.Nullable
                                            {
                                              succeededCount
                                                | js2n.Nullable
                                                  std.number.Integer
                                                | optional,
                                              succeededIndexes
                                                | js2n.Nullable String
                                                | optional
                                            }
                                        )
                                    }
                                  | optional,
                                suspend | js2n.Nullable Bool | optional,
                                template
                                  | {
                                    metadata
                                      | js2n.Nullable
                                        {
                                          annotations
                                            | js2n.Nullable
                                              ({ _ | js2n.Nullable String })
                                            | optional,
                                          creationTimestamp
                                            | js2n.Nullable String
                                            | optional,
                                          deletionGracePeriodSeconds
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          deletionTimestamp
                                            | js2n.Nullable String
                                            | optional,
                                          finalizers
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional,
                                          generateName
                                            | js2n.Nullable String
                                            | optional,
                                          generation
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          labels
                                            | js2n.Nullable
                                              ({ _ | js2n.Nullable String })
                                            | optional,
                                          managedFields
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    apiVersion
                                                      | js2n.Nullable String
                                                      | optional,
                                                    fieldsType
                                                      | js2n.Nullable String
                                                      | optional,
                                                    fieldsV1
                                                      | js2n.Nullable
                                                        ({ _ | Dyn })
                                                      | optional,
                                                    manager
                                                      | js2n.Nullable String
                                                      | optional,
                                                    operation
                                                      | js2n.Nullable String
                                                      | optional,
                                                    subresource
                                                      | js2n.Nullable String
                                                      | optional,
                                                    time
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          name
                                            | js2n.Nullable String
                                            | optional,
                                          namespace
                                            | js2n.Nullable String
                                            | optional,
                                          ownerReferences
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    apiVersion | String,
                                                    blockOwnerDeletion
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    controller
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    kind | String,
                                                    name | String,
                                                    uid | String
                                                  }
                                              ))
                                            | optional,
                                          resourceVersion
                                            | js2n.Nullable String
                                            | optional,
                                          selfLink
                                            | js2n.Nullable String
                                            | optional,
                                          uid | js2n.Nullable String | optional
                                        }
                                      | optional,
                                    spec
                                      | js2n.Nullable
                                        {
                                          activeDeadlineSeconds
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          affinity
                                            | js2n.Nullable
                                              {
                                                nodeAffinity
                                                  | js2n.Nullable
                                                    {
                                                      preferredDuringSchedulingIgnoredDuringExecution
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable
                                                              {
                                                                preference
                                                                  | {
                                                                    matchExpressions
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            {
                                                                              key
                                                                                | String,
                                                                              operator
                                                                                | String,
                                                                              values
                                                                                | js2n.Nullable
                                                                                  (Array (
                                                                                    js2n.Nullable
                                                                                      String
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
                                                                              key
                                                                                | String,
                                                                              operator
                                                                                | String,
                                                                              values
                                                                                | js2n.Nullable
                                                                                  (Array (
                                                                                    js2n.Nullable
                                                                                      String
                                                                                  ))
                                                                                | optional
                                                                            }
                                                                        ))
                                                                      | optional
                                                                  },
                                                                weight
                                                                  | std.number.Integer
                                                              }
                                                          ))
                                                        | optional,
                                                      requiredDuringSchedulingIgnoredDuringExecution
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
                                                                              key
                                                                                | String,
                                                                              operator
                                                                                | String,
                                                                              values
                                                                                | js2n.Nullable
                                                                                  (Array (
                                                                                    js2n.Nullable
                                                                                      String
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
                                                                              key
                                                                                | String,
                                                                              operator
                                                                                | String,
                                                                              values
                                                                                | js2n.Nullable
                                                                                  (Array (
                                                                                    js2n.Nullable
                                                                                      String
                                                                                  ))
                                                                                | optional
                                                                            }
                                                                        ))
                                                                      | optional
                                                                  }
                                                              )
                                                          }
                                                        | optional
                                                    }
                                                  | optional,
                                                podAffinity
                                                  | js2n.Nullable
                                                    {
                                                      preferredDuringSchedulingIgnoredDuringExecution
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable
                                                              {
                                                                podAffinityTerm
                                                                  | {
                                                                    labelSelector
                                                                      | js2n.Nullable
                                                                        {
                                                                          matchExpressions
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    operator
                                                                                      | String,
                                                                                    values
                                                                                      | js2n.Nullable
                                                                                        (Array (
                                                                                          js2n.Nullable
                                                                                            String
                                                                                        ))
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          matchLabels
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.Nullable
                                                                                  String
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    matchLabelKeys
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    mismatchLabelKeys
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    namespaceSelector
                                                                      | js2n.Nullable
                                                                        {
                                                                          matchExpressions
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    operator
                                                                                      | String,
                                                                                    values
                                                                                      | js2n.Nullable
                                                                                        (Array (
                                                                                          js2n.Nullable
                                                                                            String
                                                                                        ))
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          matchLabels
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.Nullable
                                                                                  String
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    namespaces
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    topologyKey
                                                                      | String
                                                                  },
                                                                weight
                                                                  | std.number.Integer
                                                              }
                                                          ))
                                                        | optional,
                                                      requiredDuringSchedulingIgnoredDuringExecution
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable
                                                              {
                                                                labelSelector
                                                                  | js2n.Nullable
                                                                    {
                                                                      matchExpressions
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                key
                                                                                  | String,
                                                                                operator
                                                                                  | String,
                                                                                values
                                                                                  | js2n.Nullable
                                                                                    (Array (
                                                                                      js2n.Nullable
                                                                                        String
                                                                                    ))
                                                                                  | optional
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      matchLabels
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                matchLabelKeys
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                mismatchLabelKeys
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                namespaceSelector
                                                                  | js2n.Nullable
                                                                    {
                                                                      matchExpressions
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                key
                                                                                  | String,
                                                                                operator
                                                                                  | String,
                                                                                values
                                                                                  | js2n.Nullable
                                                                                    (Array (
                                                                                      js2n.Nullable
                                                                                        String
                                                                                    ))
                                                                                  | optional
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      matchLabels
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                namespaces
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                topologyKey
                                                                  | String
                                                              }
                                                          ))
                                                        | optional
                                                    }
                                                  | optional,
                                                podAntiAffinity
                                                  | js2n.Nullable
                                                    {
                                                      preferredDuringSchedulingIgnoredDuringExecution
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable
                                                              {
                                                                podAffinityTerm
                                                                  | {
                                                                    labelSelector
                                                                      | js2n.Nullable
                                                                        {
                                                                          matchExpressions
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    operator
                                                                                      | String,
                                                                                    values
                                                                                      | js2n.Nullable
                                                                                        (Array (
                                                                                          js2n.Nullable
                                                                                            String
                                                                                        ))
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          matchLabels
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.Nullable
                                                                                  String
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    matchLabelKeys
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    mismatchLabelKeys
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    namespaceSelector
                                                                      | js2n.Nullable
                                                                        {
                                                                          matchExpressions
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    operator
                                                                                      | String,
                                                                                    values
                                                                                      | js2n.Nullable
                                                                                        (Array (
                                                                                          js2n.Nullable
                                                                                            String
                                                                                        ))
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          matchLabels
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.Nullable
                                                                                  String
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    namespaces
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    topologyKey
                                                                      | String
                                                                  },
                                                                weight
                                                                  | std.number.Integer
                                                              }
                                                          ))
                                                        | optional,
                                                      requiredDuringSchedulingIgnoredDuringExecution
                                                        | js2n.Nullable
                                                          (Array (
                                                            js2n.Nullable
                                                              {
                                                                labelSelector
                                                                  | js2n.Nullable
                                                                    {
                                                                      matchExpressions
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                key
                                                                                  | String,
                                                                                operator
                                                                                  | String,
                                                                                values
                                                                                  | js2n.Nullable
                                                                                    (Array (
                                                                                      js2n.Nullable
                                                                                        String
                                                                                    ))
                                                                                  | optional
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      matchLabels
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                matchLabelKeys
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                mismatchLabelKeys
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                namespaceSelector
                                                                  | js2n.Nullable
                                                                    {
                                                                      matchExpressions
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                key
                                                                                  | String,
                                                                                operator
                                                                                  | String,
                                                                                values
                                                                                  | js2n.Nullable
                                                                                    (Array (
                                                                                      js2n.Nullable
                                                                                        String
                                                                                    ))
                                                                                  | optional
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      matchLabels
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                namespaces
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                topologyKey
                                                                  | String
                                                              }
                                                          ))
                                                        | optional
                                                    }
                                                  | optional
                                              }
                                            | optional,
                                          automountServiceAccountToken
                                            | js2n.Nullable Bool
                                            | optional,
                                          containers
                                            | Array (
                                              js2n.Nullable
                                                {
                                                  args
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable String
                                                      ))
                                                    | optional,
                                                  command
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable String
                                                      ))
                                                    | optional,
                                                  env
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            name | String,
                                                            value
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            valueFrom
                                                              | js2n.Nullable
                                                                {
                                                                  configMapKeyRef
                                                                    | js2n.Nullable
                                                                      {
                                                                        key
                                                                          | String,
                                                                        name
                                                                          | js2n.Nullable
                                                                            String
                                                                          | optional,
                                                                        "optional"
                                                                          | js2n.Nullable
                                                                            Bool
                                                                          | optional
                                                                      }
                                                                    | optional,
                                                                  fieldRef
                                                                    | js2n.Nullable
                                                                      {
                                                                        apiVersion
                                                                          | js2n.Nullable
                                                                            String
                                                                          | optional,
                                                                        fieldPath
                                                                          | String
                                                                      }
                                                                    | optional,
                                                                  resourceFieldRef
                                                                    | js2n.Nullable
                                                                      {
                                                                        containerName
                                                                          | js2n.Nullable
                                                                            String
                                                                          | optional,
                                                                        divisor
                                                                          | js2n.OneOf
                                                                            [
                                                                              js2n.Nullable
                                                                                String,
                                                                              js2n.Nullable
                                                                                Number
                                                                            ]
                                                                          | optional,
                                                                        resource
                                                                          | String
                                                                      }
                                                                    | optional,
                                                                  secretKeyRef
                                                                    | js2n.Nullable
                                                                      {
                                                                        key
                                                                          | String,
                                                                        name
                                                                          | js2n.Nullable
                                                                            String
                                                                          | optional,
                                                                        "optional"
                                                                          | js2n.Nullable
                                                                            Bool
                                                                          | optional
                                                                      }
                                                                    | optional
                                                                }
                                                              | optional
                                                          }
                                                      ))
                                                    | optional,
                                                  envFrom
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            configMapRef
                                                              | js2n.Nullable
                                                                {
                                                                  name
                                                                    | js2n.Nullable
                                                                      String
                                                                    | optional,
                                                                  "optional"
                                                                    | js2n.Nullable
                                                                      Bool
                                                                    | optional
                                                                }
                                                              | optional,
                                                            prefix
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            secretRef
                                                              | js2n.Nullable
                                                                {
                                                                  name
                                                                    | js2n.Nullable
                                                                      String
                                                                    | optional,
                                                                  "optional"
                                                                    | js2n.Nullable
                                                                      Bool
                                                                    | optional
                                                                }
                                                              | optional
                                                          }
                                                      ))
                                                    | optional,
                                                  image
                                                    | js2n.Nullable String
                                                    | optional,
                                                  imagePullPolicy
                                                    | js2n.Nullable String
                                                    | optional,
                                                  lifecycle
                                                    | js2n.Nullable
                                                      {
                                                        postStart
                                                          | js2n.Nullable
                                                            {
                                                              exec
                                                                | js2n.Nullable
                                                                  {
                                                                    command
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              httpGet
                                                                | js2n.Nullable
                                                                  {
                                                                    host
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    httpHeaders
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            {
                                                                              name
                                                                                | String,
                                                                              value
                                                                                | String
                                                                            }
                                                                        ))
                                                                      | optional,
                                                                    path
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    port
                                                                      | js2n.OneOf
                                                                        [
                                                                          js2n.Nullable
                                                                            String,
                                                                          js2n.Nullable
                                                                            std.number.Integer
                                                                        ],
                                                                    scheme
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              sleep
                                                                | js2n.Nullable
                                                                  {
                                                                    seconds
                                                                      | std.number.Integer
                                                                  }
                                                                | optional,
                                                              tcpSocket
                                                                | js2n.Nullable
                                                                  {
                                                                    host
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    port
                                                                      | js2n.OneOf
                                                                        [
                                                                          js2n.Nullable
                                                                            String,
                                                                          js2n.Nullable
                                                                            std.number.Integer
                                                                        ]
                                                                  }
                                                                | optional
                                                            }
                                                          | optional,
                                                        preStop
                                                          | js2n.Nullable
                                                            {
                                                              exec
                                                                | js2n.Nullable
                                                                  {
                                                                    command
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              httpGet
                                                                | js2n.Nullable
                                                                  {
                                                                    host
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    httpHeaders
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            {
                                                                              name
                                                                                | String,
                                                                              value
                                                                                | String
                                                                            }
                                                                        ))
                                                                      | optional,
                                                                    path
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    port
                                                                      | js2n.OneOf
                                                                        [
                                                                          js2n.Nullable
                                                                            String,
                                                                          js2n.Nullable
                                                                            std.number.Integer
                                                                        ],
                                                                    scheme
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              sleep
                                                                | js2n.Nullable
                                                                  {
                                                                    seconds
                                                                      | std.number.Integer
                                                                  }
                                                                | optional,
                                                              tcpSocket
                                                                | js2n.Nullable
                                                                  {
                                                                    host
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    port
                                                                      | js2n.OneOf
                                                                        [
                                                                          js2n.Nullable
                                                                            String,
                                                                          js2n.Nullable
                                                                            std.number.Integer
                                                                        ]
                                                                  }
                                                                | optional
                                                            }
                                                          | optional,
                                                        stopSignal
                                                          | js2n.Nullable String
                                                          | optional
                                                      }
                                                    | optional,
                                                  livenessProbe
                                                    | js2n.Nullable
                                                      {
                                                        exec
                                                          | js2n.Nullable
                                                            {
                                                              command
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      String
                                                                  ))
                                                                | optional
                                                            }
                                                          | optional,
                                                        failureThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        grpc
                                                          | js2n.Nullable
                                                            {
                                                              port
                                                                | std.number.Integer,
                                                              service
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        httpGet
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              httpHeaders
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      {
                                                                        name
                                                                          | String,
                                                                        value
                                                                          | String
                                                                      }
                                                                  ))
                                                                | optional,
                                                              path
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ],
                                                              scheme
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        initialDelaySeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        periodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        successThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        tcpSocket
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ]
                                                            }
                                                          | optional,
                                                        terminationGracePeriodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        timeoutSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional
                                                      }
                                                    | optional,
                                                  name | String,
                                                  ports
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            containerPort
                                                              | std.number.Integer,
                                                            hostIP
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            hostPort
                                                              | js2n.Nullable
                                                                std.number.Integer
                                                              | optional,
                                                            name
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            protocol
                                                              | js2n.Nullable
                                                                String
                                                              | optional
                                                          }
                                                      ))
                                                    | optional,
                                                  readinessProbe
                                                    | js2n.Nullable
                                                      {
                                                        exec
                                                          | js2n.Nullable
                                                            {
                                                              command
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      String
                                                                  ))
                                                                | optional
                                                            }
                                                          | optional,
                                                        failureThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        grpc
                                                          | js2n.Nullable
                                                            {
                                                              port
                                                                | std.number.Integer,
                                                              service
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        httpGet
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              httpHeaders
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      {
                                                                        name
                                                                          | String,
                                                                        value
                                                                          | String
                                                                      }
                                                                  ))
                                                                | optional,
                                                              path
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ],
                                                              scheme
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        initialDelaySeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        periodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        successThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        tcpSocket
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ]
                                                            }
                                                          | optional,
                                                        terminationGracePeriodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        timeoutSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional
                                                      }
                                                    | optional,
                                                  resizePolicy
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            resourceName
                                                              | String,
                                                            restartPolicy
                                                              | String
                                                          }
                                                      ))
                                                    | optional,
                                                  resources
                                                    | js2n.Nullable
                                                      {
                                                        claims
                                                          | js2n.Nullable
                                                            (Array (
                                                              js2n.Nullable
                                                                {
                                                                  name | String,
                                                                  request
                                                                    | js2n.Nullable
                                                                      String
                                                                    | optional
                                                                }
                                                            ))
                                                          | optional,
                                                        limits
                                                          | js2n.Nullable
                                                            ({
                                                              _ | js2n.OneOf
                                                                [
                                                                  js2n.Nullable
                                                                    String,
                                                                  js2n.Nullable
                                                                    Number
                                                                ]
                                                            })
                                                          | optional,
                                                        requests
                                                          | js2n.Nullable
                                                            ({
                                                              _ | js2n.OneOf
                                                                [
                                                                  js2n.Nullable
                                                                    String,
                                                                  js2n.Nullable
                                                                    Number
                                                                ]
                                                            })
                                                          | optional
                                                      }
                                                    | optional,
                                                  restartPolicy
                                                    | js2n.Nullable String
                                                    | optional,
                                                  securityContext
                                                    | js2n.Nullable
                                                      {
                                                        allowPrivilegeEscalation
                                                          | js2n.Nullable Bool
                                                          | optional,
                                                        appArmorProfile
                                                          | js2n.Nullable
                                                            {
                                                              localhostProfile
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              type | String
                                                            }
                                                          | optional,
                                                        capabilities
                                                          | js2n.Nullable
                                                            {
                                                              add
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      String
                                                                  ))
                                                                | optional,
                                                              drop
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      String
                                                                  ))
                                                                | optional
                                                            }
                                                          | optional,
                                                        privileged
                                                          | js2n.Nullable Bool
                                                          | optional,
                                                        procMount
                                                          | js2n.Nullable String
                                                          | optional,
                                                        readOnlyRootFilesystem
                                                          | js2n.Nullable Bool
                                                          | optional,
                                                        runAsGroup
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        runAsNonRoot
                                                          | js2n.Nullable Bool
                                                          | optional,
                                                        runAsUser
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        seLinuxOptions
                                                          | js2n.Nullable
                                                            {
                                                              level
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              role
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              type
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              user
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        seccompProfile
                                                          | js2n.Nullable
                                                            {
                                                              localhostProfile
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              type | String
                                                            }
                                                          | optional,
                                                        windowsOptions
                                                          | js2n.Nullable
                                                            {
                                                              gmsaCredentialSpec
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              gmsaCredentialSpecName
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              hostProcess
                                                                | js2n.Nullable
                                                                  Bool
                                                                | optional,
                                                              runAsUserName
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional
                                                      }
                                                    | optional,
                                                  startupProbe
                                                    | js2n.Nullable
                                                      {
                                                        exec
                                                          | js2n.Nullable
                                                            {
                                                              command
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      String
                                                                  ))
                                                                | optional
                                                            }
                                                          | optional,
                                                        failureThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        grpc
                                                          | js2n.Nullable
                                                            {
                                                              port
                                                                | std.number.Integer,
                                                              service
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        httpGet
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              httpHeaders
                                                                | js2n.Nullable
                                                                  (Array (
                                                                    js2n.Nullable
                                                                      {
                                                                        name
                                                                          | String,
                                                                        value
                                                                          | String
                                                                      }
                                                                  ))
                                                                | optional,
                                                              path
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ],
                                                              scheme
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                          | optional,
                                                        initialDelaySeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        periodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        successThreshold
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        tcpSocket
                                                          | js2n.Nullable
                                                            {
                                                              host
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              port
                                                                | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      std.number.Integer
                                                                  ]
                                                            }
                                                          | optional,
                                                        terminationGracePeriodSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional,
                                                        timeoutSeconds
                                                          | js2n.Nullable
                                                            std.number.Integer
                                                          | optional
                                                      }
                                                    | optional,
                                                  stdin
                                                    | js2n.Nullable Bool
                                                    | optional,
                                                  stdinOnce
                                                    | js2n.Nullable Bool
                                                    | optional,
                                                  terminationMessagePath
                                                    | js2n.Nullable String
                                                    | optional,
                                                  terminationMessagePolicy
                                                    | js2n.Nullable String
                                                    | optional,
                                                  tty
                                                    | js2n.Nullable Bool
                                                    | optional,
                                                  volumeDevices
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            devicePath | String,
                                                            name | String
                                                          }
                                                      ))
                                                    | optional,
                                                  volumeMounts
                                                    | js2n.Nullable
                                                      (Array (
                                                        js2n.Nullable
                                                          {
                                                            mountPath | String,
                                                            mountPropagation
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            name | String,
                                                            readOnly
                                                              | js2n.Nullable
                                                                Bool
                                                              | optional,
                                                            recursiveReadOnly
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            subPath
                                                              | js2n.Nullable
                                                                String
                                                              | optional,
                                                            subPathExpr
                                                              | js2n.Nullable
                                                                String
                                                              | optional
                                                          }
                                                      ))
                                                    | optional,
                                                  workingDir
                                                    | js2n.Nullable String
                                                    | optional
                                                }
                                            ),
                                          dnsConfig
                                            | js2n.Nullable
                                              {
                                                nameservers
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional,
                                                options
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable
                                                        {
                                                          name
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          value
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                    ))
                                                  | optional,
                                                searches
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable String
                                                    ))
                                                  | optional
                                              }
                                            | optional,
                                          dnsPolicy
                                            | js2n.Nullable String
                                            | optional,
                                          enableServiceLinks
                                            | js2n.Nullable Bool
                                            | optional,
                                          ephemeralContainers
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    args
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    command
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    env
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              name | String,
                                                              value
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              valueFrom
                                                                | js2n.Nullable
                                                                  {
                                                                    configMapKeyRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          key
                                                                            | String,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    fieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          apiVersion
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          fieldPath
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    resourceFieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          containerName
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          divisor
                                                                            | js2n.OneOf
                                                                              [
                                                                                js2n.Nullable
                                                                                  String,
                                                                                js2n.Nullable
                                                                                  Number
                                                                              ]
                                                                            | optional,
                                                                          resource
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    secretKeyRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          key
                                                                            | String,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional
                                                                  }
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    envFrom
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              configMapRef
                                                                | js2n.Nullable
                                                                  {
                                                                    name
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    "optional"
                                                                      | js2n.Nullable
                                                                        Bool
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              prefix
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              secretRef
                                                                | js2n.Nullable
                                                                  {
                                                                    name
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    "optional"
                                                                      | js2n.Nullable
                                                                        Bool
                                                                      | optional
                                                                  }
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    image
                                                      | js2n.Nullable String
                                                      | optional,
                                                    imagePullPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    lifecycle
                                                      | js2n.Nullable
                                                        {
                                                          postStart
                                                            | js2n.Nullable
                                                              {
                                                                exec
                                                                  | js2n.Nullable
                                                                    {
                                                                      command
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              String
                                                                          ))
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                httpGet
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      httpHeaders
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                name
                                                                                  | String,
                                                                                value
                                                                                  | String
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      path
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ],
                                                                      scheme
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                sleep
                                                                  | js2n.Nullable
                                                                    {
                                                                      seconds
                                                                        | std.number.Integer
                                                                    }
                                                                  | optional,
                                                                tcpSocket
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ]
                                                                    }
                                                                  | optional
                                                              }
                                                            | optional,
                                                          preStop
                                                            | js2n.Nullable
                                                              {
                                                                exec
                                                                  | js2n.Nullable
                                                                    {
                                                                      command
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              String
                                                                          ))
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                httpGet
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      httpHeaders
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                name
                                                                                  | String,
                                                                                value
                                                                                  | String
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      path
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ],
                                                                      scheme
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                sleep
                                                                  | js2n.Nullable
                                                                    {
                                                                      seconds
                                                                        | std.number.Integer
                                                                    }
                                                                  | optional,
                                                                tcpSocket
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ]
                                                                    }
                                                                  | optional
                                                              }
                                                            | optional,
                                                          stopSignal
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    livenessProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    name | String,
                                                    ports
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              containerPort
                                                                | std.number.Integer,
                                                              hostIP
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              hostPort
                                                                | js2n.Nullable
                                                                  std.number.Integer
                                                                | optional,
                                                              name
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              protocol
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    readinessProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    resizePolicy
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              resourceName
                                                                | String,
                                                              restartPolicy
                                                                | String
                                                            }
                                                        ))
                                                      | optional,
                                                    resources
                                                      | js2n.Nullable
                                                        {
                                                          claims
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    name
                                                                      | String,
                                                                    request
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional
                                                                  }
                                                              ))
                                                            | optional,
                                                          limits
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      Number
                                                                  ]
                                                              })
                                                            | optional,
                                                          requests
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      Number
                                                                  ]
                                                              })
                                                            | optional
                                                        }
                                                      | optional,
                                                    restartPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    securityContext
                                                      | js2n.Nullable
                                                        {
                                                          allowPrivilegeEscalation
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          appArmorProfile
                                                            | js2n.Nullable
                                                              {
                                                                localhostProfile
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type | String
                                                              }
                                                            | optional,
                                                          capabilities
                                                            | js2n.Nullable
                                                              {
                                                                add
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                drop
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          privileged
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          procMount
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnlyRootFilesystem
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          runAsGroup
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          runAsNonRoot
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          runAsUser
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          seLinuxOptions
                                                            | js2n.Nullable
                                                              {
                                                                level
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                role
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                user
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          seccompProfile
                                                            | js2n.Nullable
                                                              {
                                                                localhostProfile
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type | String
                                                              }
                                                            | optional,
                                                          windowsOptions
                                                            | js2n.Nullable
                                                              {
                                                                gmsaCredentialSpec
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                gmsaCredentialSpecName
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                hostProcess
                                                                  | js2n.Nullable
                                                                    Bool
                                                                  | optional,
                                                                runAsUserName
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional
                                                        }
                                                      | optional,
                                                    startupProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    stdin
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    stdinOnce
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    targetContainerName
                                                      | js2n.Nullable String
                                                      | optional,
                                                    terminationMessagePath
                                                      | js2n.Nullable String
                                                      | optional,
                                                    terminationMessagePolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    tty
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    volumeDevices
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              devicePath
                                                                | String,
                                                              name | String
                                                            }
                                                        ))
                                                      | optional,
                                                    volumeMounts
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              mountPath
                                                                | String,
                                                              mountPropagation
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              name | String,
                                                              readOnly
                                                                | js2n.Nullable
                                                                  Bool
                                                                | optional,
                                                              recursiveReadOnly
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              subPath
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              subPathExpr
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    workingDir
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          hostAliases
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    hostnames
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    ip | String
                                                  }
                                              ))
                                            | optional,
                                          hostIPC
                                            | js2n.Nullable Bool
                                            | optional,
                                          hostNetwork
                                            | js2n.Nullable Bool
                                            | optional,
                                          hostPID
                                            | js2n.Nullable Bool
                                            | optional,
                                          hostUsers
                                            | js2n.Nullable Bool
                                            | optional,
                                          hostname
                                            | js2n.Nullable String
                                            | optional,
                                          imagePullSecrets
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    name
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          initContainers
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    args
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    command
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    env
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              name | String,
                                                              value
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              valueFrom
                                                                | js2n.Nullable
                                                                  {
                                                                    configMapKeyRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          key
                                                                            | String,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    fieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          apiVersion
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          fieldPath
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    resourceFieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          containerName
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          divisor
                                                                            | js2n.OneOf
                                                                              [
                                                                                js2n.Nullable
                                                                                  String,
                                                                                js2n.Nullable
                                                                                  Number
                                                                              ]
                                                                            | optional,
                                                                          resource
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    secretKeyRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          key
                                                                            | String,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional
                                                                  }
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    envFrom
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              configMapRef
                                                                | js2n.Nullable
                                                                  {
                                                                    name
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    "optional"
                                                                      | js2n.Nullable
                                                                        Bool
                                                                      | optional
                                                                  }
                                                                | optional,
                                                              prefix
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              secretRef
                                                                | js2n.Nullable
                                                                  {
                                                                    name
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    "optional"
                                                                      | js2n.Nullable
                                                                        Bool
                                                                      | optional
                                                                  }
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    image
                                                      | js2n.Nullable String
                                                      | optional,
                                                    imagePullPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    lifecycle
                                                      | js2n.Nullable
                                                        {
                                                          postStart
                                                            | js2n.Nullable
                                                              {
                                                                exec
                                                                  | js2n.Nullable
                                                                    {
                                                                      command
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              String
                                                                          ))
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                httpGet
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      httpHeaders
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                name
                                                                                  | String,
                                                                                value
                                                                                  | String
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      path
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ],
                                                                      scheme
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                sleep
                                                                  | js2n.Nullable
                                                                    {
                                                                      seconds
                                                                        | std.number.Integer
                                                                    }
                                                                  | optional,
                                                                tcpSocket
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ]
                                                                    }
                                                                  | optional
                                                              }
                                                            | optional,
                                                          preStop
                                                            | js2n.Nullable
                                                              {
                                                                exec
                                                                  | js2n.Nullable
                                                                    {
                                                                      command
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              String
                                                                          ))
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                httpGet
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      httpHeaders
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                name
                                                                                  | String,
                                                                                value
                                                                                  | String
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      path
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ],
                                                                      scheme
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                sleep
                                                                  | js2n.Nullable
                                                                    {
                                                                      seconds
                                                                        | std.number.Integer
                                                                    }
                                                                  | optional,
                                                                tcpSocket
                                                                  | js2n.Nullable
                                                                    {
                                                                      host
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      port
                                                                        | js2n.OneOf
                                                                          [
                                                                            js2n.Nullable
                                                                              String,
                                                                            js2n.Nullable
                                                                              std.number.Integer
                                                                          ]
                                                                    }
                                                                  | optional
                                                              }
                                                            | optional,
                                                          stopSignal
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    livenessProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    name | String,
                                                    ports
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              containerPort
                                                                | std.number.Integer,
                                                              hostIP
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              hostPort
                                                                | js2n.Nullable
                                                                  std.number.Integer
                                                                | optional,
                                                              name
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              protocol
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    readinessProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    resizePolicy
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              resourceName
                                                                | String,
                                                              restartPolicy
                                                                | String
                                                            }
                                                        ))
                                                      | optional,
                                                    resources
                                                      | js2n.Nullable
                                                        {
                                                          claims
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    name
                                                                      | String,
                                                                    request
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional
                                                                  }
                                                              ))
                                                            | optional,
                                                          limits
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      Number
                                                                  ]
                                                              })
                                                            | optional,
                                                          requests
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.OneOf
                                                                  [
                                                                    js2n.Nullable
                                                                      String,
                                                                    js2n.Nullable
                                                                      Number
                                                                  ]
                                                              })
                                                            | optional
                                                        }
                                                      | optional,
                                                    restartPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    securityContext
                                                      | js2n.Nullable
                                                        {
                                                          allowPrivilegeEscalation
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          appArmorProfile
                                                            | js2n.Nullable
                                                              {
                                                                localhostProfile
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type | String
                                                              }
                                                            | optional,
                                                          capabilities
                                                            | js2n.Nullable
                                                              {
                                                                add
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional,
                                                                drop
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          privileged
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          procMount
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnlyRootFilesystem
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          runAsGroup
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          runAsNonRoot
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          runAsUser
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          seLinuxOptions
                                                            | js2n.Nullable
                                                              {
                                                                level
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                role
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                user
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          seccompProfile
                                                            | js2n.Nullable
                                                              {
                                                                localhostProfile
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                type | String
                                                              }
                                                            | optional,
                                                          windowsOptions
                                                            | js2n.Nullable
                                                              {
                                                                gmsaCredentialSpec
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                gmsaCredentialSpecName
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                hostProcess
                                                                  | js2n.Nullable
                                                                    Bool
                                                                  | optional,
                                                                runAsUserName
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional
                                                        }
                                                      | optional,
                                                    startupProbe
                                                      | js2n.Nullable
                                                        {
                                                          exec
                                                            | js2n.Nullable
                                                              {
                                                                command
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        String
                                                                    ))
                                                                  | optional
                                                              }
                                                            | optional,
                                                          failureThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          grpc
                                                            | js2n.Nullable
                                                              {
                                                                port
                                                                  | std.number.Integer,
                                                                service
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          httpGet
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                httpHeaders
                                                                  | js2n.Nullable
                                                                    (Array (
                                                                      js2n.Nullable
                                                                        {
                                                                          name
                                                                            | String,
                                                                          value
                                                                            | String
                                                                        }
                                                                    ))
                                                                  | optional,
                                                                path
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ],
                                                                scheme
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          initialDelaySeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          periodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          successThreshold
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          tcpSocket
                                                            | js2n.Nullable
                                                              {
                                                                host
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional,
                                                                port
                                                                  | js2n.OneOf
                                                                    [
                                                                      js2n.Nullable
                                                                        String,
                                                                      js2n.Nullable
                                                                        std.number.Integer
                                                                    ]
                                                              }
                                                            | optional,
                                                          terminationGracePeriodSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          timeoutSeconds
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional
                                                        }
                                                      | optional,
                                                    stdin
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    stdinOnce
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    terminationMessagePath
                                                      | js2n.Nullable String
                                                      | optional,
                                                    terminationMessagePolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    tty
                                                      | js2n.Nullable Bool
                                                      | optional,
                                                    volumeDevices
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              devicePath
                                                                | String,
                                                              name | String
                                                            }
                                                        ))
                                                      | optional,
                                                    volumeMounts
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable
                                                            {
                                                              mountPath
                                                                | String,
                                                              mountPropagation
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              name | String,
                                                              readOnly
                                                                | js2n.Nullable
                                                                  Bool
                                                                | optional,
                                                              recursiveReadOnly
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              subPath
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              subPathExpr
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            }
                                                        ))
                                                      | optional,
                                                    workingDir
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          nodeName
                                            | js2n.Nullable String
                                            | optional,
                                          nodeSelector
                                            | js2n.Nullable
                                              ({ _ | js2n.Nullable String })
                                            | optional,
                                          os
                                            | js2n.Nullable { name | String }
                                            | optional,
                                          overhead
                                            | js2n.Nullable
                                              ({
                                                _ | js2n.OneOf
                                                  [
                                                    js2n.Nullable String,
                                                    js2n.Nullable Number
                                                  ]
                                              })
                                            | optional,
                                          preemptionPolicy
                                            | js2n.Nullable String
                                            | optional,
                                          "priority"
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          priorityClassName
                                            | js2n.Nullable String
                                            | optional,
                                          readinessGates
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  { conditionType | String }
                                              ))
                                            | optional,
                                          resourceClaims
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    name | String,
                                                    resourceClaimName
                                                      | js2n.Nullable String
                                                      | optional,
                                                    resourceClaimTemplateName
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          resources
                                            | js2n.Nullable
                                              {
                                                claims
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable
                                                        {
                                                          name | String,
                                                          request
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                    ))
                                                  | optional,
                                                limits
                                                  | js2n.Nullable
                                                    ({
                                                      _ | js2n.OneOf
                                                        [
                                                          js2n.Nullable String,
                                                          js2n.Nullable Number
                                                        ]
                                                    })
                                                  | optional,
                                                requests
                                                  | js2n.Nullable
                                                    ({
                                                      _ | js2n.OneOf
                                                        [
                                                          js2n.Nullable String,
                                                          js2n.Nullable Number
                                                        ]
                                                    })
                                                  | optional
                                              }
                                            | optional,
                                          restartPolicy
                                            | js2n.Nullable String
                                            | optional,
                                          runtimeClassName
                                            | js2n.Nullable String
                                            | optional,
                                          schedulerName
                                            | js2n.Nullable String
                                            | optional,
                                          schedulingGates
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable { name | String }
                                              ))
                                            | optional,
                                          securityContext
                                            | js2n.Nullable
                                              {
                                                appArmorProfile
                                                  | js2n.Nullable
                                                    {
                                                      localhostProfile
                                                        | js2n.Nullable String
                                                        | optional,
                                                      type | String
                                                    }
                                                  | optional,
                                                fsGroup
                                                  | js2n.Nullable
                                                    std.number.Integer
                                                  | optional,
                                                fsGroupChangePolicy
                                                  | js2n.Nullable String
                                                  | optional,
                                                runAsGroup
                                                  | js2n.Nullable
                                                    std.number.Integer
                                                  | optional,
                                                runAsNonRoot
                                                  | js2n.Nullable Bool
                                                  | optional,
                                                runAsUser
                                                  | js2n.Nullable
                                                    std.number.Integer
                                                  | optional,
                                                seLinuxChangePolicy
                                                  | js2n.Nullable String
                                                  | optional,
                                                seLinuxOptions
                                                  | js2n.Nullable
                                                    {
                                                      level
                                                        | js2n.Nullable String
                                                        | optional,
                                                      role
                                                        | js2n.Nullable String
                                                        | optional,
                                                      type
                                                        | js2n.Nullable String
                                                        | optional,
                                                      user
                                                        | js2n.Nullable String
                                                        | optional
                                                    }
                                                  | optional,
                                                seccompProfile
                                                  | js2n.Nullable
                                                    {
                                                      localhostProfile
                                                        | js2n.Nullable String
                                                        | optional,
                                                      type | String
                                                    }
                                                  | optional,
                                                supplementalGroups
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable
                                                        std.number.Integer
                                                    ))
                                                  | optional,
                                                supplementalGroupsPolicy
                                                  | js2n.Nullable String
                                                  | optional,
                                                sysctls
                                                  | js2n.Nullable
                                                    (Array (
                                                      js2n.Nullable
                                                        {
                                                          name | String,
                                                          value | String
                                                        }
                                                    ))
                                                  | optional,
                                                windowsOptions
                                                  | js2n.Nullable
                                                    {
                                                      gmsaCredentialSpec
                                                        | js2n.Nullable String
                                                        | optional,
                                                      gmsaCredentialSpecName
                                                        | js2n.Nullable String
                                                        | optional,
                                                      hostProcess
                                                        | js2n.Nullable Bool
                                                        | optional,
                                                      runAsUserName
                                                        | js2n.Nullable String
                                                        | optional
                                                    }
                                                  | optional
                                              }
                                            | optional,
                                          serviceAccount
                                            | js2n.Nullable String
                                            | optional,
                                          serviceAccountName
                                            | js2n.Nullable String
                                            | optional,
                                          setHostnameAsFQDN
                                            | js2n.Nullable Bool
                                            | optional,
                                          shareProcessNamespace
                                            | js2n.Nullable Bool
                                            | optional,
                                          subdomain
                                            | js2n.Nullable String
                                            | optional,
                                          terminationGracePeriodSeconds
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          tolerations
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    effect
                                                      | js2n.Nullable String
                                                      | optional,
                                                    key
                                                      | js2n.Nullable String
                                                      | optional,
                                                    operator
                                                      | js2n.Nullable String
                                                      | optional,
                                                    tolerationSeconds
                                                      | js2n.Nullable
                                                        std.number.Integer
                                                      | optional,
                                                    value
                                                      | js2n.Nullable String
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          topologySpreadConstraints
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    labelSelector
                                                      | js2n.Nullable
                                                        {
                                                          matchExpressions
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    key
                                                                      | String,
                                                                    operator
                                                                      | String,
                                                                    values
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional
                                                                  }
                                                              ))
                                                            | optional,
                                                          matchLabels
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.Nullable
                                                                  String
                                                              })
                                                            | optional
                                                        }
                                                      | optional,
                                                    matchLabelKeys
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional,
                                                    maxSkew
                                                      | std.number.Integer,
                                                    minDomains
                                                      | js2n.Nullable
                                                        std.number.Integer
                                                      | optional,
                                                    nodeAffinityPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    nodeTaintsPolicy
                                                      | js2n.Nullable String
                                                      | optional,
                                                    topologyKey | String,
                                                    whenUnsatisfiable | String
                                                  }
                                              ))
                                            | optional,
                                          volumes
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    awsElasticBlockStore
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          partition
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          volumeID | String
                                                        }
                                                      | optional,
                                                    azureDisk
                                                      | js2n.Nullable
                                                        {
                                                          cachingMode
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          diskName | String,
                                                          diskURI | String,
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          kind
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional
                                                        }
                                                      | optional,
                                                    azureFile
                                                      | js2n.Nullable
                                                        {
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretName | String,
                                                          shareName | String
                                                        }
                                                      | optional,
                                                    cephfs
                                                      | js2n.Nullable
                                                        {
                                                          monitors
                                                            | Array (
                                                              js2n.Nullable
                                                                String
                                                            ),
                                                          path
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretFile
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          user
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    cinder
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          volumeID | String
                                                        }
                                                      | optional,
                                                    configMap
                                                      | js2n.Nullable
                                                        {
                                                          defaultMode
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          items
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    key
                                                                      | String,
                                                                    mode
                                                                      | js2n.Nullable
                                                                        std.number.Integer
                                                                      | optional,
                                                                    path
                                                                      | String
                                                                  }
                                                              ))
                                                            | optional,
                                                          name
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          "optional"
                                                            | js2n.Nullable Bool
                                                            | optional
                                                        }
                                                      | optional,
                                                    csi
                                                      | js2n.Nullable
                                                        {
                                                          driver | String,
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          nodePublishSecretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          volumeAttributes
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.Nullable
                                                                  String
                                                              })
                                                            | optional
                                                        }
                                                      | optional,
                                                    downwardAPI
                                                      | js2n.Nullable
                                                        {
                                                          defaultMode
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          items
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    fieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          apiVersion
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          fieldPath
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    mode
                                                                      | js2n.Nullable
                                                                        std.number.Integer
                                                                      | optional,
                                                                    path
                                                                      | String,
                                                                    resourceFieldRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          containerName
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          divisor
                                                                            | js2n.OneOf
                                                                              [
                                                                                js2n.Nullable
                                                                                  String,
                                                                                js2n.Nullable
                                                                                  Number
                                                                              ]
                                                                            | optional,
                                                                          resource
                                                                            | String
                                                                        }
                                                                      | optional
                                                                  }
                                                              ))
                                                            | optional
                                                        }
                                                      | optional,
                                                    emptyDir
                                                      | js2n.Nullable
                                                        {
                                                          medium
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          sizeLimit
                                                            | js2n.OneOf
                                                              [
                                                                js2n.Nullable
                                                                  String,
                                                                js2n.Nullable
                                                                  Number
                                                              ]
                                                            | optional
                                                        }
                                                      | optional,
                                                    ephemeral
                                                      | js2n.Nullable
                                                        {
                                                          volumeClaimTemplate
                                                            | js2n.Nullable
                                                              {
                                                                metadata
                                                                  | js2n.Nullable
                                                                    {
                                                                      annotations
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional,
                                                                      creationTimestamp
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      deletionGracePeriodSeconds
                                                                        | js2n.Nullable
                                                                          std.number.Integer
                                                                        | optional,
                                                                      deletionTimestamp
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      finalizers
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              String
                                                                          ))
                                                                        | optional,
                                                                      generateName
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      generation
                                                                        | js2n.Nullable
                                                                          std.number.Integer
                                                                        | optional,
                                                                      labels
                                                                        | js2n.Nullable
                                                                          ({
                                                                            _ | js2n.Nullable
                                                                              String
                                                                          })
                                                                        | optional,
                                                                      managedFields
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                apiVersion
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional,
                                                                                fieldsType
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional,
                                                                                fieldsV1
                                                                                  | js2n.Nullable
                                                                                    ({
                                                                                      _ | Dyn
                                                                                    })
                                                                                  | optional,
                                                                                manager
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional,
                                                                                operation
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional,
                                                                                subresource
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional,
                                                                                time
                                                                                  | js2n.Nullable
                                                                                    String
                                                                                  | optional
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      name
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      namespace
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      ownerReferences
                                                                        | js2n.Nullable
                                                                          (Array (
                                                                            js2n.Nullable
                                                                              {
                                                                                apiVersion
                                                                                  | String,
                                                                                blockOwnerDeletion
                                                                                  | js2n.Nullable
                                                                                    Bool
                                                                                  | optional,
                                                                                controller
                                                                                  | js2n.Nullable
                                                                                    Bool
                                                                                  | optional,
                                                                                kind
                                                                                  | String,
                                                                                name
                                                                                  | String,
                                                                                uid
                                                                                  | String
                                                                              }
                                                                          ))
                                                                        | optional,
                                                                      resourceVersion
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      selfLink
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional,
                                                                      uid
                                                                        | js2n.Nullable
                                                                          String
                                                                        | optional
                                                                    }
                                                                  | optional,
                                                                spec
                                                                  | {
                                                                    accessModes
                                                                      | js2n.Nullable
                                                                        (Array (
                                                                          js2n.Nullable
                                                                            String
                                                                        ))
                                                                      | optional,
                                                                    dataSource
                                                                      | js2n.Nullable
                                                                        {
                                                                          apiGroup
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          kind
                                                                            | String,
                                                                          name
                                                                            | String
                                                                        }
                                                                      | optional,
                                                                    dataSourceRef
                                                                      | js2n.Nullable
                                                                        {
                                                                          apiGroup
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          kind
                                                                            | String,
                                                                          name
                                                                            | String,
                                                                          namespace
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    resources
                                                                      | js2n.Nullable
                                                                        {
                                                                          limits
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.OneOf
                                                                                  [
                                                                                    js2n.Nullable
                                                                                      String,
                                                                                    js2n.Nullable
                                                                                      Number
                                                                                  ]
                                                                              })
                                                                            | optional,
                                                                          requests
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.OneOf
                                                                                  [
                                                                                    js2n.Nullable
                                                                                      String,
                                                                                    js2n.Nullable
                                                                                      Number
                                                                                  ]
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    selector
                                                                      | js2n.Nullable
                                                                        {
                                                                          matchExpressions
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    operator
                                                                                      | String,
                                                                                    values
                                                                                      | js2n.Nullable
                                                                                        (Array (
                                                                                          js2n.Nullable
                                                                                            String
                                                                                        ))
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          matchLabels
                                                                            | js2n.Nullable
                                                                              ({
                                                                                _ | js2n.Nullable
                                                                                  String
                                                                              })
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    storageClassName
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    volumeAttributesClassName
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    volumeMode
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional,
                                                                    volumeName
                                                                      | js2n.Nullable
                                                                        String
                                                                      | optional
                                                                  }
                                                              }
                                                            | optional
                                                        }
                                                      | optional,
                                                    fc
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          lun
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          targetWWNs
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  String
                                                              ))
                                                            | optional,
                                                          wwids
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  String
                                                              ))
                                                            | optional
                                                        }
                                                      | optional,
                                                    flexVolume
                                                      | js2n.Nullable
                                                        {
                                                          driver | String,
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          options
                                                            | js2n.Nullable
                                                              ({
                                                                _ | js2n.Nullable
                                                                  String
                                                              })
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional
                                                        }
                                                      | optional,
                                                    flocker
                                                      | js2n.Nullable
                                                        {
                                                          datasetName
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          datasetUUID
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    gcePersistentDisk
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          partition
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          pdName | String,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional
                                                        }
                                                      | optional,
                                                    gitRepo
                                                      | js2n.Nullable
                                                        {
                                                          directory
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          repository | String,
                                                          revision
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    glusterfs
                                                      | js2n.Nullable
                                                        {
                                                          endpoints | String,
                                                          path | String,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional
                                                        }
                                                      | optional,
                                                    hostPath
                                                      | js2n.Nullable
                                                        {
                                                          path | String,
                                                          type
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    image
                                                      | js2n.Nullable
                                                        {
                                                          pullPolicy
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          reference
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    iscsi
                                                      | js2n.Nullable
                                                        {
                                                          chapAuthDiscovery
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          chapAuthSession
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          initiatorName
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          iqn | String,
                                                          iscsiInterface
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          lun
                                                            | std.number.Integer,
                                                          portals
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  String
                                                              ))
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          targetPortal | String
                                                        }
                                                      | optional,
                                                    name | String,
                                                    nfs
                                                      | js2n.Nullable
                                                        {
                                                          path | String,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          server | String
                                                        }
                                                      | optional,
                                                    persistentVolumeClaim
                                                      | js2n.Nullable
                                                        {
                                                          claimName | String,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional
                                                        }
                                                      | optional,
                                                    photonPersistentDisk
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          pdID | String
                                                        }
                                                      | optional,
                                                    portworxVolume
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          volumeID | String
                                                        }
                                                      | optional,
                                                    projected
                                                      | js2n.Nullable
                                                        {
                                                          defaultMode
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          sources
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    clusterTrustBundle
                                                                      | js2n.Nullable
                                                                        {
                                                                          labelSelector
                                                                            | js2n.Nullable
                                                                              {
                                                                                matchExpressions
                                                                                  | js2n.Nullable
                                                                                    (Array (
                                                                                      js2n.Nullable
                                                                                        {
                                                                                          key
                                                                                            | String,
                                                                                          operator
                                                                                            | String,
                                                                                          values
                                                                                            | js2n.Nullable
                                                                                              (Array (
                                                                                                js2n.Nullable
                                                                                                  String
                                                                                              ))
                                                                                            | optional
                                                                                        }
                                                                                    ))
                                                                                  | optional,
                                                                                matchLabels
                                                                                  | js2n.Nullable
                                                                                    ({
                                                                                      _ | js2n.Nullable
                                                                                        String
                                                                                    })
                                                                                  | optional
                                                                              }
                                                                            | optional,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional,
                                                                          path
                                                                            | String,
                                                                          signerName
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    configMap
                                                                      | js2n.Nullable
                                                                        {
                                                                          items
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    mode
                                                                                      | js2n.Nullable
                                                                                        std.number.Integer
                                                                                      | optional,
                                                                                    path
                                                                                      | String
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    downwardAPI
                                                                      | js2n.Nullable
                                                                        {
                                                                          items
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    fieldRef
                                                                                      | js2n.Nullable
                                                                                        {
                                                                                          apiVersion
                                                                                            | js2n.Nullable
                                                                                              String
                                                                                            | optional,
                                                                                          fieldPath
                                                                                            | String
                                                                                        }
                                                                                      | optional,
                                                                                    mode
                                                                                      | js2n.Nullable
                                                                                        std.number.Integer
                                                                                      | optional,
                                                                                    path
                                                                                      | String,
                                                                                    resourceFieldRef
                                                                                      | js2n.Nullable
                                                                                        {
                                                                                          containerName
                                                                                            | js2n.Nullable
                                                                                              String
                                                                                            | optional,
                                                                                          divisor
                                                                                            | js2n.OneOf
                                                                                              [
                                                                                                js2n.Nullable
                                                                                                  String,
                                                                                                js2n.Nullable
                                                                                                  Number
                                                                                              ]
                                                                                            | optional,
                                                                                          resource
                                                                                            | String
                                                                                        }
                                                                                      | optional
                                                                                  }
                                                                              ))
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    secret
                                                                      | js2n.Nullable
                                                                        {
                                                                          items
                                                                            | js2n.Nullable
                                                                              (Array (
                                                                                js2n.Nullable
                                                                                  {
                                                                                    key
                                                                                      | String,
                                                                                    mode
                                                                                      | js2n.Nullable
                                                                                        std.number.Integer
                                                                                      | optional,
                                                                                    path
                                                                                      | String
                                                                                  }
                                                                              ))
                                                                            | optional,
                                                                          name
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          "optional"
                                                                            | js2n.Nullable
                                                                              Bool
                                                                            | optional
                                                                        }
                                                                      | optional,
                                                                    serviceAccountToken
                                                                      | js2n.Nullable
                                                                        {
                                                                          audience
                                                                            | js2n.Nullable
                                                                              String
                                                                            | optional,
                                                                          expirationSeconds
                                                                            | js2n.Nullable
                                                                              std.number.Integer
                                                                            | optional,
                                                                          path
                                                                            | String
                                                                        }
                                                                      | optional
                                                                  }
                                                              ))
                                                            | optional
                                                        }
                                                      | optional,
                                                    quobyte
                                                      | js2n.Nullable
                                                        {
                                                          group
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          registry | String,
                                                          tenant
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          user
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          volume | String
                                                        }
                                                      | optional,
                                                    rbd
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          image | String,
                                                          keyring
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          monitors
                                                            | Array (
                                                              js2n.Nullable
                                                                String
                                                            ),
                                                          pool
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          user
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    scaleIO
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          gateway | String,
                                                          protectionDomain
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | {
                                                              name
                                                                | js2n.Nullable
                                                                  String
                                                                | optional
                                                            },
                                                          sslEnabled
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          storageMode
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          storagePool
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          system | String,
                                                          volumeName
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    secret
                                                      | js2n.Nullable
                                                        {
                                                          defaultMode
                                                            | js2n.Nullable
                                                              std.number.Integer
                                                            | optional,
                                                          items
                                                            | js2n.Nullable
                                                              (Array (
                                                                js2n.Nullable
                                                                  {
                                                                    key
                                                                      | String,
                                                                    mode
                                                                      | js2n.Nullable
                                                                        std.number.Integer
                                                                      | optional,
                                                                    path
                                                                      | String
                                                                  }
                                                              ))
                                                            | optional,
                                                          "optional"
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretName
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    storageos
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          readOnly
                                                            | js2n.Nullable Bool
                                                            | optional,
                                                          secretRef
                                                            | js2n.Nullable
                                                              {
                                                                name
                                                                  | js2n.Nullable
                                                                    String
                                                                  | optional
                                                              }
                                                            | optional,
                                                          volumeName
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          volumeNamespace
                                                            | js2n.Nullable
                                                              String
                                                            | optional
                                                        }
                                                      | optional,
                                                    vsphereVolume
                                                      | js2n.Nullable
                                                        {
                                                          fsType
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          storagePolicyID
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          storagePolicyName
                                                            | js2n.Nullable
                                                              String
                                                            | optional,
                                                          volumePath | String
                                                        }
                                                      | optional
                                                  }
                                              ))
                                            | optional
                                        }
                                      | optional
                                  },
                                ttlSecondsAfterFinished
                                  | js2n.Nullable std.number.Integer
                                  | optional
                              }
                            | optional
                        },
                      schedule | String,
                      startingDeadlineSeconds
                        | js2n.Nullable std.number.Integer
                        | optional,
                      successfulJobsHistoryLimit
                        | js2n.Nullable std.number.Integer
                        | optional,
                      suspend | js2n.Nullable Bool | optional,
                      timeZone | js2n.Nullable String | optional
                    }
                  | optional,
                status
                  | js2n.Nullable
                    {
                      active
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                apiVersion | js2n.Nullable String | optional,
                                fieldPath | js2n.Nullable String | optional,
                                kind | js2n.Nullable String | optional,
                                name | js2n.Nullable String | optional,
                                namespace | js2n.Nullable String | optional,
                                resourceVersion
                                  | js2n.Nullable String
                                  | optional,
                                uid | js2n.Nullable String | optional
                              }
                          ))
                        | optional,
                      lastScheduleTime | js2n.Nullable String | optional,
                      lastSuccessfulTime | js2n.Nullable String | optional
                    }
                  | optional
              }
          )),
      kind | std.enum.TagOrString | [| 'CronJobList |] | optional,
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