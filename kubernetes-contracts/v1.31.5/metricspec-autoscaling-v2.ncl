# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
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
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                type | String,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
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
              },
            target
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                type | String,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
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
              },
            target
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                type | String,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
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
              },
            target
              | {
                averageUtilization
                  | js2n.Nullable std.number.Integer
                  | optional,
                averageValue
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                type | String,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
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
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional,
                type | String,
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                  | optional
              }
          }
        | optional,
      type | js2n.Nullable String
    }