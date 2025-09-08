# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      evaluationError | js2n.Nullable String | optional,
      incomplete | js2n.Nullable Bool,
      nonResourceRules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                nonResourceURLs
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                verbs | Array (js2n.Nullable String)
              }
          )),
      resourceRules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiGroups
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
    }