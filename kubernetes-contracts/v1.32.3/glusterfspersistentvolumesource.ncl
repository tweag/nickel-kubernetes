# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      endpoints | js2n.Nullable String,
      endpointsNamespace | js2n.Nullable String | optional,
      path | js2n.Nullable String,
      readOnly | js2n.Nullable Bool | optional
    }