# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      allocation
        | js2n.Nullable
          {
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
                            adminAccess | js2n.Nullable Bool | optional,
                            device | String,
                            driver | String,
                            pool | String,
                            request | String,
                            tolerations
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      effect | js2n.Nullable String | optional,
                                      key | js2n.Nullable String | optional,
                                      operator
                                        | js2n.Nullable String
                                        | optional,
                                      tolerationSeconds
                                        | js2n.Nullable std.number.Integer
                                        | optional,
                                      value | js2n.Nullable String | optional
                                    }
                                ))
                              | optional
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
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
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
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional
                                  }
                              ))
                            | optional
                        }
                    )
                }
              | optional
          }
        | optional,
      devices
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                conditions
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          lastTransitionTime | String,
                          message | String,
                          observedGeneration
                            | js2n.Nullable std.number.Integer
                            | optional,
                          reason | String,
                          status | String,
                          type | String
                        }
                    ))
                  | optional,
                data | js2n.Nullable ({ _ | Dyn }) | optional,
                device | String,
                driver | String,
                networkData
                  | js2n.Nullable
                    {
                      hardwareAddress | js2n.Nullable String | optional,
                      interfaceName | js2n.Nullable String | optional,
                      ips
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional
                    }
                  | optional,
                pool | String
              }
          ))
        | optional,
      reservedFor
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiGroup | js2n.Nullable String | optional,
                name | String,
                resource | String,
                uid | String
              }
          ))
        | optional
    }