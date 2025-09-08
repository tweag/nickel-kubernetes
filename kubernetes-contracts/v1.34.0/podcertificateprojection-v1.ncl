# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      certificateChainPath | js2n.Nullable String | optional,
      credentialBundlePath | js2n.Nullable String | optional,
      keyPath | js2n.Nullable String | optional,
      keyType | js2n.Nullable String,
      maxExpirationSeconds | js2n.Nullable std.number.Integer | optional,
      signerName | js2n.Nullable String
    }