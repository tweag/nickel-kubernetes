# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      caBundle | js2n.Nullable String | optional,
      group | js2n.Nullable String | optional,
      groupPriorityMinimum | js2n.Nullable std.number.Integer,
      insecureSkipTLSVerify | js2n.Nullable Bool | optional,
      service
        | js2n.Nullable
          {
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            port | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      version | js2n.Nullable String | optional,
      versionPriority | js2n.Nullable std.number.Integer
    }