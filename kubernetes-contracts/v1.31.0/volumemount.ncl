# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      mountPath | js2n.Nullable String,
      mountPropagation | js2n.Nullable String | optional,
      name | js2n.Nullable String,
      readOnly | js2n.Nullable Bool | optional,
      recursiveReadOnly | js2n.Nullable String | optional,
      subPath | js2n.Nullable String | optional,
      subPathExpr | js2n.Nullable String | optional
    }