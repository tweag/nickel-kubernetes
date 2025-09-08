# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      containerResource
        | js2n.Nullable
          {
            container | String,
            current
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
              },
            name | String
          }
        | optional,
      external
        | js2n.Nullable
          {
            current
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
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
        | optional,
      object
        | js2n.Nullable
          {
            current
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
              },
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
        | optional,
      pods
        | js2n.Nullable
          {
            current
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
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
        | optional,
      resource
        | js2n.Nullable
          {
            current
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
              },
            name | String
          }
        | optional,
      type | js2n.Nullable String
    }