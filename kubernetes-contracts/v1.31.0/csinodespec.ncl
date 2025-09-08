# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      drivers
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                allocatable
                  | js2n.Nullable
                    { count | js2n.Nullable std.number.Integer | optional }
                  | optional,
                name | String,
                nodeID | String,
                topologyKeys
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional
              }
          ))
    }