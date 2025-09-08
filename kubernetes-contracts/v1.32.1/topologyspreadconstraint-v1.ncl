# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      labelSelector
        | js2n.Nullable
          {
            matchExpressions
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      key | String,
                      operator | String,
                      values
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional
                    }
                ))
              | optional,
            matchLabels
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional
          }
        | optional,
      matchLabelKeys | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      maxSkew | js2n.Nullable std.number.Integer,
      minDomains | js2n.Nullable std.number.Integer | optional,
      nodeAffinityPolicy | js2n.Nullable String | optional,
      nodeTaintsPolicy | js2n.Nullable String | optional,
      topologyKey | js2n.Nullable String,
      whenUnsatisfiable | js2n.Nullable String
    }