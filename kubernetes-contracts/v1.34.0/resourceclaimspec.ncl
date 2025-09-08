# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
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
                        | optional
                    }
                ))
              | optional,
            constraints
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      distinctAttribute | js2n.Nullable String | optional,
                      matchAttribute | js2n.Nullable String | optional,
                      requests
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional
                    }
                ))
              | optional,
            requests
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      exactly
                        | js2n.Nullable
                          {
                            adminAccess | js2n.Nullable Bool | optional,
                            allocationMode | js2n.Nullable String | optional,
                            capacity
                              | js2n.Nullable
                                {
                                  requests
                                    | js2n.Nullable
                                      ({
                                        _ | js2n.OneOf
                                          [
                                            js2n.Nullable String,
                                            js2n.Nullable Number
                                          ]
                                      })
                                    | optional
                                }
                              | optional,
                            count | js2n.Nullable std.number.Integer | optional,
                            deviceClassName | String,
                            selectors
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      cel
                                        | js2n.Nullable { expression | String }
                                        | optional
                                    }
                                ))
                              | optional,
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
                        | optional,
                      firstAvailable
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                allocationMode
                                  | js2n.Nullable String
                                  | optional,
                                capacity
                                  | js2n.Nullable
                                    {
                                      requests
                                        | js2n.Nullable
                                          ({
                                            _ | js2n.OneOf
                                              [
                                                js2n.Nullable String,
                                                js2n.Nullable Number
                                              ]
                                          })
                                        | optional
                                    }
                                  | optional,
                                count
                                  | js2n.Nullable std.number.Integer
                                  | optional,
                                deviceClassName | String,
                                name | String,
                                selectors
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          cel
                                            | js2n.Nullable
                                              { expression | String }
                                            | optional
                                        }
                                    ))
                                  | optional,
                                tolerations
                                  | js2n.Nullable
                                    (Array (
                                      js2n.Nullable
                                        {
                                          effect
                                            | js2n.Nullable String
                                            | optional,
                                          key | js2n.Nullable String | optional,
                                          operator
                                            | js2n.Nullable String
                                            | optional,
                                          tolerationSeconds
                                            | js2n.Nullable std.number.Integer
                                            | optional,
                                          value
                                            | js2n.Nullable String
                                            | optional
                                        }
                                    ))
                                  | optional
                              }
                          ))
                        | optional,
                      name | String
                    }
                ))
              | optional
          }
        | optional
    }