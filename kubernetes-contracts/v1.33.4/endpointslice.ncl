# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      addressType | js2n.Nullable String,
      apiVersion | js2n.Nullable String | optional,
      endpoints
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                addresses | Array (js2n.Nullable String),
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
                      forNodes
                        | js2n.Nullable
                          (Array (js2n.Nullable { name | String }))
                        | optional,
                      forZones
                        | js2n.Nullable
                          (Array (js2n.Nullable { name | String }))
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
          )),
      kind | std.enum.TagOrString | [| 'EndpointSlice |] | optional,
      metadata
        | js2n.Nullable
          {
            annotations
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional,
            creationTimestamp | js2n.Nullable String | optional,
            deletionGracePeriodSeconds
              | js2n.Nullable std.number.Integer
              | optional,
            deletionTimestamp | js2n.Nullable String | optional,
            finalizers
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            generateName | js2n.Nullable String | optional,
            generation | js2n.Nullable std.number.Integer | optional,
            labels | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
            managedFields
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      apiVersion | js2n.Nullable String | optional,
                      fieldsType | js2n.Nullable String | optional,
                      fieldsV1 | js2n.Nullable ({ _ | Dyn }) | optional,
                      manager | js2n.Nullable String | optional,
                      operation | js2n.Nullable String | optional,
                      subresource | js2n.Nullable String | optional,
                      time | js2n.Nullable String | optional
                    }
                ))
              | optional,
            name | js2n.Nullable String | optional,
            namespace | js2n.Nullable String | optional,
            ownerReferences
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      apiVersion | String,
                      blockOwnerDeletion | js2n.Nullable Bool | optional,
                      controller | js2n.Nullable Bool | optional,
                      kind | String,
                      name | String,
                      uid | String
                    }
                ))
              | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional,
            uid | js2n.Nullable String | optional
          }
        | optional,
      ports
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                appProtocol | js2n.Nullable String | optional,
                name | js2n.Nullable String | optional,
                port | js2n.Nullable std.number.Integer | optional,
                protocol | js2n.Nullable String | optional
              }
          ))
        | optional
    }