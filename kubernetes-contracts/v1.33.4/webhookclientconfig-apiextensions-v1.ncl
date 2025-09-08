# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      caBundle | js2n.Nullable String | optional,
      service
        | js2n.Nullable
          {
            name | String,
            namespace | String,
            path | js2n.Nullable String | optional,
            port | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      url | js2n.Nullable String | optional
    }