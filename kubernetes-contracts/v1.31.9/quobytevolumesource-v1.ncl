# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      group | js2n.Nullable String | optional,
      readOnly | js2n.Nullable Bool | optional,
      registry | js2n.Nullable String,
      tenant | js2n.Nullable String | optional,
      user | js2n.Nullable String | optional,
      volume | js2n.Nullable String
    }