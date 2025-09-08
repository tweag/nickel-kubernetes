# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      forNodes
        | js2n.Nullable (Array (js2n.Nullable { name | String }))
        | optional,
      forZones
        | js2n.Nullable (Array (js2n.Nullable { name | String }))
        | optional
    }