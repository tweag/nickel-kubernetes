# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      controller | js2n.Nullable String | optional,
      devices
        | js2n.Nullable
          {
            config
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      opaque
                        | js2n.Nullable
                          { driver | String, parameters | { _ | Dyn } }
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
        | optional,
      nodeSelector
        | js2n.Nullable
          {
            nodeSelectorTerms
              | Array (
                js2n.Nullable
                  {
                    matchExpressions
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              key | String,
                              operator | String,
                              values
                                | js2n.Nullable (Array (js2n.Nullable String))
                                | optional
                            }
                        ))
                      | optional,
                    matchFields
                      | js2n.Nullable
                        (Array (
                          js2n.Nullable
                            {
                              key | String,
                              operator | String,
                              values
                                | js2n.Nullable (Array (js2n.Nullable String))
                                | optional
                            }
                        ))
                      | optional
                  }
              )
          }
        | optional
    }