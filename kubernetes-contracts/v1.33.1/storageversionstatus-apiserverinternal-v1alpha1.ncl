# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      commonEncodingVersion | js2n.Nullable String | optional,
      conditions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                lastTransitionTime | js2n.Nullable String | optional,
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
      storageVersions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiServerID | js2n.Nullable String | optional,
                decodableVersions
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                encodingVersion | js2n.Nullable String | optional,
                servedVersions
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional
              }
          ))
        | optional
    }