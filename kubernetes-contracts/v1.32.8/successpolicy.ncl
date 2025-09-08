# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      rules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                succeededCount | js2n.Nullable std.number.Integer | optional,
                succeededIndexes | js2n.Nullable String | optional
              }
          ))
    }