# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      hostnames | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      ip | js2n.Nullable String
    }