# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiGroup | js2n.Nullable String | optional,
      kind | js2n.Nullable String,
      name | js2n.Nullable String,
      namespace | js2n.Nullable String | optional,
      scope | js2n.Nullable String | optional
    }