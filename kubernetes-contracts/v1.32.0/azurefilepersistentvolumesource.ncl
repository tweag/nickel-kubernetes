# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      readOnly | js2n.Nullable Bool | optional,
      secretName | js2n.Nullable String,
      secretNamespace | js2n.Nullable String | optional,
      shareName | js2n.Nullable String
    }