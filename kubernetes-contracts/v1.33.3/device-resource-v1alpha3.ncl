# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      basic
        | js2n.Nullable
          {
            allNodes | js2n.Nullable Bool | optional,
            attributes
              | js2n.Nullable
                ({
                  _ | js2n.Nullable
                    {
                      bool | js2n.Nullable Bool | optional,
                      int | js2n.Nullable std.number.Integer | optional,
                      string | js2n.Nullable String | optional,
                      version | js2n.Nullable String | optional
                    }
                })
              | optional,
            capacity
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional,
            consumesCounters
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      counterSet | String,
                      counters
                        | {
                          _ | js2n.Nullable
                            {
                              value
                                | js2n.OneOf
                                  [ js2n.Nullable String, js2n.Nullable Number ]
                            }
                        }
                    }
                ))
              | optional,
            nodeName | js2n.Nullable String | optional,
            nodeSelector
              | js2n.Nullable
                {
                  nodeSelectorTerms
                    | Array (
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
                                      | js2n.Nullable
                                        (Array (js2n.Nullable String))
                                      | optional
                                  }
                              ))
                            | optional,
                          matchFields
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
                            | optional
                        }
                    )
                }
              | optional,
            taints
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      effect | String,
                      key | String,
                      timeAdded | js2n.Nullable String | optional,
                      value | js2n.Nullable String | optional
                    }
                ))
              | optional
          }
        | optional,
      name | js2n.Nullable String
    }