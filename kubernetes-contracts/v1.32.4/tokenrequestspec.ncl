# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      audiences | js2n.Nullable (Array (js2n.Nullable String)),
      boundObjectRef
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            kind | js2n.Nullable String | optional,
            name | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional,
      expirationSeconds | js2n.Nullable std.number.Integer | optional
    }