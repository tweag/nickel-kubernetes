# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      requestMappings
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                containerName | String,
                requestName | String,
                resourceName | String
              }
          )),
      resourceClaimName | js2n.Nullable String
    }