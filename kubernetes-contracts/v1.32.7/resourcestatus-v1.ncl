# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      name | js2n.Nullable String,
      resources
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { health | js2n.Nullable String | optional, resourceID | String }
          ))
        | optional
    }