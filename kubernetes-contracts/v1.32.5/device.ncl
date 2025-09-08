# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      basic
        | js2n.Nullable
          {
            attributes
              | js2n.Nullable
                ({
                  _ | js2n.Nullable
                    {
                      bool | js2n.Nullable Bool | optional,
                      int | js2n.Nullable std.number.Integer | optional,
                      string | js2n.Nullable String | optional,
                      version | js2n.Nullable String | optional
                    }
                })
              | optional,
            capacity
              | js2n.Nullable
                ({
                  _ | js2n.Nullable
                    {
                      value
                        | js2n.OneOf
                          [ js2n.Nullable String, js2n.Nullable Number ]
                    }
                })
              | optional
          }
        | optional,
      name | js2n.Nullable String
    }