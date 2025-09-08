# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      audiences | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      token | js2n.Nullable String | optional
    }