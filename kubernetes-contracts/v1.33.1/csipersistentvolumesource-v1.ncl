# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      controllerExpandSecretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      controllerPublishSecretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      driver | js2n.Nullable String,
      fsType | js2n.Nullable String | optional,
      nodeExpandSecretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      nodePublishSecretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      nodeStageSecretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional,
      readOnly | js2n.Nullable Bool | optional,
      volumeAttributes
        | js2n.Nullable ({ _ | js2n.Nullable String })
        | optional,
      volumeHandle | js2n.Nullable String
    }