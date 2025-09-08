# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      items
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                action | js2n.Nullable String | optional,
                apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
                count | js2n.Nullable std.number.Integer | optional,
                eventTime | js2n.Nullable String | optional,
                firstTimestamp | js2n.Nullable String | optional,
                involvedObject
                  | {
                    apiVersion | js2n.Nullable String | optional,
                    fieldPath | js2n.Nullable String | optional,
                    kind | js2n.Nullable String | optional,
                    name | js2n.Nullable String | optional,
                    namespace | js2n.Nullable String | optional,
                    resourceVersion | js2n.Nullable String | optional,
                    uid | js2n.Nullable String | optional
                  },
                kind | std.enum.TagOrString | [| 'Event |] | optional,
                lastTimestamp | js2n.Nullable String | optional,
                message | js2n.Nullable String | optional,
                metadata
                  | {
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
                    labels
                      | js2n.Nullable ({ _ | js2n.Nullable String })
                      | optional,
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
                              blockOwnerDeletion
                                | js2n.Nullable Bool
                                | optional,
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
                  },
                reason | js2n.Nullable String | optional,
                related
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
                reportingComponent | js2n.Nullable String | optional,
                reportingInstance | js2n.Nullable String | optional,
                series
                  | js2n.Nullable
                    {
                      count | js2n.Nullable std.number.Integer | optional,
                      lastObservedTime | js2n.Nullable String | optional
                    }
                  | optional,
                source
                  | js2n.Nullable
                    {
                      component | js2n.Nullable String | optional,
                      host | js2n.Nullable String | optional
                    }
                  | optional,
                type | js2n.Nullable String | optional
              }
          )),
      kind | std.enum.TagOrString | [| 'EventList |] | optional,
      metadata
        | js2n.Nullable
          {
            continue | js2n.Nullable String | optional,
            remainingItemCount | js2n.Nullable std.number.Integer | optional,
            resourceVersion | js2n.Nullable String | optional,
            selfLink | js2n.Nullable String | optional
          }
        | optional
    }