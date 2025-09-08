# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      config
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                opaque
                  | js2n.Nullable { driver | String, parameters | { _ | Dyn } }
                  | optional
              }
          ))
        | optional,
      selectors
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { cel | js2n.Nullable { expression | String } | optional }
          ))
        | optional
    }