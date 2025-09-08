# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      linux
        | js2n.Nullable
          {
            gid | std.number.Integer,
            supplementalGroups
              | js2n.Nullable (Array (js2n.Nullable std.number.Integer))
              | optional,
            uid | std.number.Integer
          }
        | optional
    }