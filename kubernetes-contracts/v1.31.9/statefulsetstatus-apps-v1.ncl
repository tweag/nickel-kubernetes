# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      availableReplicas | js2n.Nullable std.number.Integer | optional,
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
      currentReplicas | js2n.Nullable std.number.Integer | optional,
      currentRevision | js2n.Nullable String | optional,
      observedGeneration | js2n.Nullable std.number.Integer | optional,
      readyReplicas | js2n.Nullable std.number.Integer | optional,
      replicas | js2n.Nullable std.number.Integer,
      updateRevision | js2n.Nullable String | optional,
      updatedReplicas | js2n.Nullable std.number.Integer | optional
    }