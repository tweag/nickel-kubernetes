# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      continueToken | js2n.Nullable String | optional,
      resource
        | js2n.Nullable
          {
            group | js2n.Nullable String | optional,
            resource | js2n.Nullable String | optional,
            version | js2n.Nullable String | optional
          }
    }