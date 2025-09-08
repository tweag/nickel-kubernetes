# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      queuing
        | js2n.Nullable
          {
            handSize | js2n.Nullable std.number.Integer | optional,
            queueLengthLimit | js2n.Nullable std.number.Integer | optional,
            queues | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      type | js2n.Nullable String
    }