# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | js2n.Nullable String | optional,
      kind | std.enum.TagOrString | [| 'APIGroup |] | optional,
      name | js2n.Nullable String,
      preferredVersion
        | js2n.Nullable { groupVersion | String, version | String }
        | optional,
      serverAddressByClientCIDRs
        | js2n.Nullable
          (Array (
            js2n.Nullable { clientCIDR | String, serverAddress | String }
          ))
        | optional,
      versions
        | js2n.Nullable
          (Array (js2n.Nullable { groupVersion | String, version | String }))
    }