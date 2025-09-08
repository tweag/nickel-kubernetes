# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      configMapRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional,
      prefix | js2n.Nullable String | optional,
      secretRef
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional
    }