# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      behavior
        | js2n.Nullable
          {
            scaleDown
              | js2n.Nullable
                {
                  policies
                    | js2n.Nullable
                      (Array (
                        js2n.Nullable
                          {
                            periodSeconds | std.number.Integer,
                            type | String,
                            value | std.number.Integer
                          }
                      ))
                    | optional,
                  selectPolicy | js2n.Nullable String | optional,
                  stabilizationWindowSeconds
                    | js2n.Nullable std.number.Integer
                    | optional,
                  tolerance
                    | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                    | optional
                }
              | optional,
            scaleUp
              | js2n.Nullable
                {
                  policies
                    | js2n.Nullable
                      (Array (
                        js2n.Nullable
                          {
                            periodSeconds | std.number.Integer,
                            type | String,
                            value | std.number.Integer
                          }
                      ))
                    | optional,
                  selectPolicy | js2n.Nullable String | optional,
                  stabilizationWindowSeconds
                    | js2n.Nullable std.number.Integer
                    | optional,
                  tolerance
                    | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                    | optional
                }
              | optional
          }
        | optional,
      maxReplicas | js2n.Nullable std.number.Integer,
      metrics
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                containerResource
                  | js2n.Nullable
                    {
                      container | String,
                      name | String,
                      target
                        | {
                          averageUtilization
                            | js2n.Nullable std.number.Integer
                            | optional,
                          averageValue
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional,
                          type | String,
                          value
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional
                        }
                    }
                  | optional,
                external
                  | js2n.Nullable
                    {
                      metric
                        | {
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
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional
                                        }
                                    ))
                                  | optional,
                                matchLabels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional
                              }
                            | optional
                        },
                      target
                        | {
                          averageUtilization
                            | js2n.Nullable std.number.Integer
                            | optional,
                          averageValue
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional,
                          type | String,
                          value
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional
                        }
                    }
                  | optional,
                object
                  | js2n.Nullable
                    {
                      describedObject
                        | {
                          apiVersion | js2n.Nullable String | optional,
                          kind | String,
                          name | String
                        },
                      metric
                        | {
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
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional
                                        }
                                    ))
                                  | optional,
                                matchLabels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional
                              }
                            | optional
                        },
                      target
                        | {
                          averageUtilization
                            | js2n.Nullable std.number.Integer
                            | optional,
                          averageValue
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional,
                          type | String,
                          value
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional
                        }
                    }
                  | optional,
                pods
                  | js2n.Nullable
                    {
                      metric
                        | {
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
                                            | js2n.Nullable
                                              (Array (js2n.Nullable String))
                                            | optional
                                        }
                                    ))
                                  | optional,
                                matchLabels
                                  | js2n.Nullable ({ _ | js2n.Nullable String })
                                  | optional
                              }
                            | optional
                        },
                      target
                        | {
                          averageUtilization
                            | js2n.Nullable std.number.Integer
                            | optional,
                          averageValue
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional,
                          type | String,
                          value
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional
                        }
                    }
                  | optional,
                resource
                  | js2n.Nullable
                    {
                      name | String,
                      target
                        | {
                          averageUtilization
                            | js2n.Nullable std.number.Integer
                            | optional,
                          averageValue
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional,
                          type | String,
                          value
                            | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                            | optional
                        }
                    }
                  | optional,
                type | String
              }
          ))
        | optional,
      minReplicas | js2n.Nullable std.number.Integer | optional,
      scaleTargetRef
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            kind | String,
            name | String
          }
    }