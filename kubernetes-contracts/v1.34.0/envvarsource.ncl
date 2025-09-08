# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      configMapKeyRef
        | js2n.Nullable
          {
            key | String,
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional,
      fieldRef
        | js2n.Nullable
          { apiVersion | js2n.Nullable String | optional, fieldPath | String }
        | optional,
      fileKeyRef
        | js2n.Nullable
          {
            key | String,
            "optional" | js2n.Nullable Bool | optional,
            path | String,
            volumeName | String
          }
        | optional,
      resourceFieldRef
        | js2n.Nullable
          {
            containerName | js2n.Nullable String | optional,
            divisor
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional,
            resource | String
          }
        | optional,
      secretKeyRef
        | js2n.Nullable
          {
            key | String,
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional
    }