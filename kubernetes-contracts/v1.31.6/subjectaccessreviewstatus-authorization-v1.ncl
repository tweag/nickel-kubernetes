# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      allowed | js2n.Nullable Bool,
      denied | js2n.Nullable Bool | optional,
      evaluationError | js2n.Nullable String | optional,
      reason | js2n.Nullable String | optional
    }