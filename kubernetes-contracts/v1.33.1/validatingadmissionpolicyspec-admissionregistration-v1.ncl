# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      auditAnnotations
        | js2n.Nullable
          (Array (js2n.Nullable { key | String, valueExpression | String }))
        | optional,
      failurePolicy | js2n.Nullable String | optional,
      matchConditions
        | js2n.Nullable
          (Array (js2n.Nullable { expression | String, name | String }))
        | optional,
      matchConstraints
        | js2n.Nullable
          {
            excludeResourceRules
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
                      resourceNames
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      resources
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      scope | js2n.Nullable String | optional
                    }
                ))
              | optional,
            matchPolicy | js2n.Nullable String | optional,
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
            resourceRules
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
                      resourceNames
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      resources
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      scope | js2n.Nullable String | optional
                    }
                ))
              | optional
          }
        | optional,
      paramKind
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            kind | js2n.Nullable String | optional
          }
        | optional,
      validations
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                expression | String,
                message | js2n.Nullable String | optional,
                messageExpression | js2n.Nullable String | optional,
                reason | js2n.Nullable String | optional
              }
          ))
        | optional,
      variables
        | js2n.Nullable
          (Array (js2n.Nullable { expression | String, name | String }))
        | optional
    }