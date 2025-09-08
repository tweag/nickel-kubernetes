# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      max
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
        | optional,
      min | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ],
      step
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
        | optional
    }