# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      driver | js2n.Nullable String,
      fsType | js2n.Nullable String | optional,
      options | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
      readOnly | js2n.Nullable Bool | optional,
      secretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional
          }
        | optional
    }