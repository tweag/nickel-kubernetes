# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      counters
        | js2n.Nullable
          ({
            _ | js2n.Nullable
              {
                value
                  | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              }
          }),
      name | js2n.Nullable String
    }