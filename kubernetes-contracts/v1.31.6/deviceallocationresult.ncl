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
                  | optional,
                requests
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                source | String
              }
          ))
        | optional,
      results
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                device | String,
                driver | String,
                pool | String,
                request | String
              }
          ))
        | optional
    }