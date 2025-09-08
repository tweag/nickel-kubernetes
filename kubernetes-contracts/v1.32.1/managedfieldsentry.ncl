# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      fieldsType | js2n.Nullable String | optional,
      fieldsV1 | js2n.Nullable ({ _ | Dyn }) | optional,
      manager | js2n.Nullable String | optional,
      operation | js2n.Nullable String | optional,
      subresource | js2n.Nullable String | optional,
      time | js2n.Nullable String | optional
    }