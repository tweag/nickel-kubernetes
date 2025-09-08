# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      adminAccess | js2n.Nullable Bool | optional,
      allocationMode | js2n.Nullable String | optional,
      count | js2n.Nullable std.number.Integer | optional,
      deviceClassName | js2n.Nullable String,
      name | js2n.Nullable String,
      selectors
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { cel | js2n.Nullable { expression | String } | optional }
          ))
        | optional
    }