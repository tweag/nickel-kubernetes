# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      addresses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                hostname | js2n.Nullable String | optional,
                ip | String,
                nodeName | js2n.Nullable String | optional,
                targetRef
                  | js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldPath | js2n.Nullable String | optional,
                      kind | js2n.Nullable String | optional,
                      name | js2n.Nullable String | optional,
                      namespace | js2n.Nullable String | optional,
                      resourceVersion | js2n.Nullable String | optional,
                      uid | js2n.Nullable String | optional
                    }
                  | optional
              }
          ))
        | optional,
      notReadyAddresses
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                hostname | js2n.Nullable String | optional,
                ip | String,
                nodeName | js2n.Nullable String | optional,
                targetRef
                  | js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldPath | js2n.Nullable String | optional,
                      kind | js2n.Nullable String | optional,
                      name | js2n.Nullable String | optional,
                      namespace | js2n.Nullable String | optional,
                      resourceVersion | js2n.Nullable String | optional,
                      uid | js2n.Nullable String | optional
                    }
                  | optional
              }
          ))
        | optional,
      ports
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                appProtocol | js2n.Nullable String | optional,
                name | js2n.Nullable String | optional,
                port | std.number.Integer,
                protocol | js2n.Nullable String | optional
              }
          ))
        | optional
    }