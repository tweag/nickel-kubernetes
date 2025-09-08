# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      extra
        | js2n.Nullable ({ _ | js2n.Nullable (Array (js2n.Nullable String)) })
        | optional,
      groups | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      nonResourceAttributes
        | js2n.Nullable
          {
            path | js2n.Nullable String | optional,
            verb | js2n.Nullable String | optional
          }
        | optional,
      resourceAttributes
        | js2n.Nullable
          {
            fieldSelector
              | js2n.Nullable
                {
                  rawSelector | js2n.Nullable String | optional,
                  requirements
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
                    | optional
                }
              | optional,
            group | js2n.Nullable String | optional,
            labelSelector
              | js2n.Nullable
                {
                  rawSelector | js2n.Nullable String | optional,
                  requirements
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
                    | optional
                }
              | optional,
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            resource | js2n.Nullable String | optional,
            subresource | js2n.Nullable String | optional,
            verb | js2n.Nullable String | optional,
            version | js2n.Nullable String | optional
          }
        | optional,
      uid | js2n.Nullable String | optional,
      user | js2n.Nullable String | optional
    }