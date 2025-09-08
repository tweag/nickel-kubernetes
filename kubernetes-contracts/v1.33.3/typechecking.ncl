# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      expressionWarnings
        | js2n.Nullable
          (Array (js2n.Nullable { fieldRef | String, warning | String }))
        | optional
    }