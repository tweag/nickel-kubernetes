# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      gid | js2n.Nullable std.number.Integer,
      supplementalGroups
        | js2n.Nullable (Array (js2n.Nullable std.number.Integer))
        | optional,
      uid | js2n.Nullable std.number.Integer
    }