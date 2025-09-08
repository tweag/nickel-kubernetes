# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      fsType | js2n.Nullable String | optional,
      gateway | js2n.Nullable String,
      protectionDomain | js2n.Nullable String | optional,
      readOnly | js2n.Nullable Bool | optional,
      secretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          },
      sslEnabled | js2n.Nullable Bool | optional,
      storageMode | js2n.Nullable String | optional,
      storagePool | js2n.Nullable String | optional,
      system | js2n.Nullable String,
      volumeName | js2n.Nullable String | optional
    }