# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      errorCode | js2n.Nullable std.number.Integer | optional,
      message | js2n.Nullable String | optional,
      time | js2n.Nullable String | optional
    }