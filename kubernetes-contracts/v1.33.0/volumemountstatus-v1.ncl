# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      mountPath | js2n.Nullable String,
      name | js2n.Nullable String,
      readOnly | js2n.Nullable Bool | optional,
      recursiveReadOnly | js2n.Nullable String | optional
    }