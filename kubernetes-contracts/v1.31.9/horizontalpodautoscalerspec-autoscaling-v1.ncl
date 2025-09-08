# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      maxReplicas | js2n.Nullable std.number.Integer,
      minReplicas | js2n.Nullable std.number.Integer | optional,
      scaleTargetRef
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            kind | String,
            name | String
          },
      targetCPUUtilizationPercentage
        | js2n.Nullable std.number.Integer
        | optional
    }