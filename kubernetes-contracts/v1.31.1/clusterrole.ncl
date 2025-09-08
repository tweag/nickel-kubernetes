# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      aggregationRule
        | js2n.Nullable
          {
            clusterRoleSelectors
              | js2n.Nullable
                (Array (
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
                      matchLabels
                        | js2n.Nullable ({ _ | js2n.Nullable String })
                        | optional
                    }
                ))
              | optional
          }
        | optional,
      apiVersion | js2n.Nullable String | optional,
      kind | std.enum.TagOrString | [| 'ClusterRole |] | optional,
      metadata
        | js2n.Nullable
          {
            annotations
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional,
            creationTimestamp | js2n.Nullable String | optional,
            deletionGracePeriodSeconds
              | js2n.Nullable std.number.Integer
              | optional,
            deletionTimestamp | js2n.Nullable String | optional,
            finalizers
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            generateName | js2n.Nullable String | optional,
            generation | js2n.Nullable std.number.Integer | optional,
            labels | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
            managedFields
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldsType | js2n.Nullable String | optional,
                      fieldsV1 | js2n.Nullable ({ _ | Dyn }) | optional,
                      manager | js2n.Nullable String | optional,
                      operation | js2n.Nullable String | optional,
                      subresource | js2n.Nullable String | optional,
                      time | js2n.Nullable String | optional
                    }
                ))
              | optional,
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            ownerReferences
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      apiVersion | String,
                      blockOwnerDeletion | js2n.Nullable Bool | optional,
                      controller | js2n.Nullable Bool | optional,
                      kind | String,
                      name | String,
                      uid | String
                    }
                ))
              | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional,
      rules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiGroups
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                nonResourceURLs
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                resourceNames
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                resources
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                verbs | Array (js2n.Nullable String)
              }
          ))
        | optional
    }