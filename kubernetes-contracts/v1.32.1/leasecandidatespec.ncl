# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      binaryVersion | js2n.Nullable String,
      emulationVersion | js2n.Nullable String | optional,
      leaseName | js2n.Nullable String,
      pingTime | js2n.Nullable String | optional,
      renewTime | js2n.Nullable String | optional,
      strategy | js2n.Nullable String
    }