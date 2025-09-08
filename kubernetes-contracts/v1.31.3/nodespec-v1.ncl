# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      configSource
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
      externalID | js2n.Nullable String | optional,
      podCIDR | js2n.Nullable String | optional,
      podCIDRs | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      providerID | js2n.Nullable String | optional,
      taints
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                effect | String,
                key | String,
                timeAdded | js2n.Nullable String | optional,
                value | js2n.Nullable String | optional
              }
          ))
        | optional,
      unschedulable | js2n.Nullable Bool | optional
    }