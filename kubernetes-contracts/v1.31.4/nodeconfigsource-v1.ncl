# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      configMap
        | js2n.Nullable
          {
            kubeletConfigKey | String,
            name | String,
            namespace | String,
            resourceVersion | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional
    }