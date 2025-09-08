# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      nodeAffinity
        | js2n.Nullable
          {
            preferredDuringSchedulingIgnoredDuringExecution
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      preference
                        | {
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
                        },
                      weight | std.number.Integer
                    }
                ))
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
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
              | optional
          }
        | optional,
      podAffinity
        | js2n.Nullable
          {
            preferredDuringSchedulingIgnoredDuringExecution
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      podAffinityTerm
                        | {
                          labelSelector
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
                            | optional,
                          matchLabelKeys
                            | js2n.Nullable (Array (js2n.Nullable String))
                            | optional,
                          mismatchLabelKeys
                            | js2n.Nullable (Array (js2n.Nullable String))
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
                            | optional,
                          namespaces
                            | js2n.Nullable (Array (js2n.Nullable String))
                            | optional,
                          topologyKey | String
                        },
                      weight | std.number.Integer
                    }
                ))
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      labelSelector
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
                        | optional,
                      matchLabelKeys
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      mismatchLabelKeys
                        | js2n.Nullable (Array (js2n.Nullable String))
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
                        | optional,
                      namespaces
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      topologyKey | String
                    }
                ))
              | optional
          }
        | optional,
      podAntiAffinity
        | js2n.Nullable
          {
            preferredDuringSchedulingIgnoredDuringExecution
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      podAffinityTerm
                        | {
                          labelSelector
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
                            | optional,
                          matchLabelKeys
                            | js2n.Nullable (Array (js2n.Nullable String))
                            | optional,
                          mismatchLabelKeys
                            | js2n.Nullable (Array (js2n.Nullable String))
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
                            | optional,
                          namespaces
                            | js2n.Nullable (Array (js2n.Nullable String))
                            | optional,
                          topologyKey | String
                        },
                      weight | std.number.Integer
                    }
                ))
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      labelSelector
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
                        | optional,
                      matchLabelKeys
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      mismatchLabelKeys
                        | js2n.Nullable (Array (js2n.Nullable String))
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
                        | optional,
                      namespaces
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      topologyKey | String
                    }
                ))
              | optional
          }
        | optional
    }