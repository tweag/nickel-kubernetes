# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      collisionCount | js2n.Nullable std.number.Integer | optional,
      conditions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                lastTransitionTime | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                reason | js2n.Nullable String | optional,
                status | String,
                type | String
              }
          ))
        | optional,
      currentNumberScheduled | js2n.Nullable std.number.Integer,
      desiredNumberScheduled | js2n.Nullable std.number.Integer,
      numberAvailable | js2n.Nullable std.number.Integer | optional,
      numberMisscheduled | js2n.Nullable std.number.Integer,
      numberReady | js2n.Nullable std.number.Integer,
      numberUnavailable | js2n.Nullable std.number.Integer | optional,
      observedGeneration | js2n.Nullable std.number.Integer | optional,
      updatedNumberScheduled | js2n.Nullable std.number.Integer | optional
    }