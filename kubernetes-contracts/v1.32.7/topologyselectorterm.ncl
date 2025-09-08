# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      matchLabelExpressions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { key | String, values | Array (js2n.Nullable String) }
          ))
        | optional
    }