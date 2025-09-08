# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      fsType | js2n.Nullable String | optional,
      readOnly | js2n.Nullable Bool | optional,
      secretRef
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            fieldPath | js2n.Nullable String | optional,
            kind | js2n.Nullable String | optional,
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            resourceVersion | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional,
      volumeName | js2n.Nullable String | optional,
      volumeNamespace | js2n.Nullable String | optional
    }