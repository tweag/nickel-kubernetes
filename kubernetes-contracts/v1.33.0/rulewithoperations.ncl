# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiGroups | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      apiVersions | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      operations | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      resources | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      scope | js2n.Nullable String | optional
    }