# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      fsType | js2n.Nullable String | optional,
      partition | js2n.Nullable std.number.Integer | optional,
      pdName | js2n.Nullable String,
      readOnly | js2n.Nullable Bool | optional
    }