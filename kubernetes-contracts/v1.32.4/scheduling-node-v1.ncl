# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      nodeSelector | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
      tolerations
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                effect | js2n.Nullable String | optional,
                key | js2n.Nullable String | optional,
                operator | js2n.Nullable String | optional,
                tolerationSeconds | js2n.Nullable std.number.Integer | optional,
                value | js2n.Nullable String | optional
              }
          ))
        | optional
    }