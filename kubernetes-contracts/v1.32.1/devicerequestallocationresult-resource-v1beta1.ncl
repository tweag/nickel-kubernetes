# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      adminAccess | js2n.Nullable Bool | optional,
      device | js2n.Nullable String,
      driver | js2n.Nullable String,
      pool | js2n.Nullable String,
      request | js2n.Nullable String
    }