# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion | js2n.Nullable String | optional,
                kind | std.enum.TagOrString | [| 'Ingress |] | optional,
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
                      labels
                        | js2n.Nullable ({ _ | js2n.Nullable String })
                        | optional,
                      managedFields
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                apiVersion | js2n.Nullable String | optional,
                                fieldsType | js2n.Nullable String | optional,
                                fieldsV1
                                  | js2n.Nullable ({ _ | Dyn })
                                  | optional,
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
                                blockOwnerDeletion
                                  | js2n.Nullable Bool
                                  | optional,
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
                      defaultBackend
                        | js2n.Nullable
                          {
                            resource
                              | js2n.Nullable
                                {
                                  apiGroup | js2n.Nullable String | optional,
                                  kind | String,
                                  name | String
                                }
                              | optional,
                            service
                              | js2n.Nullable
                                {
                                  name | String,
                                  port
                                    | js2n.Nullable
                                      {
                                        name | js2n.Nullable String | optional,
                                        number
                                          | js2n.Nullable std.number.Integer
                                          | optional
                                      }
                                    | optional
                                }
                              | optional
                          }
                        | optional,
                      ingressClassName | js2n.Nullable String | optional,
                      rules
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                host | js2n.Nullable String | optional,
                                http
                                  | js2n.Nullable
                                    {
                                      paths
                                        | Array (
                                          js2n.Nullable
                                            {
                                              backend
                                                | {
                                                  resource
                                                    | js2n.Nullable
                                                      {
                                                        apiGroup
                                                          | js2n.Nullable String
                                                          | optional,
                                                        kind | String,
                                                        name | String
                                                      }
                                                    | optional,
                                                  service
                                                    | js2n.Nullable
                                                      {
                                                        name | String,
                                                        port
                                                          | js2n.Nullable
                                                            {
                                                              name
                                                                | js2n.Nullable
                                                                  String
                                                                | optional,
                                                              number
                                                                | js2n.Nullable
                                                                  std.number.Integer
                                                                | optional
                                                            }
                                                          | optional
                                                      }
                                                    | optional
                                                },
                                              path
                                                | js2n.Nullable String
                                                | optional,
                                              pathType | String
                                            }
                                        )
                                    }
                                  | optional
                              }
                          ))
                        | optional,
                      tls
                        | js2n.Nullable
                          (Array (
                            js2n.Nullable
                              {
                                hosts
                                  | js2n.Nullable (Array (js2n.Nullable String))
                                  | optional,
                                secretName | js2n.Nullable String | optional
                              }
                          ))
                        | optional
                    }
                  | optional,
                status
                  | js2n.Nullable
                    {
                      loadBalancer
                        | js2n.Nullable
                          {
                            ingress
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      hostname
                                        | js2n.Nullable String
                                        | optional,
                                      ip | js2n.Nullable String | optional,
                                      ports
                                        | js2n.Nullable
                                          (Array (
                                            js2n.Nullable
                                              {
                                                error
                                                  | js2n.Nullable String
                                                  | optional,
                                                port | std.number.Integer,
                                                protocol | String
                                              }
                                          ))
                                        | optional
                                    }
                                ))
                              | optional
                          }
                        | optional
                    }
                  | optional
              }
          )),
      kind | std.enum.TagOrString | [| 'IngressList |] | optional,
      metadata
        | js2n.Nullable
          {
            continue | js2n.Nullable String | optional,
            remainingItemCount | js2n.Nullable std.number.Integer | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional
          }
        | optional
    }