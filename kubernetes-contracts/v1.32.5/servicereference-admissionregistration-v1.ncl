# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      name | js2n.Nullable String,
      namespace | js2n.Nullable String,
      path | js2n.Nullable String | optional,
      port | js2n.Nullable std.number.Integer | optional
    }