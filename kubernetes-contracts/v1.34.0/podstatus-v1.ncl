# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      conditions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                lastProbeTime | js2n.Nullable String | optional,
                lastTransitionTime | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                observedGeneration
                  | js2n.Nullable std.number.Integer
                  | optional,
                reason | js2n.Nullable String | optional,
                status | String,
                type | String
              }
          ))
        | optional,
      containerStatuses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                allocatedResources
                  | js2n.Nullable
                    ({
                      _ | js2n.OneOf
                        [ js2n.Nullable String, js2n.Nullable Number ]
                    })
                  | optional,
                allocatedResourcesStatus
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          name | String,
                          resources
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    health | js2n.Nullable String | optional,
                                    resourceID | String
                                  }
                              ))
                            | optional
                        }
                    ))
                  | optional,
                containerID | js2n.Nullable String | optional,
                image | String,
                imageID | String,
                lastState
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                name | String,
                ready | Bool,
                resources
                  | js2n.Nullable
                    {
                      claims
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                name | String,
                                request | js2n.Nullable String | optional
                              }
                          ))
                        | optional,
                      limits
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional,
                      requests
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional
                    }
                  | optional,
                restartCount | std.number.Integer,
                started | js2n.Nullable Bool | optional,
                state
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                stopSignal | js2n.Nullable String | optional,
                user
                  | js2n.Nullable
                    {
                      linux
                        | js2n.Nullable
                          {
                            gid | std.number.Integer,
                            supplementalGroups
                              | js2n.Nullable
                                (Array (js2n.Nullable std.number.Integer))
                              | optional,
                            uid | std.number.Integer
                          }
                        | optional
                    }
                  | optional,
                volumeMounts
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          mountPath | String,
                          name | String,
                          readOnly | js2n.Nullable Bool | optional,
                          recursiveReadOnly | js2n.Nullable String | optional
                        }
                    ))
                  | optional
              }
          ))
        | optional,
      ephemeralContainerStatuses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                allocatedResources
                  | js2n.Nullable
                    ({
                      _ | js2n.OneOf
                        [ js2n.Nullable String, js2n.Nullable Number ]
                    })
                  | optional,
                allocatedResourcesStatus
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          name | String,
                          resources
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    health | js2n.Nullable String | optional,
                                    resourceID | String
                                  }
                              ))
                            | optional
                        }
                    ))
                  | optional,
                containerID | js2n.Nullable String | optional,
                image | String,
                imageID | String,
                lastState
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                name | String,
                ready | Bool,
                resources
                  | js2n.Nullable
                    {
                      claims
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                name | String,
                                request | js2n.Nullable String | optional
                              }
                          ))
                        | optional,
                      limits
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional,
                      requests
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional
                    }
                  | optional,
                restartCount | std.number.Integer,
                started | js2n.Nullable Bool | optional,
                state
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                stopSignal | js2n.Nullable String | optional,
                user
                  | js2n.Nullable
                    {
                      linux
                        | js2n.Nullable
                          {
                            gid | std.number.Integer,
                            supplementalGroups
                              | js2n.Nullable
                                (Array (js2n.Nullable std.number.Integer))
                              | optional,
                            uid | std.number.Integer
                          }
                        | optional
                    }
                  | optional,
                volumeMounts
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          mountPath | String,
                          name | String,
                          readOnly | js2n.Nullable Bool | optional,
                          recursiveReadOnly | js2n.Nullable String | optional
                        }
                    ))
                  | optional
              }
          ))
        | optional,
      extendedResourceClaimStatus
        | js2n.Nullable
          {
            requestMappings
              | Array (
                js2n.Nullable
                  {
                    containerName | String,
                    requestName | String,
                    resourceName | String
                  }
              ),
            resourceClaimName | String
          }
        | optional,
      hostIP | js2n.Nullable String | optional,
      hostIPs
        | js2n.Nullable (Array (js2n.Nullable { ip | String }))
        | optional,
      initContainerStatuses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                allocatedResources
                  | js2n.Nullable
                    ({
                      _ | js2n.OneOf
                        [ js2n.Nullable String, js2n.Nullable Number ]
                    })
                  | optional,
                allocatedResourcesStatus
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          name | String,
                          resources
                            | js2n.Nullable
                              (Array (
                                js2n.Nullable
                                  {
                                    health | js2n.Nullable String | optional,
                                    resourceID | String
                                  }
                              ))
                            | optional
                        }
                    ))
                  | optional,
                containerID | js2n.Nullable String | optional,
                image | String,
                imageID | String,
                lastState
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                name | String,
                ready | Bool,
                resources
                  | js2n.Nullable
                    {
                      claims
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                name | String,
                                request | js2n.Nullable String | optional
                              }
                          ))
                        | optional,
                      limits
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional,
                      requests
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional
                    }
                  | optional,
                restartCount | std.number.Integer,
                started | js2n.Nullable Bool | optional,
                state
                  | js2n.Nullable
                    {
                      running
                        | js2n.Nullable
                          { startedAt | js2n.Nullable String | optional }
                        | optional,
                      terminated
                        | js2n.Nullable
                          {
                            containerID | js2n.Nullable String | optional,
                            exitCode | std.number.Integer,
                            finishedAt | js2n.Nullable String | optional,
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional,
                            signal
                              | js2n.Nullable std.number.Integer
                              | optional,
                            startedAt | js2n.Nullable String | optional
                          }
                        | optional,
                      waiting
                        | js2n.Nullable
                          {
                            message | js2n.Nullable String | optional,
                            reason | js2n.Nullable String | optional
                          }
                        | optional
                    }
                  | optional,
                stopSignal | js2n.Nullable String | optional,
                user
                  | js2n.Nullable
                    {
                      linux
                        | js2n.Nullable
                          {
                            gid | std.number.Integer,
                            supplementalGroups
                              | js2n.Nullable
                                (Array (js2n.Nullable std.number.Integer))
                              | optional,
                            uid | std.number.Integer
                          }
                        | optional
                    }
                  | optional,
                volumeMounts
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          mountPath | String,
                          name | String,
                          readOnly | js2n.Nullable Bool | optional,
                          recursiveReadOnly | js2n.Nullable String | optional
                        }
                    ))
                  | optional
              }
          ))
        | optional,
      message | js2n.Nullable String | optional,
      nominatedNodeName | js2n.Nullable String | optional,
      observedGeneration | js2n.Nullable std.number.Integer | optional,
      phase | js2n.Nullable String | optional,
      podIP | js2n.Nullable String | optional,
      podIPs | js2n.Nullable (Array (js2n.Nullable { ip | String })) | optional,
      qosClass | js2n.Nullable String | optional,
      reason | js2n.Nullable String | optional,
      resize | js2n.Nullable String | optional,
      resourceClaimStatuses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                name | String,
                resourceClaimName | js2n.Nullable String | optional
              }
          ))
        | optional,
      startTime | js2n.Nullable String | optional
    }