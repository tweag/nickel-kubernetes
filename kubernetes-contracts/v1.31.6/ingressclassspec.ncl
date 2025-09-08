# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      controller | js2n.Nullable String | optional,
      parameters
        | js2n.Nullable
          {
            apiGroup | js2n.Nullable String | optional,
            kind | String,
            name | String,
            namespace | js2n.Nullable String | optional,
            scope | js2n.Nullable String | optional
          }
        | optional
    }