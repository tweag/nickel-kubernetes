# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      causes
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                field | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                reason | js2n.Nullable String | optional
              }
          ))
        | optional,
      group | js2n.Nullable String | optional,
      kind | js2n.Nullable String | optional,
      name | js2n.Nullable String | optional,
      retryAfterSeconds | js2n.Nullable std.number.Integer | optional,
      uid | js2n.Nullable String | optional
    }