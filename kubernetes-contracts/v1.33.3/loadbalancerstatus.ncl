# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      ingress
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                hostname | js2n.Nullable String | optional,
                ip | js2n.Nullable String | optional,
                ipMode | js2n.Nullable String | optional,
                ports
                  | js2n.Nullable
                    (Array (
                      js2n.Nullable
                        {
                          error | js2n.Nullable String | optional,
                          port | std.number.Integer,
                          protocol | String
                        }
                    ))
                  | optional
              }
          ))
        | optional
    }