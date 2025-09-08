# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      device | js2n.Nullable String | optional,
      deviceClassName | js2n.Nullable String | optional,
      driver | js2n.Nullable String | optional,
      pool | js2n.Nullable String | optional,
      selectors
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { cel | js2n.Nullable { expression | String } | optional }
          ))
        | optional
    }