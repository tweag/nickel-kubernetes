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
      device | js2n.Nullable String,
      driver | js2n.Nullable String,
      networkData
        | js2n.Nullable
          {
            hardwareAddress | js2n.Nullable String | optional,
            interfaceName | js2n.Nullable String | optional,
            ips | js2n.Nullable (Array (js2n.Nullable String)) | optional
          }
        | optional,
      pool | js2n.Nullable String,
      shareID | js2n.Nullable String | optional
    }