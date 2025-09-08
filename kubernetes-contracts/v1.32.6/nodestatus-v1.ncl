# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      addresses
        | js2n.Nullable
          (Array (js2n.Nullable { address | String, type | String }))
        | optional,
      allocatable
        | js2n.Nullable
          ({ _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ] })
        | optional,
      capacity
        | js2n.Nullable
          ({ _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ] })
        | optional,
      conditions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                lastHeartbeatTime | js2n.Nullable String | optional,
                lastTransitionTime | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                reason | js2n.Nullable String | optional,
                status | String,
                type | String
              }
          ))
        | optional,
      config
        | js2n.Nullable
          {
            active
              | js2n.Nullable
                {
                  configMap
                    | js2n.Nullable
                      {
                        kubeletConfigKey | String,
                        name | String,
                        namespace | String,
                        resourceVersion | js2n.Nullable String | optional,
                        uid | js2n.Nullable String | optional
                      }
                    | optional
                }
              | optional,
            assigned
              | js2n.Nullable
                {
                  configMap
                    | js2n.Nullable
                      {
                        kubeletConfigKey | String,
                        name | String,
                        namespace | String,
                        resourceVersion | js2n.Nullable String | optional,
                        uid | js2n.Nullable String | optional
                      }
                    | optional
                }
              | optional,
            error | js2n.Nullable String | optional,
            lastKnownGood
              | js2n.Nullable
                {
                  configMap
                    | js2n.Nullable
                      {
                        kubeletConfigKey | String,
                        name | String,
                        namespace | String,
                        resourceVersion | js2n.Nullable String | optional,
                        uid | js2n.Nullable String | optional
                      }
                    | optional
                }
              | optional
          }
        | optional,
      daemonEndpoints
        | js2n.Nullable
          {
            kubeletEndpoint
              | js2n.Nullable { Port | std.number.Integer }
              | optional
          }
        | optional,
      features
        | js2n.Nullable
          { supplementalGroupsPolicy | js2n.Nullable Bool | optional }
        | optional,
      images
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                names | js2n.Nullable (Array (js2n.Nullable String)) | optional,
                sizeBytes | js2n.Nullable std.number.Integer | optional
              }
          ))
        | optional,
      nodeInfo
        | js2n.Nullable
          {
            architecture | String,
            bootID | String,
            containerRuntimeVersion | String,
            kernelVersion | String,
            kubeProxyVersion | String,
            kubeletVersion | String,
            machineID | String,
            operatingSystem | String,
            osImage | String,
            systemUUID | String
          }
        | optional,
      phase | js2n.Nullable String | optional,
      runtimeHandlers
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                features
                  | js2n.Nullable
                    {
                      recursiveReadOnlyMounts | js2n.Nullable Bool | optional,
                      userNamespaces | js2n.Nullable Bool | optional
                    }
                  | optional,
                name | js2n.Nullable String | optional
              }
          ))
        | optional,
      volumesAttached
        | js2n.Nullable
          (Array (js2n.Nullable { devicePath | String, name | String }))
        | optional,
      volumesInUse | js2n.Nullable (Array (js2n.Nullable String)) | optional
    }