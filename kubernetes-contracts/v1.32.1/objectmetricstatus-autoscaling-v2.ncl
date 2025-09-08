# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      current
        | js2n.Nullable
          {
            averageUtilization | js2n.Nullable std.number.Integer | optional,
            averageValue
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional,
            value
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional
          },
      describedObject
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            kind | String,
            name | String
          },
      metric
        | js2n.Nullable
          {
            name | String,
            selector
              | js2n.Nullable
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
                  matchLabels
                    | js2n.Nullable ({ _ | js2n.Nullable String })
                    | optional
                }
              | optional
          }
    }