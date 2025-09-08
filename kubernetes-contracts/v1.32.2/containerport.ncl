# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      containerPort | js2n.Nullable std.number.Integer,
      hostIP | js2n.Nullable String | optional,
      hostPort | js2n.Nullable std.number.Integer | optional,
      name | js2n.Nullable String | optional,
      protocol | js2n.Nullable String | optional
    }