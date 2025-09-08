# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      labelSelector
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
      name | js2n.Nullable String | optional,
      "optional" | js2n.Nullable Bool | optional,
      path | js2n.Nullable String,
      signerName | js2n.Nullable String | optional
    }