# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      code | js2n.Nullable std.number.Integer | optional,
      details
        | js2n.Nullable
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
        | optional,
      kind | std.enum.TagOrString | [| 'Status |] | optional,
      message | js2n.Nullable String | optional,
      metadata
        | js2n.Nullable
          {
            continue | js2n.Nullable String | optional,
            remainingItemCount | js2n.Nullable std.number.Integer | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional
          }
        | optional,
      reason | js2n.Nullable String | optional,
      status | js2n.Nullable String | optional
    }