# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      paths
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                backend
                  | {
                    resource
                      | js2n.Nullable
                        {
                          apiGroup | js2n.Nullable String | optional,
                          kind | String,
                          name | String
                        }
                      | optional,
                    service
                      | js2n.Nullable
                        {
                          name | String,
                          port
                            | js2n.Nullable
                              {
                                name | js2n.Nullable String | optional,
                                number
                                  | js2n.Nullable std.number.Integer
                                  | optional
                              }
                            | optional
                        }
                      | optional
                  },
                path | js2n.Nullable String | optional,
                pathType | String
              }
          ))
    }