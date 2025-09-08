# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      description | js2n.Nullable String | optional,
      format | js2n.Nullable String | optional,
      jsonPath | js2n.Nullable String,
      name | js2n.Nullable String,
      "priority" | js2n.Nullable std.number.Integer | optional,
      type | js2n.Nullable String
    }