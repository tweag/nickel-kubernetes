# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      attachError
        | js2n.Nullable
          {
            message | js2n.Nullable String | optional,
            time | js2n.Nullable String | optional
          }
        | optional,
      attached | js2n.Nullable Bool,
      attachmentMetadata
        | js2n.Nullable ({ _ | js2n.Nullable String })
        | optional,
      detachError
        | js2n.Nullable
          {
            message | js2n.Nullable String | optional,
            time | js2n.Nullable String | optional
          }
        | optional
    }