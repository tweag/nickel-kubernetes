# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String,
      blockOwnerDeletion | js2n.Nullable Bool | optional,
      controller | js2n.Nullable Bool | optional,
      kind | js2n.Nullable String,
      name | js2n.Nullable String,
      uid | js2n.Nullable String
    }