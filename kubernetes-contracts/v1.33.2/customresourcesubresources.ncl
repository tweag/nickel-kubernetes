# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      scale
        | js2n.Nullable
          {
            labelSelectorPath | js2n.Nullable String | optional,
            specReplicasPath | String,
            statusReplicasPath | String
          }
        | optional,
      status | js2n.Nullable ({ _ | Dyn }) | optional
    }