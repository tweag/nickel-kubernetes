# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      expirationSeconds | js2n.Nullable std.number.Integer | optional,
      extra
        | js2n.Nullable ({ _ | js2n.Nullable (Array (js2n.Nullable String)) })
        | optional,
      groups | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      request | js2n.Nullable String,
      signerName | js2n.Nullable String,
      uid | js2n.Nullable String | optional,
      usages | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      username | js2n.Nullable String | optional
    }