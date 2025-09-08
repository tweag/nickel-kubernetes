# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      nonResourceRules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                nonResourceURLs | Array (js2n.Nullable String),
                verbs | Array (js2n.Nullable String)
              }
          ))
        | optional,
      resourceRules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiGroups | Array (js2n.Nullable String),
                clusterScope | js2n.Nullable Bool | optional,
                namespaces
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                resources | Array (js2n.Nullable String),
                verbs | Array (js2n.Nullable String)
              }
          ))
        | optional,
      subjects
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                group | js2n.Nullable { name | String } | optional,
                kind | String,
                serviceAccount
                  | js2n.Nullable { name | String, namespace | String }
                  | optional,
                user | js2n.Nullable { name | String } | optional
              }
          ))
    }