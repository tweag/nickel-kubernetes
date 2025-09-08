# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      active | js2n.Nullable std.number.Integer | optional,
      completedIndexes | js2n.Nullable String | optional,
      completionTime | js2n.Nullable String | optional,
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
      failed | js2n.Nullable std.number.Integer | optional,
      failedIndexes | js2n.Nullable String | optional,
      ready | js2n.Nullable std.number.Integer | optional,
      startTime | js2n.Nullable String | optional,
      succeeded | js2n.Nullable std.number.Integer | optional,
      terminating | js2n.Nullable std.number.Integer | optional,
      uncountedTerminatedPods
        | js2n.Nullable
          {
            failed | js2n.Nullable (Array (js2n.Nullable String)) | optional,
            succeeded | js2n.Nullable (Array (js2n.Nullable String)) | optional
          }
        | optional
    }