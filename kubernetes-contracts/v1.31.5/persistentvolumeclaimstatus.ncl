# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      accessModes | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      allocatedResourceStatuses
        | js2n.Nullable ({ _ | js2n.Nullable String })
        | optional,
      allocatedResources
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
            targetVolumeAttributesClassName | js2n.Nullable String | optional
          }
        | optional,
      phase | js2n.Nullable String | optional
    }