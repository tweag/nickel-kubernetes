# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      groupVersion | js2n.Nullable String,
      kind | std.enum.TagOrString | [| 'APIResourceList |] | optional,
      resources
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                categories
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                group | js2n.Nullable String | optional,
                kind | String,
                name | String,
                namespaced | Bool,
                shortNames
                  | js2n.Nullable (Array (js2n.Nullable String))
                  | optional,
                singularName | String,
                storageVersionHash | js2n.Nullable String | optional,
                verbs | Array (js2n.Nullable String),
                version | js2n.Nullable String | optional
              }
          ))
    }