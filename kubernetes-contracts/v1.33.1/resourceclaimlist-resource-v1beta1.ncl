# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"resource.k8s.io/v1beta1" |]
        | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion
                  | std.enum.TagOrString
                  | [| '"resource.k8s.io/v1beta1" |]
                  | optional,
                kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
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
                    devices
                      | js2n.Nullable
                        {
                          config
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    opaque
                                      | js2n.Nullable
                                        {
                                          driver | String,
                                          parameters | { _ | Dyn }
                                        }
                                      | optional,
                                    requests
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional
                                  }
                              ))
                            | optional,
                          constraints
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    matchAttribute
                                      | js2n.Nullable String
                                      | optional,
                                    requests
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional
                                  }
                              ))
                            | optional,
                          requests
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    adminAccess | js2n.Nullable Bool | optional,
                                    allocationMode
                                      | js2n.Nullable String
                                      | optional,
                                    count
                                      | js2n.Nullable std.number.Integer
                                      | optional,
                                    deviceClassName
                                      | js2n.Nullable String
                                      | optional,
                                    firstAvailable
                                      | js2n.Nullable
                                        (Array (
                                          js2n.Nullable
                                            {
                                              allocationMode
                                                | js2n.Nullable String
                                                | optional,
                                              count
                                                | js2n.Nullable
                                                  std.number.Integer
                                                | optional,
                                              deviceClassName | String,
                                              name | String,
                                              selectors
                                                | js2n.Nullable
                                                  (Array (
                                                    js2n.Nullable
                                                      {
                                                        cel
                                                          | js2n.Nullable
                                                            {
                                                              expression
                                                                | String
                                                            }
                                                          | optional
                                                      }
                                                  ))
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
                                                | optional
                                            }
                                        ))
                                      | optional,
                                    name | String,
                                    selectors
                                      | js2n.Nullable
                                        (Array (
                                          js2n.Nullable
                                            {
                                              cel
                                                | js2n.Nullable
                                                  { expression | String }
                                                | optional
                                            }
                                        ))
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
                                      | optional
                                  }
                              ))
                            | optional
                        }
                      | optional
                  },
                status
                  | js2n.Nullable
                    {
                      allocation
                        | js2n.Nullable
                          {
                            devices
                              | js2n.Nullable
                                {
                                  config
                                    | js2n.Nullable
                                      (Array (
                                        js2n.Nullable
                                          {
                                            opaque
                                              | js2n.Nullable
                                                {
                                                  driver | String,
                                                  parameters | { _ | Dyn }
                                                }
                                              | optional,
                                            requests
                                              | js2n.Nullable
                                                (Array (js2n.Nullable String))
                                              | optional,
                                            source | String
                                          }
                                      ))
                                    | optional,
                                  results
                                    | js2n.Nullable
                                      (Array (
                                        js2n.Nullable
                                          {
                                            adminAccess
                                              | js2n.Nullable Bool
                                              | optional,
                                            device | String,
                                            driver | String,
                                            pool | String,
                                            request | String,
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
                                              | optional
                                          }
                                      ))
                                    | optional
                                }
                              | optional,
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
                              | optional
                          }
                        | optional,
                      devices
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
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
                                data | js2n.Nullable ({ _ | Dyn }) | optional,
                                device | String,
                                driver | String,
                                networkData
                                  | js2n.Nullable
                                    {
                                      hardwareAddress
                                        | js2n.Nullable String
                                        | optional,
                                      interfaceName
                                        | js2n.Nullable String
                                        | optional,
                                      ips
                                        | js2n.Nullable
                                          (Array (js2n.Nullable String))
                                        | optional
                                    }
                                  | optional,
                                pool | String
                              }
                          ))
                        | optional,
                      reservedFor
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                apiGroup | js2n.Nullable String | optional,
                                name | String,
                                resource | String,
                                uid | String
                              }
                          ))
                        | optional
                    }
                  | optional
              }
          )),
      kind | std.enum.TagOrString | [| 'ResourceClaimList |] | optional,
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