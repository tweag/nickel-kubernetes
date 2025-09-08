# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      beginRefreshAt | js2n.Nullable String | optional,
      certificateChain | js2n.Nullable String | optional,
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
      notAfter | js2n.Nullable String | optional,
      notBefore | js2n.Nullable String | optional
    }