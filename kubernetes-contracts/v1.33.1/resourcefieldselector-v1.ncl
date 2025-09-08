# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      containerName | js2n.Nullable String | optional,
      divisor
        | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
        | optional,
      resource | js2n.Nullable String
    }