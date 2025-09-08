# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      kind | std.enum.TagOrString | [| 'APIVersions |] | optional,
      serverAddressByClientCIDRs
        | js2n.Nullable
          (Array (
            js2n.Nullable { clientCIDR | String, serverAddress | String }
          )),
      versions | js2n.Nullable (Array (js2n.Nullable String))
    }