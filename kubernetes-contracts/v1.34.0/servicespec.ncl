# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      allocateLoadBalancerNodePorts | js2n.Nullable Bool | optional,
      clusterIP | js2n.Nullable String | optional,
      clusterIPs | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      externalIPs | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      externalName | js2n.Nullable String | optional,
      externalTrafficPolicy | js2n.Nullable String | optional,
      healthCheckNodePort | js2n.Nullable std.number.Integer | optional,
      internalTrafficPolicy | js2n.Nullable String | optional,
      ipFamilies | js2n.Nullable (Array (js2n.Nullable String)) | optional,
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
                    [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
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
                { timeoutSeconds | js2n.Nullable std.number.Integer | optional }
              | optional
          }
        | optional,
      trafficDistribution | js2n.Nullable String | optional,
      type | js2n.Nullable String | optional
    }