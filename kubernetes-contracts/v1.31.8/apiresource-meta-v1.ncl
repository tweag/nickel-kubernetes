# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      categories | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      group | js2n.Nullable String | optional,
      kind | js2n.Nullable String,
      name | js2n.Nullable String,
      namespaced | js2n.Nullable Bool,
      shortNames | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      singularName | js2n.Nullable String,
      storageVersionHash | js2n.Nullable String | optional,
      verbs | js2n.Nullable (Array (js2n.Nullable String)),
      version | js2n.Nullable String | optional
    }