# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      attachRequired | js2n.Nullable Bool | optional,
      fsGroupPolicy | js2n.Nullable String | optional,
      nodeAllocatableUpdatePeriodSeconds
        | js2n.Nullable std.number.Integer
        | optional,
      podInfoOnMount | js2n.Nullable Bool | optional,
      requiresRepublish | js2n.Nullable Bool | optional,
      seLinuxMount | js2n.Nullable Bool | optional,
      storageCapacity | js2n.Nullable Bool | optional,
      tokenRequests
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                audience | String,
                expirationSeconds | js2n.Nullable std.number.Integer | optional
              }
          ))
        | optional,
      volumeLifecycleModes
        | js2n.Nullable (Array (js2n.Nullable String))
        | optional
    }