# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      features
        | js2n.Nullable
          {
            recursiveReadOnlyMounts | js2n.Nullable Bool | optional,
            userNamespaces | js2n.Nullable Bool | optional
          }
        | optional,
      name | js2n.Nullable String | optional
    }