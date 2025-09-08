# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      rules
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                action | String,
                onExitCodes
                  | js2n.Nullable
                    {
                      containerName | js2n.Nullable String | optional,
                      operator | String,
                      values | Array (js2n.Nullable std.number.Integer)
                    }
                  | optional,
                onPodConditions
                  | js2n.Nullable
                    (Array (js2n.Nullable { status | String, type | String }))
                  | optional
              }
          ))
    }