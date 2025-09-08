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
                        | optional
                    }
                ))
              | optional,
            constraints
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
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
                      adminAccess | js2n.Nullable Bool | optional,
                      allocationMode | js2n.Nullable String | optional,
                      count | js2n.Nullable std.number.Integer | optional,
                      deviceClassName | String,
                      name | String,
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
                        | optional
                    }
                ))
              | optional
          }
        | optional
    }