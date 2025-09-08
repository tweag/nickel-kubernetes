# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      policies
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                periodSeconds | std.number.Integer,
                type | String,
                value | std.number.Integer
              }
          ))
        | optional,
      selectPolicy | js2n.Nullable String | optional,
      stabilizationWindowSeconds | js2n.Nullable std.number.Integer | optional,
      tolerance
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
        | optional
    }