# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      nameservers | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      options
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                name | js2n.Nullable String | optional,
                value | js2n.Nullable String | optional
              }
          ))
        | optional,
      searches | js2n.Nullable (Array (js2n.Nullable String)) | optional
    }