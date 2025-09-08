# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      running
        | js2n.Nullable { startedAt | js2n.Nullable String | optional }
        | optional,
      terminated
        | js2n.Nullable
          {
            containerID | js2n.Nullable String | optional,
            exitCode | std.number.Integer,
            finishedAt | js2n.Nullable String | optional,
            message | js2n.Nullable String | optional,
            reason | js2n.Nullable String | optional,
            signal | js2n.Nullable std.number.Integer | optional,
            startedAt | js2n.Nullable String | optional
          }
        | optional,
      waiting
        | js2n.Nullable
          {
            message | js2n.Nullable String | optional,
            reason | js2n.Nullable String | optional
          }
        | optional
    }