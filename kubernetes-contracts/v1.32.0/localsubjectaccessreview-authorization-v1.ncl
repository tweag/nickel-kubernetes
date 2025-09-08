# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion
        | std.enum.TagOrString
        | [| '"authorization.k8s.io/v1" |]
        | optional,
      kind | std.enum.TagOrString | [| 'LocalSubjectAccessReview |] | optional,
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
      spec
        | js2n.Nullable
          {
            extra
              | js2n.Nullable
                ({ _ | js2n.Nullable (Array (js2n.Nullable String)) })
              | optional,
            groups | js2n.Nullable (Array (js2n.Nullable String)) | optional,
            nonResourceAttributes
              | js2n.Nullable
                {
                  path | js2n.Nullable String | optional,
                  verb | js2n.Nullable String | optional
                }
              | optional,
            resourceAttributes
              | js2n.Nullable
                {
                  fieldSelector
                    | js2n.Nullable
                      {
                        rawSelector | js2n.Nullable String | optional,
                        requirements
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable
                                {
                                  key | String,
                                  operator | String,
                                  values
                                    | js2n.Nullable
                                      (Array (js2n.Nullable String))
                                    | optional
                                }
                            ))
                          | optional
                      }
                    | optional,
                  group | js2n.Nullable String | optional,
                  labelSelector
                    | js2n.Nullable
                      {
                        rawSelector | js2n.Nullable String | optional,
                        requirements
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable
                                {
                                  key | String,
                                  operator | String,
                                  values
                                    | js2n.Nullable
                                      (Array (js2n.Nullable String))
                                    | optional
                                }
                            ))
                          | optional
                      }
                    | optional,
                  name | js2n.Nullable String | optional,
                  namespace | js2n.Nullable String | optional,
                  resource | js2n.Nullable String | optional,
                  subresource | js2n.Nullable String | optional,
                  verb | js2n.Nullable String | optional,
                  version | js2n.Nullable String | optional
                }
              | optional,
            uid | js2n.Nullable String | optional,
            user | js2n.Nullable String | optional
          },
      status
        | js2n.Nullable
          {
            allowed | Bool,
            denied | js2n.Nullable Bool | optional,
            evaluationError | js2n.Nullable String | optional,
            reason | js2n.Nullable String | optional
          }
        | optional
    }