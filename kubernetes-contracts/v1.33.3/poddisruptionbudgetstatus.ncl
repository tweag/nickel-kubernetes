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
      currentHealthy | js2n.Nullable std.number.Integer,
      desiredHealthy | js2n.Nullable std.number.Integer,
      disruptedPods | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
      disruptionsAllowed | js2n.Nullable std.number.Integer,
      expectedPods | js2n.Nullable std.number.Integer,
      observedGeneration | js2n.Nullable std.number.Integer | optional
    }