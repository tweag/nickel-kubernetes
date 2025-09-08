# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      addresses | js2n.Nullable (Array (js2n.Nullable String)),
      conditions
        | js2n.Nullable
          {
            ready | js2n.Nullable Bool | optional,
            serving | js2n.Nullable Bool | optional,
            terminating | js2n.Nullable Bool | optional
          }
        | optional,
      deprecatedTopology
        | js2n.Nullable ({ _ | js2n.Nullable String })
        | optional,
      hints
        | js2n.Nullable
          {
            forZones
              | js2n.Nullable (Array (js2n.Nullable { name | String }))
              | optional
          }
        | optional,
      hostname | js2n.Nullable String | optional,
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
        | optional,
      zone | js2n.Nullable String | optional
    }