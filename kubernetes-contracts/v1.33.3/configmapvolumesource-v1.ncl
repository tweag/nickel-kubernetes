# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      defaultMode | js2n.Nullable std.number.Integer | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                key | String,
                mode | js2n.Nullable std.number.Integer | optional,
                path | String
              }
          ))
        | optional,
      name | js2n.Nullable String | optional,
      "optional" | js2n.Nullable Bool | optional
    }