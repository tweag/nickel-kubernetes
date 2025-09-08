# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      currentCPUUtilizationPercentage
        | js2n.Nullable std.number.Integer
        | optional,
      currentReplicas | js2n.Nullable std.number.Integer,
      desiredReplicas | js2n.Nullable std.number.Integer,
      lastScaleTime | js2n.Nullable String | optional,
      observedGeneration | js2n.Nullable std.number.Integer | optional
    }