# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      dryRun | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      gracePeriodSeconds | js2n.Nullable std.number.Integer | optional,
      ignoreStoreReadErrorWithClusterBreakingPotential
        | js2n.Nullable Bool
        | optional,
      kind | std.enum.TagOrString | [| 'DeleteOptions |] | optional,
      orphanDependents | js2n.Nullable Bool | optional,
      preconditions
        | js2n.Nullable
          {
            resourceVersion | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional,
      propagationPolicy | js2n.Nullable String | optional
    }