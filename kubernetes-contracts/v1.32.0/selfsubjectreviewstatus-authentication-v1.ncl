# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      userInfo
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