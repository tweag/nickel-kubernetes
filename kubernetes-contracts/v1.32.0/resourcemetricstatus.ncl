# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      current
        | js2n.Nullable
          {
            averageUtilization | js2n.Nullable std.number.Integer | optional,
            averageValue
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional,
            value
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional
          },
      name | js2n.Nullable String
    }