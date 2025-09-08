# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      audiences | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      authenticated | js2n.Nullable Bool | optional,
      error | js2n.Nullable String | optional,
      user
        | js2n.Nullable
          {
            extra
              | js2n.Nullable
                ({ _ | js2n.Nullable (Array (js2n.Nullable String)) })
              | optional,
            groups | js2n.Nullable (Array (js2n.Nullable String)) | optional,
            uid | js2n.Nullable String | optional,
            username | js2n.Nullable String | optional
          }
        | optional
    }