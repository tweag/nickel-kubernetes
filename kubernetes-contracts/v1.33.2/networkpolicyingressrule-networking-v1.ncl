# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      from
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                ipBlock
                  | js2n.Nullable
                    {
                      cidr | String,
                      except
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional
                    }
                  | optional,
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
                podSelector
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
          ))
        | optional,
      ports
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                endPort | js2n.Nullable std.number.Integer | optional,
                port
                  | js2n.OneOf
                    [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
                  | optional,
                protocol | js2n.Nullable String | optional
              }
          ))
        | optional
    }