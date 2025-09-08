# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      categories | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      kind | js2n.Nullable String,
      listKind | js2n.Nullable String | optional,
      plural | js2n.Nullable String,
      shortNames | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      singular | js2n.Nullable String | optional
    }