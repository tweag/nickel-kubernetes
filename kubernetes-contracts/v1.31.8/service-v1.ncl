# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| 'v1 |] | optional,
      kind | std.enum.TagOrString | [| 'Service |] | optional,
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
            allocateLoadBalancerNodePorts | js2n.Nullable Bool | optional,
            clusterIP | js2n.Nullable String | optional,
            clusterIPs
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            externalIPs
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            externalName | js2n.Nullable String | optional,
            externalTrafficPolicy | js2n.Nullable String | optional,
            healthCheckNodePort | js2n.Nullable std.number.Integer | optional,
            internalTrafficPolicy | js2n.Nullable String | optional,
            ipFamilies
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            ipFamilyPolicy | js2n.Nullable String | optional,
            loadBalancerClass | js2n.Nullable String | optional,
            loadBalancerIP | js2n.Nullable String | optional,
            loadBalancerSourceRanges
              | js2n.Nullable (Array (js2n.Nullable String))
              | optional,
            ports
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      appProtocol | js2n.Nullable String | optional,
                      name | js2n.Nullable String | optional,
                      nodePort | js2n.Nullable std.number.Integer | optional,
                      port | std.number.Integer,
                      protocol | js2n.Nullable String | optional,
                      targetPort
                        | js2n.OneOf
                          [
                            js2n.Nullable String,
                            js2n.Nullable std.number.Integer
                          ]
                        | optional
                    }
                ))
              | optional,
            publishNotReadyAddresses | js2n.Nullable Bool | optional,
            selector | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
            sessionAffinity | js2n.Nullable String | optional,
            sessionAffinityConfig
              | js2n.Nullable
                {
                  clientIP
                    | js2n.Nullable
                      {
                        timeoutSeconds
                          | js2n.Nullable std.number.Integer
                          | optional
                      }
                    | optional
                }
              | optional,
            trafficDistribution | js2n.Nullable String | optional,
            type | js2n.Nullable String | optional
          }
        | optional,
      status
        | js2n.Nullable
          {
            conditions
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      lastTransitionTime | String,
                      message | String,
                      observedGeneration
                        | js2n.Nullable std.number.Integer
                        | optional,
                      reason | String,
                      status | String,
                      type | String
                    }
                ))
              | optional,
            loadBalancer
              | js2n.Nullable
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
              | optional
          }
        | optional
    }