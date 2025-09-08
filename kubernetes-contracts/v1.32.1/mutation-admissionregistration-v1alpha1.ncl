# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      applyConfiguration
        | js2n.Nullable { expression | js2n.Nullable String | optional }
        | optional,
      jsonPatch
        | js2n.Nullable { expression | js2n.Nullable String | optional }
        | optional,
      patchType | js2n.Nullable String
    }