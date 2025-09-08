# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      gmsaCredentialSpec | js2n.Nullable String | optional,
      gmsaCredentialSpecName | js2n.Nullable String | optional,
      hostProcess | js2n.Nullable Bool | optional,
      runAsUserName | js2n.Nullable String | optional
    }