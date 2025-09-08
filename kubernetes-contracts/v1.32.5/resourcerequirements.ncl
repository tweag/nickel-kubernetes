# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      claims
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { name | String, request | js2n.Nullable String | optional }
          ))
        | optional,
      limits
        | js2n.Nullable
          ({ _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ] })
        | optional,
      requests
        | js2n.Nullable
          ({ _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ] })
        | optional
    }