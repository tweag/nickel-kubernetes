# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      kind | std.enum.TagOrString | [| 'PersistentVolumeClaim |] | optional,
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
            accessModes
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            dataSource
              | js2n.Nullable
                {
                  apiGroup | js2n.Nullable String | optional,
                  kind | String,
                  name | String
                }
              | optional,
            dataSourceRef
              | js2n.Nullable
                {
                  apiGroup | js2n.Nullable String | optional,
                  kind | String,
                  name | String,
                  namespace | js2n.Nullable String | optional
                }
              | optional,
            resources
              | js2n.Nullable
                {
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
            storageClassName | js2n.Nullable String | optional,
            volumeAttributesClassName | js2n.Nullable String | optional,
            volumeMode | js2n.Nullable String | optional,
            volumeName | js2n.Nullable String | optional
          }
        | optional,
      status
        | js2n.Nullable
          {
            accessModes
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            allocatedResourceStatuses
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional,
            allocatedResources
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional,
            capacity
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional,
            conditions
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      lastProbeTime | js2n.Nullable String | optional,
                      lastTransitionTime | js2n.Nullable String | optional,
                      message | js2n.Nullable String | optional,
                      reason | js2n.Nullable String | optional,
                      status | String,
                      type | String
                    }
                ))
              | optional,
            currentVolumeAttributesClassName | js2n.Nullable String | optional,
            modifyVolumeStatus
              | js2n.Nullable
                {
                  status | String,
                  targetVolumeAttributesClassName
                    | js2n.Nullable String
                    | optional
                }
              | optional,
            phase | js2n.Nullable String | optional
          }
        | optional
    }