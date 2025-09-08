# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
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
      spec
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
                            deviceClassName | js2n.Nullable String | optional,
                            firstAvailable
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      allocationMode
                                        | js2n.Nullable String
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
                                                key
                                                  | js2n.Nullable String
                                                  | optional,
                                                operator
                                                  | js2n.Nullable String
                                                  | optional,
                                                tolerationSeconds
                                                  | js2n.Nullable
                                                    std.number.Integer
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
                      ))
                    | optional
                }
              | optional
          }
    }