# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      appProtocol | js2n.Nullable String | optional,
      name | js2n.Nullable String | optional,
      port | js2n.Nullable std.number.Integer,
      protocol | js2n.Nullable String | optional
    }