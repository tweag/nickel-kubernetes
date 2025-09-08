# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      acquireTime | js2n.Nullable String | optional,
      holderIdentity | js2n.Nullable String | optional,
      leaseDurationSeconds | js2n.Nullable std.number.Integer | optional,
      leaseTransitions | js2n.Nullable std.number.Integer | optional,
      preferredHolder | js2n.Nullable String | optional,
      renewTime | js2n.Nullable String | optional,
      strategy | js2n.Nullable String | optional
    }