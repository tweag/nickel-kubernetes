# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      buildDate | js2n.Nullable String,
      compiler | js2n.Nullable String,
      emulationMajor | js2n.Nullable String | optional,
      emulationMinor | js2n.Nullable String | optional,
      gitCommit | js2n.Nullable String,
      gitTreeState | js2n.Nullable String,
      gitVersion | js2n.Nullable String,
      goVersion | js2n.Nullable String,
      major | js2n.Nullable String,
      minCompatibilityMajor | js2n.Nullable String | optional,
      minCompatibilityMinor | js2n.Nullable String | optional,
      minor | js2n.Nullable String,
      platform | js2n.Nullable String
    }