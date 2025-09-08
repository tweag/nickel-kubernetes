# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      parentRef
        | js2n.Nullable
          {
            group | js2n.Nullable String | optional,
            name | String,
            namespace | js2n.Nullable String | optional,
            resource | String
          }
    }