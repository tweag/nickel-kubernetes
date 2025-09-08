# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      directory | js2n.Nullable String | optional,
      repository | js2n.Nullable String,
      revision | js2n.Nullable String | optional
    }