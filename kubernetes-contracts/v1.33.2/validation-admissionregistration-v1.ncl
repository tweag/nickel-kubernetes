# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      expression | js2n.Nullable String,
      message | js2n.Nullable String | optional,
      messageExpression | js2n.Nullable String | optional,
      reason | js2n.Nullable String | optional
    }