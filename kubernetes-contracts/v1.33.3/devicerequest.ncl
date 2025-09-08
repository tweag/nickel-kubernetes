# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      exactly
        | js2n.Nullable
          {
            adminAccess | js2n.Nullable Bool | optional,
            allocationMode | js2n.Nullable String | optional,
            count | js2n.Nullable std.number.Integer | optional,
            deviceClassName | String,
            selectors
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    { cel | js2n.Nullable { expression | String } | optional }
                ))
              | optional,
            tolerations
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      effect | js2n.Nullable String | optional,
                      key | js2n.Nullable String | optional,
                      operator | js2n.Nullable String | optional,
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
                allocationMode | js2n.Nullable String | optional,
                count | js2n.Nullable std.number.Integer | optional,
                deviceClassName | String,
                name | String,
                selectors
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          cel | js2n.Nullable { expression | String } | optional
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
                          operator | js2n.Nullable String | optional,
                          tolerationSeconds
                            | js2n.Nullable std.number.Integer
                            | optional,
                          value | js2n.Nullable String | optional
                        }
                    ))
                  | optional
              }
          ))
        | optional,
      name | js2n.Nullable String
    }