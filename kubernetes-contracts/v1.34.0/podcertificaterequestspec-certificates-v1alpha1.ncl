# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      maxExpirationSeconds | js2n.Nullable std.number.Integer | optional,
      nodeName | js2n.Nullable String,
      nodeUID | js2n.Nullable String,
      pkixPublicKey | js2n.Nullable String,
      podName | js2n.Nullable String,
      podUID | js2n.Nullable String,
      proofOfPossession | js2n.Nullable String,
      serviceAccountName | js2n.Nullable String,
      serviceAccountUID | js2n.Nullable String,
      signerName | js2n.Nullable String
    }