# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      adminAccess | js2n.Nullable Bool | optional,
      bindingConditions
        | js2n.Nullable (Array (js2n.Nullable String))
        | optional,
      bindingFailureConditions
        | js2n.Nullable (Array (js2n.Nullable String))
        | optional,
      consumedCapacity
        | js2n.Nullable
          ({ _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ] })
        | optional,
      device | js2n.Nullable String,
      driver | js2n.Nullable String,
      pool | js2n.Nullable String,
      request | js2n.Nullable String,
      shareID | js2n.Nullable String | optional,
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