# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      audience | js2n.Nullable String,
      expirationSeconds | js2n.Nullable std.number.Integer | optional
    }