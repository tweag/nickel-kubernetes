# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      groups
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
                kind | std.enum.TagOrString | [| 'APIGroup |] | optional,
                name | String,
                preferredVersion
                  | js2n.Nullable { groupVersion | String, version | String }
                  | optional,
                serverAddressByClientCIDRs
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        { clientCIDR | String, serverAddress | String }
                    ))
                  | optional,
                versions
                  | Array (
                    js2n.Nullable { groupVersion | String, version | String }
                  )
              }
          )),
      kind | std.enum.TagOrString | [| 'APIGroupList |] | optional
    }