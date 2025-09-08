# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      kubeletConfigKey | js2n.Nullable String,
      name | js2n.Nullable String,
      namespace | js2n.Nullable String,
      resourceVersion | js2n.Nullable String | optional,
      uid | js2n.Nullable String | optional
    }