# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      clusterTrustBundle
        | js2n.Nullable
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
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional,
            path | String,
            signerName | js2n.Nullable String | optional
          }
        | optional,
      configMap
        | js2n.Nullable
          {
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      key | String,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String
                    }
                ))
              | optional,
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional,
      downwardAPI
        | js2n.Nullable
          {
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      fieldRef
                        | js2n.Nullable
                          {
                            apiVersion | js2n.Nullable String | optional,
                            fieldPath | String
                          }
                        | optional,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String,
                      resourceFieldRef
                        | js2n.Nullable
                          {
                            containerName | js2n.Nullable String | optional,
                            divisor
                              | js2n.OneOf
                                [ js2n.Nullable String, js2n.Nullable Number ]
                              | optional,
                            resource | String
                          }
                        | optional
                    }
                ))
              | optional
          }
        | optional,
      podCertificate
        | js2n.Nullable
          {
            certificateChainPath | js2n.Nullable String | optional,
            credentialBundlePath | js2n.Nullable String | optional,
            keyPath | js2n.Nullable String | optional,
            keyType | String,
            maxExpirationSeconds | js2n.Nullable std.number.Integer | optional,
            signerName | String
          }
        | optional,
      secret
        | js2n.Nullable
          {
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      key | String,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String
                    }
                ))
              | optional,
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional,
      serviceAccountToken
        | js2n.Nullable
          {
            audience | js2n.Nullable String | optional,
            expirationSeconds | js2n.Nullable std.number.Integer | optional,
            path | String
          }
        | optional
    }