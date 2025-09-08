# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      cachingMode | js2n.Nullable String | optional,
      diskName | js2n.Nullable String,
      diskURI | js2n.Nullable String,
      fsType | js2n.Nullable String | optional,
      kind | js2n.Nullable String | optional,
      readOnly | js2n.Nullable Bool | optional
    }