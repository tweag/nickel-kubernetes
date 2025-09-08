# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      rawSelector | js2n.Nullable String | optional,
      requirements
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                key | String,
                operator | String,
                values | js2n.Nullable (Array (js2n.Nullable String)) | optional
              }
          ))
        | optional
    }