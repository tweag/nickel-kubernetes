# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      acceptedNames
        | js2n.Nullable
          {
            categories
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            kind | String,
            listKind | js2n.Nullable String | optional,
            plural | String,
            shortNames
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            singular | js2n.Nullable String | optional
          }
        | optional,
      conditions
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                lastTransitionTime | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                reason | js2n.Nullable String | optional,
                status | String,
                type | String
              }
          ))
        | optional,
      storedVersions | js2n.Nullable (Array (js2n.Nullable String)) | optional
    }