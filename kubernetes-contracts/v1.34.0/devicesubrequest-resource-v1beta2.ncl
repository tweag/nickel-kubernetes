# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      allocationMode | js2n.Nullable String | optional,
      capacity
        | js2n.Nullable
          {
            requests
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional
          }
        | optional,
      count | js2n.Nullable std.number.Integer | optional,
      deviceClassName | js2n.Nullable String,
      name | js2n.Nullable String,
      selectors
        | js2n.Nullable
          (Array (
            js2n.Nullable
              { cel | js2n.Nullable { expression | String } | optional }
          ))
        | optional,
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