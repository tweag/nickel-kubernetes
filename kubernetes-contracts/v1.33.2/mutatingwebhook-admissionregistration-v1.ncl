# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      admissionReviewVersions | js2n.Nullable (Array (js2n.Nullable String)),
      clientConfig
        | js2n.Nullable
          {
            caBundle | js2n.Nullable String | optional,
            service
              | js2n.Nullable
                {
                  name | String,
                  namespace | String,
                  path | js2n.Nullable String | optional,
                  port | js2n.Nullable std.number.Integer | optional
                }
              | optional,
            url | js2n.Nullable String | optional
          },
      failurePolicy | js2n.Nullable String | optional,
      matchConditions
        | js2n.Nullable
          (Array (js2n.Nullable { expression | String, name | String }))
        | optional,
      matchPolicy | js2n.Nullable String | optional,
      name | js2n.Nullable String,
      namespaceSelector
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
      objectSelector
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
      reinvocationPolicy | js2n.Nullable String | optional,
      rules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiGroups
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                apiVersions
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                operations
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                resources
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                scope | js2n.Nullable String | optional
              }
          ))
        | optional,
      sideEffects | js2n.Nullable String,
      timeoutSeconds | js2n.Nullable std.number.Integer | optional
    }