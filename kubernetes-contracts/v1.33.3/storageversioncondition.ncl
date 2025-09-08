# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      lastTransitionTime | js2n.Nullable String | optional,
      message | js2n.Nullable String,
      observedGeneration | js2n.Nullable std.number.Integer | optional,
      reason | js2n.Nullable String,
      status | js2n.Nullable String,
      type | js2n.Nullable String
    }