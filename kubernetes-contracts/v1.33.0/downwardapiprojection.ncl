# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                fieldRef
                  | js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldPath | String
                    }
                  | optional,
                mode | js2n.Nullable std.number.Integer | optional,
                path | String,
                resourceFieldRef
                  | js2n.Nullable
                    {
                      containerName | js2n.Nullable String | optional,
                      divisor
                        | js2n.OneOf
                          [ js2n.Nullable String, js2n.Nullable Number ]
                        | optional,
                      resource | String
                    }
                  | optional
              }
          ))
        | optional
    }