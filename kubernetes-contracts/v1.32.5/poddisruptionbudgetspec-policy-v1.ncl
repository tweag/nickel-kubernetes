# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      maxUnavailable
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
        | optional,
      minAvailable
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
        | optional,
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
        | optional,
      unhealthyPodEvictionPolicy | js2n.Nullable String | optional
    }