# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      hostname | js2n.Nullable String | optional,
      ip | js2n.Nullable String,
      nodeName | js2n.Nullable String | optional,
      targetRef
        | js2n.Nullable
          {
            apiVersion | js2n.Nullable String | optional,
            fieldPath | js2n.Nullable String | optional,
            kind | js2n.Nullable String | optional,
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            resourceVersion | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional
    }