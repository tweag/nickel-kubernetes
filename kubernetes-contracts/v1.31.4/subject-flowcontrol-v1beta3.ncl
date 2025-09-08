# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      group | js2n.Nullable { name | String } | optional,
      kind | js2n.Nullable String,
      serviceAccount
        | js2n.Nullable { name | String, namespace | String }
        | optional,
      user | js2n.Nullable { name | String } | optional
    }