# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      active
        | js2n.Nullable
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
        | optional,
      assigned
        | js2n.Nullable
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
        | optional,
      error | js2n.Nullable String | optional,
      lastKnownGood
        | js2n.Nullable
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
        | optional
    }