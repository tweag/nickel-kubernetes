# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      "default"
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
        | optional,
      validRange
        | js2n.Nullable
          {
            max
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional,
            min | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ],
            step
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional
          }
        | optional,
      validValues
        | js2n.Nullable
          (Array (js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]))
        | optional
    }