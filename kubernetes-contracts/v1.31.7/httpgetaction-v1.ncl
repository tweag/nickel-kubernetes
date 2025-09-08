# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      host | js2n.Nullable String | optional,
      httpHeaders
        | js2n.Nullable
          (Array (js2n.Nullable { name | String, value | String }))
        | optional,
      path | js2n.Nullable String | optional,
      port
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable std.number.Integer ],
      scheme | js2n.Nullable String | optional
    }