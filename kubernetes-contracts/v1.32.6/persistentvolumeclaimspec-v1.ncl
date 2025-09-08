# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      accessModes | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      dataSource
        | js2n.Nullable
          {
            apiGroup | js2n.Nullable String | optional,
            kind | String,
            name | String
          }
        | optional,
      dataSourceRef
        | js2n.Nullable
          {
            apiGroup | js2n.Nullable String | optional,
            kind | String,
            name | String,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      resources
        | js2n.Nullable
          {
            limits
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional,
            requests
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional
          }
        | optional,
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
        | optional,
      storageClassName | js2n.Nullable String | optional,
      volumeAttributesClassName | js2n.Nullable String | optional,
      volumeMode | js2n.Nullable String | optional,
      volumeName | js2n.Nullable String | optional
    }