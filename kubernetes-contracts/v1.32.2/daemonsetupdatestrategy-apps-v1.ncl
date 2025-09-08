# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      rollingUpdate
        | js2n.Nullable
          {
            maxSurge
              | js2n.OneOf
                [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
              | optional,
            maxUnavailable
              | js2n.OneOf
                [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
              | optional
          }
        | optional,
      type | js2n.Nullable String | optional
    }