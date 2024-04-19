# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {
      "_js2n__-:oneOf/0!predicate"
        | doc "MatchCondition represents a condition which must by fulfilled for a request to be sent to a webhook."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/1!predicate"
        | doc "MutatingWebhook describes an admission webhook and the resources and operations it applies to."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "admissionReviewVersions",
                  "clientConfig",
                  "name",
                  "sideEffects"
                ],
              _js2n__-prdslib.records.record
                {
                  admissionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/9!predicate",
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/0!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  reinvocationPolicy = _js2n__-prdslib.isType '"String",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/4!predicate"
                        ],
                  sideEffects = _js2n__-prdslib.isType '"String",
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/10!predicate"
        | doc "AuditAnnotation describes how to produce an audit annotation for an API request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "valueExpression" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  valueExpression = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/100!predicate"
        | doc "SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nonResourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/95!predicate",
                  resourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/97!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/102!predicate"
        | doc "SelfSubjectRulesReviewSpec defines the specification for SelfSubjectRulesReview."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { namespace = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/104!predicate"
        | doc "SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nonResourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/95!predicate",
                  resourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/97!predicate",
                  uid = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/105!predicate"
        | doc "SubjectAccessReviewStatus"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "allowed" ],
              _js2n__-prdslib.records.record
                {
                  allowed = _js2n__-prdslib.isType '"Bool",
                  denied = _js2n__-prdslib.isType '"Bool",
                  evaluationError = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/106!predicate"
        | doc "SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "incomplete", "nonResourceRules", "resourceRules" ],
              _js2n__-prdslib.records.record
                {
                  evaluationError = _js2n__-prdslib.isType '"String",
                  incomplete = _js2n__-prdslib.isType '"Bool",
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/96!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/98!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/107!predicate"
        | doc "CrossVersionObjectReference contains enough information to let you identify the referred resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/108!predicate"
        | doc "configuration of a horizontal pod autoscaler."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscaler" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/110!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/111!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/11!predicate"
        | doc "ExpressionWarning is a warning information that targets a specific expression."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldRef", "warning" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-prdslib.isType '"String",
                  warning = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/110!predicate"
        | doc "specification of a horizontal pod autoscaler."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxReplicas", "scaleTargetRef" ],
              _js2n__-prdslib.records.record
                {
                  maxReplicas = _js2n__-prdslib.isType 'Integer,
                  minReplicas = _js2n__-prdslib.isType 'Integer,
                  scaleTargetRef =
                    _js2n__-refsenv."_js2n__-:oneOf/107!predicate",
                  targetCPUUtilizationPercentage =
                    _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/111!predicate"
        | doc "current status of a horizontal pod autoscaler"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "currentReplicas", "desiredReplicas" ],
              _js2n__-prdslib.records.record
                {
                  currentCPUUtilizationPercentage =
                    _js2n__-prdslib.isType 'Integer,
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  desiredReplicas = _js2n__-prdslib.isType 'Integer,
                  lastScaleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/113!predicate"
        | doc "ScaleSpec describes the attributes of a scale subresource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { replicas = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/114!predicate"
        | doc "ScaleStatus represents the current status of a scale subresource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/115!predicate"
        | doc "ContainerResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source.  Only one \"target\" type should be set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "container", "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  container = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/116!predicate"
        | doc "ContainerResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing a single container in each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "container", "current", "name" ],
              _js2n__-prdslib.records.record
                {
                  container = _js2n__-prdslib.isType '"String",
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/117!predicate"
        | doc "CrossVersionObjectReference contains enough information to let you identify the referred resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/118!predicate"
        | doc "ExternalMetricSource indicates how to scale on a metric not associated with any Kubernetes object (for example length of queue in cloud messaging service, or QPS from loadbalancer running outside of cluster)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/119!predicate"
        | doc "ExternalMetricStatus indicates the current value of a global metric not associated with any Kubernetes object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/12!predicate" =
        _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/120!predicate"
        | doc "HPAScalingPolicy is a single policy which must hold true for a specified past interval."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "periodSeconds", "type", "value" ],
              _js2n__-prdslib.records.record
                {
                  periodSeconds = _js2n__-prdslib.isType 'Integer,
                  type = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/121!predicate"
        | doc "HPAScalingRules configures the scaling behavior for one direction. These Rules are applied after calculating DesiredReplicas from metrics for the HPA. They can limit the scaling velocity by specifying scaling policies. They can prevent flapping by specifying the stabilization window, so that the number of replicas is not set instantly, instead, the safest value from the stabilization window is chosen."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  policies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/120!predicate"
                        ],
                  selectPolicy = _js2n__-prdslib.isType '"String",
                  stabilizationWindowSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/122!predicate"
        | doc "HorizontalPodAutoscaler is the configuration for a horizontal pod autoscaler, which automatically manages the replica count of any resource implementing the scale subresource based on the metrics specified."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscaler" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/126!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/127!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/123!predicate"
        | doc "HorizontalPodAutoscalerBehavior configures the scaling behavior of the target in both Up and Down directions (scaleUp and scaleDown fields respectively)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  scaleDown = _js2n__-refsenv."_js2n__-:oneOf/121!predicate",
                  scaleUp = _js2n__-refsenv."_js2n__-:oneOf/121!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/124!predicate"
        | doc "HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/126!predicate"
        | doc "HorizontalPodAutoscalerSpec describes the desired functionality of the HorizontalPodAutoscaler."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxReplicas", "scaleTargetRef" ],
              _js2n__-prdslib.records.record
                {
                  behavior = _js2n__-refsenv."_js2n__-:oneOf/123!predicate",
                  maxReplicas = _js2n__-prdslib.isType 'Integer,
                  metrics =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/129!predicate"
                        ],
                  minReplicas = _js2n__-prdslib.isType 'Integer,
                  scaleTargetRef =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/127!predicate"
        | doc "HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "desiredReplicas" ],
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/124!predicate"
                        ],
                  currentMetrics =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/130!predicate"
                        ],
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  desiredReplicas = _js2n__-prdslib.isType 'Integer,
                  lastScaleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/128!predicate"
        | doc "MetricIdentifier defines the name and optionally selector for a metric"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/129!predicate"
        | doc "MetricSpec specifies how to scale based on a single metric (only `type` and one other matching field should be set at once)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  containerResource =
                    _js2n__-refsenv."_js2n__-:oneOf/115!predicate",
                  external = _js2n__-refsenv."_js2n__-:oneOf/118!predicate",
                  object = _js2n__-refsenv."_js2n__-:oneOf/133!predicate",
                  pods = _js2n__-refsenv."_js2n__-:oneOf/135!predicate",
                  resource = _js2n__-refsenv."_js2n__-:oneOf/137!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/13!predicate"
        | doc "MatchResources decides whether to run the admission control policy on an object based on whether it meets the match criteria. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  excludeResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/14!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/14!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/130!predicate"
        | doc "MetricStatus describes the last-read state of a single metric."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  containerResource =
                    _js2n__-refsenv."_js2n__-:oneOf/116!predicate",
                  external = _js2n__-refsenv."_js2n__-:oneOf/119!predicate",
                  object = _js2n__-refsenv."_js2n__-:oneOf/134!predicate",
                  pods = _js2n__-refsenv."_js2n__-:oneOf/136!predicate",
                  resource = _js2n__-refsenv."_js2n__-:oneOf/138!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/131!predicate"
        | doc "MetricTarget defines the target value, average value, or average utilization of a specific metric"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  averageUtilization = _js2n__-prdslib.isType 'Integer,
                  averageValue = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  type = _js2n__-prdslib.isType '"String",
                  value = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/132!predicate"
        | doc "MetricValueStatus holds the current value for a metric"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  averageUtilization = _js2n__-prdslib.isType 'Integer,
                  averageValue = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  value = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/133!predicate"
        | doc "ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "describedObject", "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  describedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/134!predicate"
        | doc "ObjectMetricStatus indicates the current value of a metric describing a kubernetes object (for example, hits-per-second on an Ingress object)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "current", "describedObject", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  describedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/135!predicate"
        | doc "PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/136!predicate"
        | doc "PodsMetricStatus indicates the current value of a metric describing each pod in the current scale target (for example, transactions-processed-per-second)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/137!predicate"
        | doc "ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source.  Only one \"target\" type should be set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/138!predicate"
        | doc "ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \"pods\" source."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "name" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/139!predicate"
        | doc "CronJob represents the configuration of a single cron job."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CronJob" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/141!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/142!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/14!predicate"
        | doc "NamedRuleWithOperations is a tuple of Operations and Resources with ResourceNames."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/141!predicate"
        | doc "CronJobSpec describes how the job execution will look like and when it will actually run."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "jobTemplate", "schedule" ],
              _js2n__-prdslib.records.record
                {
                  concurrencyPolicy = _js2n__-prdslib.isType '"String",
                  failedJobsHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  jobTemplate = _js2n__-refsenv."_js2n__-:oneOf/148!predicate",
                  schedule = _js2n__-prdslib.isType '"String",
                  startingDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  successfulJobsHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  suspend = _js2n__-prdslib.isType '"Bool",
                  timeZone = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/142!predicate"
        | doc "CronJobStatus represents the current state of a cron job."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/270!predicate"
                        ],
                  lastScheduleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastSuccessfulTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/143!predicate"
        | doc "Job represents the configuration of a single job."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Job" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/146!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/147!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/144!predicate"
        | doc "JobCondition describes current state of a job."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/146!predicate"
        | doc "JobSpec describes how the job execution will look like."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "template" ],
              _js2n__-prdslib.records.record
                {
                  activeDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  backoffLimit = _js2n__-prdslib.isType 'Integer,
                  backoffLimitPerIndex = _js2n__-prdslib.isType 'Integer,
                  completionMode = _js2n__-prdslib.isType '"String",
                  completions = _js2n__-prdslib.isType 'Integer,
                  manualSelector = _js2n__-prdslib.isType '"Bool",
                  maxFailedIndexes = _js2n__-prdslib.isType 'Integer,
                  parallelism = _js2n__-prdslib.isType 'Integer,
                  podFailurePolicy =
                    _js2n__-refsenv."_js2n__-:oneOf/149!predicate",
                  podReplacementPolicy = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  suspend = _js2n__-prdslib.isType '"Bool",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  ttlSecondsAfterFinished = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/147!predicate"
        | doc "JobStatus represents the current state of a Job."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active = _js2n__-prdslib.isType 'Integer,
                  completedIndexes = _js2n__-prdslib.isType '"String",
                  completionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/144!predicate"
                        ],
                  failed = _js2n__-prdslib.isType 'Integer,
                  failedIndexes = _js2n__-prdslib.isType '"String",
                  ready = _js2n__-prdslib.isType 'Integer,
                  startTime = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  succeeded = _js2n__-prdslib.isType 'Integer,
                  terminating = _js2n__-prdslib.isType 'Integer,
                  uncountedTerminatedPods =
                    _js2n__-refsenv."_js2n__-:oneOf/153!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/148!predicate"
        | doc "JobTemplateSpec describes the data a Job should have when created from a template"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/146!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/149!predicate"
        | doc "PodFailurePolicy describes how failed pods influence the backoffLimit."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "rules" ],
              _js2n__-prdslib.records.record
                {
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/152!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/15!predicate"
        | doc "ParamKind is a tuple of Group Kind and Version."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/150!predicate"
        | doc "PodFailurePolicyOnExitCodesRequirement describes the requirement for handling a failed pod based on its container exit codes. In particular, it lookups the .state.terminated.exitCode for each app container and init container status, represented by the .status.containerStatuses and .status.initContainerStatuses fields in the Pod status, respectively. Containers completed with success (exit code 0) are excluded from the requirement check."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "operator", "values" ],
              _js2n__-prdslib.records.record
                {
                  containerName = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType 'Integer)
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/151!predicate"
        | doc "PodFailurePolicyOnPodConditionsPattern describes a pattern for matching an actual pod condition type."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/152!predicate"
        | doc "PodFailurePolicyRule describes how a pod failure is handled when the requirements are met. One of onExitCodes and onPodConditions, but not both, can be used in each rule."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "action" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  onExitCodes = _js2n__-refsenv."_js2n__-:oneOf/150!predicate",
                  onPodConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/151!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/153!predicate"
        | doc "UncountedTerminatedPods holds UIDs of Pods that have terminated but haven't been accounted in Job status counters."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  failed =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  succeeded =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/154!predicate"
        | doc m%"
          CertificateSigningRequest objects provide a mechanism to obtain x509 certificates by submitting a certificate signing request, and having it asynchronously approved and issued.
          
          Kubelets use this API to obtain:
           1. client certificates to authenticate to kube-apiserver (with the "kubernetes.io/kube-apiserver-client-kubelet" signerName).
           2. serving certificates for TLS endpoints kube-apiserver can connect to securely (with the "kubernetes.io/kubelet-serving" signerName).
          
          This API can be used to request client certificates to authenticate to kube-apiserver (with the "kubernetes.io/kube-apiserver-client" signerName), or to obtain certificates from custom non-Kubernetes signers.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CertificateSigningRequest" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/157!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/158!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/155!predicate"
        | doc "CertificateSigningRequestCondition describes a condition of a CertificateSigningRequest object"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastUpdateTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/157!predicate"
        | doc "CertificateSigningRequestSpec contains the certificate request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "request", "signerName" ],
              _js2n__-prdslib.records.record
                {
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  request = _js2n__-prdslib.isType '"String",
                  signerName = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                  usages =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  username = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/158!predicate"
        | doc "CertificateSigningRequestStatus contains conditions used to indicate approved/denied/failed status of the request, and the issued certificate."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  certificate = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/155!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/159!predicate"
        | doc m%"
          ClusterTrustBundle is a cluster-scoped container for X.509 trust anchors (root certificates).
          
          ClusterTrustBundle objects are considered to be readable by any authenticated user in the cluster, because they can be mounted by pods using the `clusterTrustBundle` projection.  All service accounts have read access to ClusterTrustBundles by default.  Users who only have namespace-level access to a cluster can read ClusterTrustBundles by impersonating a serviceaccount that they have access to.
          
          It can be optionally associated with a particular assigner, in which case it contains one valid set of trust anchors for that signer. Signers may have multiple associated ClusterTrustBundles; each is an independent set of trust anchors for that signer. Admission control is used to enforce that only users with permissions on the signer can create or modify the corresponding bundle.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterTrustBundle" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/161!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/16!predicate"
        | doc "ParamRef describes how to locate the params to be used as input to expressions of rules applied by a policy binding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  parameterNotFoundAction = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/161!predicate"
        | doc "ClusterTrustBundleSpec contains the signer and trust anchors."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "trustBundle" ],
              _js2n__-prdslib.records.record
                {
                  signerName = _js2n__-prdslib.isType '"String",
                  trustBundle = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/162!predicate"
        | doc "Lease defines a lease concept."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Lease" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/164!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/164!predicate"
        | doc "LeaseSpec is a specification of a Lease."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  acquireTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  holderIdentity = _js2n__-prdslib.isType '"String",
                  leaseDurationSeconds = _js2n__-prdslib.isType 'Integer,
                  leaseTransitions = _js2n__-prdslib.isType 'Integer,
                  renewTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/165!predicate"
        | doc m%"
          Represents a Persistent Disk resource in AWS.
          
          An AWS EBS disk must exist before mounting to a container. The disk must also be in the same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS EBS volumes support ownership management and SELinux relabeling.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  partition = _js2n__-prdslib.isType 'Integer,
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/166!predicate"
        | doc "Affinity is a group of affinity scheduling rules."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nodeAffinity = _js2n__-refsenv."_js2n__-:oneOf/257!predicate",
                  podAffinity = _js2n__-refsenv."_js2n__-:oneOf/284!predicate",
                  podAntiAffinity =
                    _js2n__-refsenv."_js2n__-:oneOf/286!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/167!predicate"
        | doc "AttachedVolume describes a volume attached to a node"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "devicePath", "name" ],
              _js2n__-prdslib.records.record
                {
                  devicePath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/168!predicate"
        | doc "AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "diskName", "diskURI" ],
              _js2n__-prdslib.records.record
                {
                  cachingMode = _js2n__-prdslib.isType '"String",
                  diskName = _js2n__-prdslib.isType '"String",
                  diskURI = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/169!predicate"
        | doc "AzureFile represents an Azure File Service mount on the host and bind mount to the pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "secretName", "shareName" ],
              _js2n__-prdslib.records.record
                {
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                  secretNamespace = _js2n__-prdslib.isType '"String",
                  shareName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/17!predicate"
        | doc "TypeChecking contains results of type checking the expressions in the ValidatingAdmissionPolicy"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  expressionWarnings =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/11!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/170!predicate"
        | doc "AzureFile represents an Azure File Service mount on the host and bind mount to the pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "secretName", "shareName" ],
              _js2n__-prdslib.records.record
                {
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                  shareName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/172!predicate"
        | doc "Represents storage that is managed by an external CSI volume driver (Beta feature)"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver", "volumeHandle" ],
              _js2n__-prdslib.records.record
                {
                  controllerExpandSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  controllerPublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  nodeExpandSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  nodePublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  nodeStageSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeAttributes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  volumeHandle = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/173!predicate"
        | doc "Represents a source location of a volume to mount, managed by an external CSI driver"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  nodePublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeAttributes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/174!predicate"
        | doc "Adds and removes POSIX capabilities from running containers."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  add =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  drop =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/175!predicate"
        | doc "Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "monitors" ],
              _js2n__-prdslib.records.record
                {
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretFile = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/176!predicate"
        | doc "Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "monitors" ],
              _js2n__-prdslib.records.record
                {
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretFile = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/177!predicate"
        | doc "Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/178!predicate"
        | doc "Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/179!predicate"
        | doc m%"
          ClaimSource describes a reference to a ResourceClaim.
          
          Exactly one of these fields should be set.  Consumers of this type must treat an empty object as if it has an unknown value.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceClaimName = _js2n__-prdslib.isType '"String",
                  resourceClaimTemplateName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/18!predicate"
        | doc "ValidatingAdmissionPolicy describes the definition of an admission validation policy that accepts or rejects an object without changing it."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ValidatingAdmissionPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/23!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/24!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/180!predicate"
        | doc "ClientIPConfig represents the configurations of Client IP based session affinity."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { timeoutSeconds = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/181!predicate"
        | doc "ClusterTrustBundleProjection describes how to select a set of ClusterTrustBundle objects and project their contents into the pod filesystem."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                  path = _js2n__-prdslib.isType '"String",
                  signerName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/182!predicate"
        | doc "Information about the condition of a component."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/183!predicate"
        | doc "ComponentStatus (and ComponentStatusList) holds the cluster validation info. Deprecated: This API is deprecated in v1.19+"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/182!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ComponentStatus" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/185!predicate"
        | doc "ConfigMap holds configuration data for pods to consume."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  binaryData =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  data =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  immutable = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ConfigMap" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/186!predicate"
        | doc m%"
          ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
          
          The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/187!predicate"
        | doc "Selects a key from a ConfigMap."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/189!predicate"
        | doc "ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config source for the Node. This API is deprecated since 1.22: https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "kubeletConfigKey", "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  kubeletConfigKey = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/19!predicate"
        | doc m%"
          ValidatingAdmissionPolicyBinding binds the ValidatingAdmissionPolicy with paramerized resources. ValidatingAdmissionPolicyBinding and parameter CRDs together define how cluster administrators configure policies for clusters.
          
          For a given admission request, each binding will cause its policy to be evaluated N times, where N is 1 for policies/bindings that don't use params, otherwise N is the number of parameters selected by the binding.
          
          The CEL expressions of a policy must have a computed CEL cost below the maximum CEL budget. Each evaluation of the policy is given an independent CEL cost budget. Adding/removing policies, bindings, or params can not affect whether a given (policy, binding, param) combination is within its own CEL budget.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/21!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/190!predicate"
        | doc m%"
          Adapts a ConfigMap into a projected volume.
          
          The contents of the target ConfigMap's Data field will be presented in a projected volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. Note that this is identical to a configmap volume source without the default mode.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/191!predicate"
        | doc m%"
          Adapts a ConfigMap into a volume.
          
          The contents of the target ConfigMap's Data field will be presented in a volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. ConfigMap volumes support ownership management and SELinux relabeling.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/192!predicate"
        | doc "A single application container that you want to run within a pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  args =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  env =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/212!predicate"
                        ],
                  envFrom =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/211!predicate"
                        ],
                  image = _js2n__-prdslib.isType '"String",
                  imagePullPolicy = _js2n__-prdslib.isType '"String",
                  lifecycle = _js2n__-refsenv."_js2n__-:oneOf/238!predicate",
                  livenessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/194!predicate"
                        ],
                  readinessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  resizePolicy =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/195!predicate"
                        ],
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/336!predicate",
                  startupProbe = _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  stdin = _js2n__-prdslib.isType '"Bool",
                  stdinOnce = _js2n__-prdslib.isType '"Bool",
                  terminationMessagePath = _js2n__-prdslib.isType '"String",
                  terminationMessagePolicy = _js2n__-prdslib.isType '"String",
                  tty = _js2n__-prdslib.isType '"Bool",
                  volumeDevices =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/359!predicate"
                        ],
                  volumeMounts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/360!predicate"
                        ],
                  workingDir = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/193!predicate"
        | doc "Describe a container image"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  names =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  sizeBytes = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/194!predicate"
        | doc "ContainerPort represents a network port in a single container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "containerPort" ],
              _js2n__-prdslib.records.record
                {
                  containerPort = _js2n__-prdslib.isType 'Integer,
                  hostIP = _js2n__-prdslib.isType '"String",
                  hostPort = _js2n__-prdslib.isType 'Integer,
                  name = _js2n__-prdslib.isType '"String",
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/195!predicate"
        | doc "ContainerResizePolicy represents resource resize policy for the container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "resourceName", "restartPolicy" ],
              _js2n__-prdslib.records.record
                {
                  resourceName = _js2n__-prdslib.isType '"String",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/196!predicate"
        | doc "ContainerState holds a possible state of container. Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  running = _js2n__-refsenv."_js2n__-:oneOf/197!predicate",
                  terminated = _js2n__-refsenv."_js2n__-:oneOf/198!predicate",
                  waiting = _js2n__-refsenv."_js2n__-:oneOf/199!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/197!predicate"
        | doc "ContainerStateRunning is a running state of a container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { startedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate", }
                {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/198!predicate"
        | doc "ContainerStateTerminated is a terminated state of a container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "exitCode" ],
              _js2n__-prdslib.records.record
                {
                  containerID = _js2n__-prdslib.isType '"String",
                  exitCode = _js2n__-prdslib.isType 'Integer,
                  finishedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  signal = _js2n__-prdslib.isType 'Integer,
                  startedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/199!predicate"
        | doc "ContainerStateWaiting is a waiting state of a container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/2!predicate"
        | doc "MutatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and may change the object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "MutatingWebhookConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  webhooks =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/1!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/200!predicate"
        | doc "ContainerStatus contains details for the current status of this container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "image", "imageID", "name", "ready", "restartCount" ],
              _js2n__-prdslib.records.record
                {
                  allocatedResources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  containerID = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  imageID = _js2n__-prdslib.isType '"String",
                  lastState = _js2n__-refsenv."_js2n__-:oneOf/196!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ready = _js2n__-prdslib.isType '"Bool",
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartCount = _js2n__-prdslib.isType 'Integer,
                  started = _js2n__-prdslib.isType '"Bool",
                  state = _js2n__-refsenv."_js2n__-:oneOf/196!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/201!predicate"
        | doc "DaemonEndpoint contains information about a single Daemon endpoint."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "Port" ],
              _js2n__-prdslib.records.record
                { Port = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/202!predicate"
        | doc "Represents downward API info for projecting into a projected volume. Note that this is identical to a downwardAPI volume source without the default mode."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/203!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/203!predicate"
        | doc "DownwardAPIVolumeFile represents information to create the file containing the pod field"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-refsenv."_js2n__-:oneOf/269!predicate",
                  mode = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                  resourceFieldRef =
                    _js2n__-refsenv."_js2n__-:oneOf/317!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/204!predicate"
        | doc "DownwardAPIVolumeSource represents a volume containing downward API info. Downward API volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/203!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/205!predicate"
        | doc "Represents an empty directory for a pod. Empty directory volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  medium = _js2n__-prdslib.isType '"String",
                  sizeLimit = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/206!predicate"
        | doc "EndpointAddress is a tuple that describes single IP address."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "ip" ],
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  targetRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/207!predicate"
        | doc "EndpointPort is a tuple that describes a single port."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/208!predicate"
        | doc m%"
          EndpointSubset is a group of addresses with a common set of ports. The expanded set of endpoints is the Cartesian product of Addresses x Ports. For example, given:
          
          	{
          	  Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
          	  Ports:     [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
          	}
          
          The resulting set of endpoints can be viewed as:
          
          	a: [ 10.10.1.1:8675, 10.10.2.2:8675 ],
          	b: [ 10.10.1.1:309, 10.10.2.2:309 ]
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/206!predicate"
                        ],
                  notReadyAddresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/206!predicate"
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/207!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/209!predicate"
        | doc m%"
          Endpoints is a collection of endpoints that implement the actual service. Example:
          
          	 Name: "mysvc",
          	 Subsets: [
          	   {
          	     Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
          	     Ports: [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
          	   },
          	   {
          	     Addresses: [{"ip": "10.10.3.3"}],
          	     Ports: [{"name": "a", "port": 93}, {"name": "b", "port": 76}]
          	   },
          	]
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Endpoints" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  subsets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/208!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/21!predicate"
        | doc "ValidatingAdmissionPolicyBindingSpec is the specification of the ValidatingAdmissionPolicyBinding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchResources =
                    _js2n__-refsenv."_js2n__-:oneOf/13!predicate",
                  paramRef = _js2n__-refsenv."_js2n__-:oneOf/16!predicate",
                  policyName = _js2n__-prdslib.isType '"String",
                  validationActions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/211!predicate"
        | doc "EnvFromSource represents the source of a set of ConfigMaps"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configMapRef = _js2n__-refsenv."_js2n__-:oneOf/186!predicate",
                  prefix = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/330!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/212!predicate"
        | doc "EnvVar represents an environment variable present in a Container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                  valueFrom = _js2n__-refsenv."_js2n__-:oneOf/213!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/213!predicate"
        | doc "EnvVarSource represents a source for the value of an EnvVar."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configMapKeyRef =
                    _js2n__-refsenv."_js2n__-:oneOf/187!predicate",
                  fieldRef = _js2n__-refsenv."_js2n__-:oneOf/269!predicate",
                  resourceFieldRef =
                    _js2n__-refsenv."_js2n__-:oneOf/317!predicate",
                  secretKeyRef = _js2n__-refsenv."_js2n__-:oneOf/331!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/214!predicate"
        | doc m%"
          An EphemeralContainer is a temporary container that you may add to an existing Pod for user-initiated activities such as debugging. Ephemeral containers have no resource or scheduling guarantees, and they will not be restarted when they exit or when a Pod is removed or restarted. The kubelet may evict a Pod if an ephemeral container causes the Pod to exceed its resource allocation.
          
          To add an ephemeral container, use the ephemeralcontainers subresource of an existing Pod. Ephemeral containers may not be removed or restarted.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  args =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  env =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/212!predicate"
                        ],
                  envFrom =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/211!predicate"
                        ],
                  image = _js2n__-prdslib.isType '"String",
                  imagePullPolicy = _js2n__-prdslib.isType '"String",
                  lifecycle = _js2n__-refsenv."_js2n__-:oneOf/238!predicate",
                  livenessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/194!predicate"
                        ],
                  readinessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  resizePolicy =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/195!predicate"
                        ],
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/336!predicate",
                  startupProbe = _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  stdin = _js2n__-prdslib.isType '"Bool",
                  stdinOnce = _js2n__-prdslib.isType '"Bool",
                  targetContainerName = _js2n__-prdslib.isType '"String",
                  terminationMessagePath = _js2n__-prdslib.isType '"String",
                  terminationMessagePolicy = _js2n__-prdslib.isType '"String",
                  tty = _js2n__-prdslib.isType '"Bool",
                  volumeDevices =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/359!predicate"
                        ],
                  volumeMounts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/360!predicate"
                        ],
                  workingDir = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/215!predicate"
        | doc "Represents an ephemeral volume that is handled by a normal storage driver."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  volumeClaimTemplate =
                    _js2n__-refsenv."_js2n__-:oneOf/277!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/216!predicate"
        | doc "Event is a report of an event somewhere in the cluster.  Events have a limited retention time and triggers and messages may evolve with time.  Event consumers should not rely on the timing of an event with a given Reason reflecting a consistent underlying trigger, or the continued existence of events with that Reason.  Events should be treated as informative, best-effort, supplemental data."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "involvedObject", "metadata" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  count = _js2n__-prdslib.isType 'Integer,
                  eventTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  firstTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  involvedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Event" ]
                        ],
                  lastTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  reason = _js2n__-prdslib.isType '"String",
                  related = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  reportingComponent = _js2n__-prdslib.isType '"String",
                  reportingInstance = _js2n__-prdslib.isType '"String",
                  series = _js2n__-refsenv."_js2n__-:oneOf/218!predicate",
                  source = _js2n__-refsenv."_js2n__-:oneOf/219!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/218!predicate"
        | doc "EventSeries contain information on series of events, i.e. thing that was/is happening continuously for some time."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  count = _js2n__-prdslib.isType 'Integer,
                  lastObservedTime =
                    _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/219!predicate"
        | doc "EventSource contains information for an event."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  component = _js2n__-prdslib.isType '"String",
                  host = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/220!predicate"
        | doc "ExecAction describes a \"run in container\" action."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/221!predicate"
        | doc "Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  targetWWNs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  wwids =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/222!predicate"
        | doc "FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/223!predicate"
        | doc "FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/224!predicate"
        | doc "Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  datasetName = _js2n__-prdslib.isType '"String",
                  datasetUUID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/225!predicate"
        | doc m%"
          Represents a Persistent Disk resource in Google Compute Engine.
          
          A GCE PD must exist before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once or read-only many times. GCE PDs support ownership management and SELinux relabeling.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "pdName" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  partition = _js2n__-prdslib.isType 'Integer,
                  pdName = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/226!predicate" =
        _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  port = _js2n__-prdslib.isType 'Integer,
                  service = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/227!predicate"
        | doc m%"
          Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.
          
          DEPRECATED: GitRepo is deprecated. To provision a container with a git repo, mount an EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir into the Pod's container.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "repository" ],
              _js2n__-prdslib.records.record
                {
                  directory = _js2n__-prdslib.isType '"String",
                  repository = _js2n__-prdslib.isType '"String",
                  revision = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/228!predicate"
        | doc "Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "endpoints", "path" ],
              _js2n__-prdslib.records.record
                {
                  endpoints = _js2n__-prdslib.isType '"String",
                  endpointsNamespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/229!predicate"
        | doc "Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "endpoints", "path" ],
              _js2n__-prdslib.records.record
                {
                  endpoints = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/23!predicate"
        | doc "ValidatingAdmissionPolicySpec is the specification of the desired behavior of the AdmissionPolicy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  auditAnnotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/10!predicate"
                        ],
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/12!predicate"
                        ],
                  matchConstraints =
                    _js2n__-refsenv."_js2n__-:oneOf/13!predicate",
                  paramKind = _js2n__-refsenv."_js2n__-:oneOf/15!predicate",
                  validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/25!predicate"
                        ],
                  variables =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/26!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/230!predicate"
        | doc "HTTPGetAction describes an action based on HTTP Get requests."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  httpHeaders =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/231!predicate"
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  scheme = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/231!predicate"
        | doc "HTTPHeader describes a custom header to be used in HTTP probes"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "value" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/232!predicate"
        | doc "HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostnames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ip = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/233!predicate"
        | doc "HostIP represents a single IP address allocated to the host."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { ip = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/234!predicate"
        | doc "Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/235!predicate"
        | doc "ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "iqn", "lun", "targetPortal" ],
              _js2n__-prdslib.records.record
                {
                  chapAuthDiscovery = _js2n__-prdslib.isType '"Bool",
                  chapAuthSession = _js2n__-prdslib.isType '"Bool",
                  fsType = _js2n__-prdslib.isType '"String",
                  initiatorName = _js2n__-prdslib.isType '"String",
                  iqn = _js2n__-prdslib.isType '"String",
                  iscsiInterface = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  portals =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  targetPortal = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/236!predicate"
        | doc "Represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "iqn", "lun", "targetPortal" ],
              _js2n__-prdslib.records.record
                {
                  chapAuthDiscovery = _js2n__-prdslib.isType '"Bool",
                  chapAuthSession = _js2n__-prdslib.isType '"Bool",
                  fsType = _js2n__-prdslib.isType '"String",
                  initiatorName = _js2n__-prdslib.isType '"String",
                  iqn = _js2n__-prdslib.isType '"String",
                  iscsiInterface = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  portals =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  targetPortal = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/237!predicate"
        | doc "Maps a string key to a path within a volume."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "path" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  mode = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/238!predicate"
        | doc "Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  postStart = _js2n__-refsenv."_js2n__-:oneOf/239!predicate",
                  preStop = _js2n__-refsenv."_js2n__-:oneOf/239!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/239!predicate"
        | doc "LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One and only one of the fields, except TCPSocket must be specified."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  exec = _js2n__-refsenv."_js2n__-:oneOf/220!predicate",
                  httpGet = _js2n__-refsenv."_js2n__-:oneOf/230!predicate",
                  sleep = _js2n__-refsenv."_js2n__-:oneOf/346!predicate",
                  tcpSocket = _js2n__-refsenv."_js2n__-:oneOf/350!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/24!predicate"
        | doc "ValidatingAdmissionPolicyStatus represents the status of a ValidatingAdmissionPolicy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  typeChecking = _js2n__-refsenv."_js2n__-:oneOf/17!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/240!predicate"
        | doc "LimitRange sets resource usage limits for each kind of resource in a Namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "LimitRange" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/243!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/241!predicate"
        | doc "LimitRangeItem defines a min/max usage limit for any resource that matches on kind."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  "default" =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  defaultRequest =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  max =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  maxLimitRequestRatio =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  min =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/243!predicate"
        | doc "LimitRangeSpec defines a min/max usage limit for resources that match on kind."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "limits" ],
              _js2n__-prdslib.records.record
                {
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/241!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/244!predicate"
        | doc "LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  ipMode = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/303!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/245!predicate"
        | doc "LoadBalancerStatus represents the status of a load-balancer."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/244!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/246!predicate"
        | doc "LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/247!predicate"
        | doc "Local represents directly-attached storage with node affinity (Beta feature)"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/248!predicate"
        | doc "ModifyVolumeStatus represents the status object of ControllerModifyVolume operation"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status" ],
              _js2n__-prdslib.records.record
                {
                  status = _js2n__-prdslib.isType '"String",
                  targetVolumeAttributesClassName =
                    _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/249!predicate"
        | doc "Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path", "server" ],
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  server = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/25!predicate"
        | doc "Validation specifies the CEL expression which is used to apply the validation."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/250!predicate"
        | doc "Namespace provides a scope for Names. Use of multiple namespaces is optional."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Namespace" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/253!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/254!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/251!predicate"
        | doc "NamespaceCondition contains details about state of namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/253!predicate"
        | doc "NamespaceSpec describes the attributes on a Namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  finalizers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/254!predicate"
        | doc "NamespaceStatus is information about the current status of a Namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/251!predicate"
                        ],
                  phase = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/255!predicate"
        | doc "Node is a worker node in Kubernetes. Each node will have a unique identifier in the cache (i.e. in etcd)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Node" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/266!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/267!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/256!predicate"
        | doc "NodeAddress contains information for the node's address."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "address", "type" ],
              _js2n__-prdslib.records.record
                {
                  address = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/257!predicate"
        | doc "Node affinity is a group of node affinity scheduling rules."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/305!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/258!predicate"
        | doc "NodeCondition contains condition information for a node."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastHeartbeatTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/259!predicate"
        | doc "NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil. This API is deprecated since 1.22"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { configMap = _js2n__-refsenv."_js2n__-:oneOf/189!predicate", }
                {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/26!predicate"
        | doc "Variable is the definition of a variable that is used for composition."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/260!predicate"
        | doc "NodeConfigStatus describes the status of the config assigned by Node.Spec.ConfigSource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  assigned = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  error = _js2n__-prdslib.isType '"String",
                  lastKnownGood =
                    _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/261!predicate"
        | doc "NodeDaemonEndpoints lists ports opened by daemons running on the Node."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  kubeletEndpoint =
                    _js2n__-refsenv."_js2n__-:oneOf/201!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/263!predicate"
        | doc "A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nodeSelectorTerms" ],
              _js2n__-prdslib.records.record
                {
                  nodeSelectorTerms =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/265!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/264!predicate"
        | doc "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "operator" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/265!predicate"
        | doc "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/264!predicate"
                        ],
                  matchFields =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/264!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/266!predicate"
        | doc "NodeSpec describes the attributes that a node is created with."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configSource = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  externalID = _js2n__-prdslib.isType '"String",
                  podCIDR = _js2n__-prdslib.isType '"String",
                  podCIDRs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  providerID = _js2n__-prdslib.isType '"String",
                  taints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/351!predicate"
                        ],
                  unschedulable = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/267!predicate"
        | doc "NodeStatus is information about the current status of a node."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/256!predicate"
                        ],
                  allocatable =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/258!predicate"
                        ],
                  config = _js2n__-refsenv."_js2n__-:oneOf/260!predicate",
                  daemonEndpoints =
                    _js2n__-refsenv."_js2n__-:oneOf/261!predicate",
                  images =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/193!predicate"
                        ],
                  nodeInfo = _js2n__-refsenv."_js2n__-:oneOf/268!predicate",
                  phase = _js2n__-prdslib.isType '"String",
                  volumesAttached =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/167!predicate"
                        ],
                  volumesInUse =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/268!predicate"
        | doc "NodeSystemInfo is a set of ids/uuids to uniquely identify the node."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "architecture",
                  "bootID",
                  "containerRuntimeVersion",
                  "kernelVersion",
                  "kubeProxyVersion",
                  "kubeletVersion",
                  "machineID",
                  "operatingSystem",
                  "osImage",
                  "systemUUID"
                ],
              _js2n__-prdslib.records.record
                {
                  architecture = _js2n__-prdslib.isType '"String",
                  bootID = _js2n__-prdslib.isType '"String",
                  containerRuntimeVersion = _js2n__-prdslib.isType '"String",
                  kernelVersion = _js2n__-prdslib.isType '"String",
                  kubeProxyVersion = _js2n__-prdslib.isType '"String",
                  kubeletVersion = _js2n__-prdslib.isType '"String",
                  machineID = _js2n__-prdslib.isType '"String",
                  operatingSystem = _js2n__-prdslib.isType '"String",
                  osImage = _js2n__-prdslib.isType '"String",
                  systemUUID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/269!predicate"
        | doc "ObjectFieldSelector selects an APIVersioned field of an object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldPath" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldPath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/27!predicate"
        | doc "AuditAnnotation describes how to produce an audit annotation for an API request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "valueExpression" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  valueExpression = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/270!predicate"
        | doc "ObjectReference contains enough information to let you inspect or modify the referred object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldPath = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/271!predicate"
        | doc "PersistentVolume (PV) is a storage resource provisioned by an administrator. It is analogous to a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolume" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/280!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/281!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/272!predicate"
        | doc "PersistentVolumeClaim is a user's request for and claim to a persistent volume"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolumeClaim" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/275!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/276!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/273!predicate"
        | doc "PersistentVolumeClaimCondition contains details about state of pvc"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/275!predicate"
        | doc "PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a Source for provider-specific attributes"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  dataSource = _js2n__-refsenv."_js2n__-:oneOf/356!predicate",
                  dataSourceRef =
                    _js2n__-refsenv."_js2n__-:oneOf/357!predicate",
                  resources = _js2n__-refsenv."_js2n__-:oneOf/363!predicate",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                  volumeAttributesClassName = _js2n__-prdslib.isType '"String",
                  volumeMode = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/276!predicate"
        | doc "PersistentVolumeClaimStatus is the current status of a persistent volume claim."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  allocatedResourceStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  allocatedResources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/273!predicate"
                        ],
                  currentVolumeAttributesClassName =
                    _js2n__-prdslib.isType '"String",
                  modifyVolumeStatus =
                    _js2n__-refsenv."_js2n__-:oneOf/248!predicate",
                  phase = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/277!predicate"
        | doc "PersistentVolumeClaimTemplate is used to produce PersistentVolumeClaim objects as part of an EphemeralVolumeSource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/275!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/278!predicate"
        | doc "PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This volume finds the bound PV and mounts that volume for the pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of volume that is owned by someone else (the system)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "claimName" ],
              _js2n__-prdslib.records.record
                {
                  claimName = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/28!predicate"
        | doc "ExpressionWarning is a warning information that targets a specific expression."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldRef", "warning" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-prdslib.isType '"String",
                  warning = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/280!predicate"
        | doc "PersistentVolumeSpec is the specification of a persistent volume."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  awsElasticBlockStore =
                    _js2n__-refsenv."_js2n__-:oneOf/165!predicate",
                  azureDisk = _js2n__-refsenv."_js2n__-:oneOf/168!predicate",
                  azureFile = _js2n__-refsenv."_js2n__-:oneOf/169!predicate",
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  cephfs = _js2n__-refsenv."_js2n__-:oneOf/175!predicate",
                  cinder = _js2n__-refsenv."_js2n__-:oneOf/177!predicate",
                  claimRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  csi = _js2n__-refsenv."_js2n__-:oneOf/172!predicate",
                  fc = _js2n__-refsenv."_js2n__-:oneOf/221!predicate",
                  flexVolume = _js2n__-refsenv."_js2n__-:oneOf/222!predicate",
                  flocker = _js2n__-refsenv."_js2n__-:oneOf/224!predicate",
                  gcePersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/225!predicate",
                  glusterfs = _js2n__-refsenv."_js2n__-:oneOf/228!predicate",
                  hostPath = _js2n__-refsenv."_js2n__-:oneOf/234!predicate",
                  iscsi = _js2n__-refsenv."_js2n__-:oneOf/235!predicate",
                  local = _js2n__-refsenv."_js2n__-:oneOf/247!predicate",
                  mountOptions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nfs = _js2n__-refsenv."_js2n__-:oneOf/249!predicate",
                  nodeAffinity = _js2n__-refsenv."_js2n__-:oneOf/361!predicate",
                  persistentVolumeReclaimPolicy =
                    _js2n__-prdslib.isType '"String",
                  photonPersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/282!predicate",
                  portworxVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/304!predicate",
                  quobyte = _js2n__-refsenv."_js2n__-:oneOf/308!predicate",
                  rbd = _js2n__-refsenv."_js2n__-:oneOf/309!predicate",
                  scaleIO = _js2n__-refsenv."_js2n__-:oneOf/324!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                  storageos = _js2n__-refsenv."_js2n__-:oneOf/347!predicate",
                  volumeAttributesClassName = _js2n__-prdslib.isType '"String",
                  volumeMode = _js2n__-prdslib.isType '"String",
                  vsphereVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/364!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/281!predicate"
        | doc "PersistentVolumeStatus is the current status of a persistent volume."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastPhaseTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  phase = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/282!predicate"
        | doc "Represents a Photon Controller persistent disk resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "pdID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  pdID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/283!predicate"
        | doc "Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Pod" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/298!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/299!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/284!predicate"
        | doc "Pod affinity is a group of inter pod affinity scheduling rules."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/365!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/285!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/285!predicate"
        | doc "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "topologyKey" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  matchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  mismatchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  topologyKey = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/286!predicate"
        | doc "Pod anti affinity is a group of inter pod anti affinity scheduling rules."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/365!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/285!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/287!predicate"
        | doc "PodCondition contains details for the current condition of this pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/288!predicate"
        | doc "PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nameservers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/289!predicate"
                        ],
                  searches =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/289!predicate"
        | doc "PodDNSConfigOption defines DNS resolver options of a pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/29!predicate"
        | doc "MatchCondition represents a condition which must be fulfilled for a request to be sent to a webhook."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/290!predicate"
        | doc "PodIP represents a single IP address allocated to the pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { ip = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/292!predicate"
        | doc "PodOS defines the OS parameters of a pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/293!predicate"
        | doc "PodReadinessGate contains the reference to a pod condition"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "conditionType" ],
              _js2n__-prdslib.records.record
                { conditionType = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/294!predicate"
        | doc "PodResourceClaim references exactly one ResourceClaim through a ClaimSource. It adds a name to it that uniquely identifies the ResourceClaim inside the Pod. Containers that need access to the ResourceClaim reference it with this name."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  source = _js2n__-refsenv."_js2n__-:oneOf/179!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/295!predicate"
        | doc "PodResourceClaimStatus is stored in the PodStatus for each PodResourceClaim which references a ResourceClaimTemplate. It stores the generated name for the corresponding ResourceClaim."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  resourceClaimName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/296!predicate"
        | doc "PodSchedulingGate is associated to a Pod to guard its scheduling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/297!predicate"
        | doc "PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsGroup = _js2n__-prdslib.isType 'Integer,
                  fsGroupChangePolicy = _js2n__-prdslib.isType '"String",
                  runAsGroup = _js2n__-prdslib.isType 'Integer,
                  runAsNonRoot = _js2n__-prdslib.isType '"Bool",
                  runAsUser = _js2n__-prdslib.isType 'Integer,
                  seLinuxOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/323!predicate",
                  seccompProfile =
                    _js2n__-refsenv."_js2n__-:oneOf/328!predicate",
                  supplementalGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType 'Integer)
                        ],
                  sysctls =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/349!predicate"
                        ],
                  windowsOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/366!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/298!predicate"
        | doc "PodSpec is a description of a pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "containers" ],
              _js2n__-prdslib.records.record
                {
                  activeDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  affinity = _js2n__-refsenv."_js2n__-:oneOf/166!predicate",
                  automountServiceAccountToken = _js2n__-prdslib.isType '"Bool",
                  containers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/192!predicate"
                        ],
                  dnsConfig = _js2n__-refsenv."_js2n__-:oneOf/288!predicate",
                  dnsPolicy = _js2n__-prdslib.isType '"String",
                  enableServiceLinks = _js2n__-prdslib.isType '"Bool",
                  ephemeralContainers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/214!predicate"
                        ],
                  hostAliases =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/232!predicate"
                        ],
                  hostIPC = _js2n__-prdslib.isType '"Bool",
                  hostNetwork = _js2n__-prdslib.isType '"Bool",
                  hostPID = _js2n__-prdslib.isType '"Bool",
                  hostUsers = _js2n__-prdslib.isType '"Bool",
                  hostname = _js2n__-prdslib.isType '"String",
                  imagePullSecrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/246!predicate"
                        ],
                  initContainers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/192!predicate"
                        ],
                  nodeName = _js2n__-prdslib.isType '"String",
                  nodeSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  os = _js2n__-refsenv."_js2n__-:oneOf/292!predicate",
                  overhead =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  preemptionPolicy = _js2n__-prdslib.isType '"String",
                  "priority" = _js2n__-prdslib.isType 'Integer,
                  priorityClassName = _js2n__-prdslib.isType '"String",
                  readinessGates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/293!predicate"
                        ],
                  resourceClaims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/294!predicate"
                        ],
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  runtimeClassName = _js2n__-prdslib.isType '"String",
                  schedulerName = _js2n__-prdslib.isType '"String",
                  schedulingGates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/296!predicate"
                        ],
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/297!predicate",
                  serviceAccount = _js2n__-prdslib.isType '"String",
                  serviceAccountName = _js2n__-prdslib.isType '"String",
                  setHostnameAsFQDN = _js2n__-prdslib.isType '"Bool",
                  shareProcessNamespace = _js2n__-prdslib.isType '"Bool",
                  subdomain = _js2n__-prdslib.isType '"String",
                  terminationGracePeriodSeconds =
                    _js2n__-prdslib.isType 'Integer,
                  tolerations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/352!predicate"
                        ],
                  topologySpreadConstraints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/355!predicate"
                        ],
                  volumes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/358!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/299!predicate"
        | doc "PodStatus represents information about the status of a pod. Status may trail the actual state of a system, especially if the node that hosts the pod cannot contact the control plane."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/287!predicate"
                        ],
                  containerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  ephemeralContainerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  hostIP = _js2n__-prdslib.isType '"String",
                  hostIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/233!predicate"
                        ],
                  initContainerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  message = _js2n__-prdslib.isType '"String",
                  nominatedNodeName = _js2n__-prdslib.isType '"String",
                  phase = _js2n__-prdslib.isType '"String",
                  podIP = _js2n__-prdslib.isType '"String",
                  podIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/290!predicate"
                        ],
                  qosClass = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  resize = _js2n__-prdslib.isType '"String",
                  resourceClaimStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/295!predicate"
                        ],
                  startTime = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/30!predicate"
        | doc "MatchResources decides whether to run the admission control policy on an object based on whether it meets the match criteria. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  excludeResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/31!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/31!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/300!predicate"
        | doc "PodTemplate describes a template for creating copies of a predefined pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodTemplate" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/302!predicate"
        | doc "PodTemplateSpec describes the data a pod should have when created from a template"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/298!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/303!predicate" =
        _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port", "protocol" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/304!predicate"
        | doc "PortworxVolumeSource represents a Portworx volume resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/305!predicate"
        | doc "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "preference", "weight" ],
              _js2n__-prdslib.records.record
                {
                  preference = _js2n__-refsenv."_js2n__-:oneOf/265!predicate",
                  weight = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/306!predicate"
        | doc "Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  exec = _js2n__-refsenv."_js2n__-:oneOf/220!predicate",
                  failureThreshold = _js2n__-prdslib.isType 'Integer,
                  grpc = _js2n__-refsenv."_js2n__-:oneOf/226!predicate",
                  httpGet = _js2n__-refsenv."_js2n__-:oneOf/230!predicate",
                  initialDelaySeconds = _js2n__-prdslib.isType 'Integer,
                  periodSeconds = _js2n__-prdslib.isType 'Integer,
                  successThreshold = _js2n__-prdslib.isType 'Integer,
                  tcpSocket = _js2n__-refsenv."_js2n__-:oneOf/350!predicate",
                  terminationGracePeriodSeconds =
                    _js2n__-prdslib.isType 'Integer,
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/307!predicate"
        | doc "Represents a projected volume source"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  sources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/362!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/308!predicate"
        | doc "Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "registry", "volume" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  registry = _js2n__-prdslib.isType '"String",
                  tenant = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                  volume = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/309!predicate"
        | doc "Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "image", "monitors" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  keyring = _js2n__-prdslib.isType '"String",
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  pool = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/31!predicate"
        | doc "NamedRuleWithOperations is a tuple of Operations and Resources with ResourceNames."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/310!predicate"
        | doc "Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "image", "monitors" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  keyring = _js2n__-prdslib.isType '"String",
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  pool = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/311!predicate"
        | doc "ReplicationController represents the configuration of a replication controller."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicationController" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/314!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/315!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/312!predicate"
        | doc "ReplicationControllerCondition describes the state of a replication controller at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/314!predicate"
        | doc "ReplicationControllerSpec is the specification of a replication controller."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/315!predicate"
        | doc "ReplicationControllerStatus represents the current status of a replication controller."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/312!predicate"
                        ],
                  fullyLabeledReplicas = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/316!predicate"
        | doc "ResourceClaim references one entry in PodSpec.ResourceClaims."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/317!predicate"
        | doc "ResourceFieldSelector represents container resources (cpu, memory) and their output format"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "resource" ],
              _js2n__-prdslib.records.record
                {
                  containerName = _js2n__-prdslib.isType '"String",
                  divisor = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  resource = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/318!predicate"
        | doc "ResourceQuota sets aggregate quota restrictions enforced per namespace"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceQuota" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/320!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/321!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/32!predicate"
        | doc "ParamKind is a tuple of Group Kind and Version."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/320!predicate"
        | doc "ResourceQuotaSpec defines the desired hard limits to enforce for Quota."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hard =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  scopeSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/326!predicate",
                  scopes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/321!predicate"
        | doc "ResourceQuotaStatus defines the enforced hard limits and observed use."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hard =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  used =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/322!predicate"
        | doc "ResourceRequirements describes the compute resource requirements."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  claims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/316!predicate"
                        ],
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  requests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/323!predicate"
        | doc "SELinuxOptions are the labels to be applied to the container"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  level = _js2n__-prdslib.isType '"String",
                  role = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/324!predicate"
        | doc "ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "gateway", "secretRef", "system" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  gateway = _js2n__-prdslib.isType '"String",
                  protectionDomain = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  sslEnabled = _js2n__-prdslib.isType '"Bool",
                  storageMode = _js2n__-prdslib.isType '"String",
                  storagePool = _js2n__-prdslib.isType '"String",
                  system = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/325!predicate"
        | doc "ScaleIOVolumeSource represents a persistent ScaleIO volume"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "gateway", "secretRef", "system" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  gateway = _js2n__-prdslib.isType '"String",
                  protectionDomain = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  sslEnabled = _js2n__-prdslib.isType '"Bool",
                  storageMode = _js2n__-prdslib.isType '"String",
                  storagePool = _js2n__-prdslib.isType '"String",
                  system = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/326!predicate"
        | doc "A scope selector represents the AND of the selectors represented by the scoped-resource selector requirements."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/327!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/327!predicate"
        | doc "A scoped-resource selector requirement is a selector that contains values, a scope name, and an operator that relates the scope name and values."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "operator", "scopeName" ],
              _js2n__-prdslib.records.record
                {
                  operator = _js2n__-prdslib.isType '"String",
                  scopeName = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/328!predicate"
        | doc "SeccompProfile defines a pod/container's seccomp profile settings. Only one profile source may be set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  localhostProfile = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/329!predicate"
        | doc "Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  data =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  immutable = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Secret" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  stringData =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/33!predicate"
        | doc "ParamRef describes how to locate the params to be used as input to expressions of rules applied by a policy binding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  parameterNotFoundAction = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/330!predicate"
        | doc m%"
          SecretEnvSource selects a Secret to populate the environment variables with.
          
          The contents of the target Secret's Data field will represent the key-value pairs as environment variables.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/331!predicate"
        | doc "SecretKeySelector selects a key of a Secret."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/333!predicate"
        | doc m%"
          Adapts a secret into a projected volume.
          
          The contents of the target Secret's Data field will be presented in a projected volume as files using the keys in the Data field as the file names. Note that this is identical to a secret volume source without the default mode.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/334!predicate"
        | doc "SecretReference represents a Secret Reference. It has enough information to retrieve secret in any namespace"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/335!predicate"
        | doc m%"
          Adapts a Secret into a volume.
          
          The contents of the target Secret's Data field will be presented in a volume as files using the keys in the Data field as the file names. Secret volumes support ownership management and SELinux relabeling.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  "optional" = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/336!predicate"
        | doc "SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allowPrivilegeEscalation = _js2n__-prdslib.isType '"Bool",
                  capabilities = _js2n__-refsenv."_js2n__-:oneOf/174!predicate",
                  privileged = _js2n__-prdslib.isType '"Bool",
                  procMount = _js2n__-prdslib.isType '"String",
                  readOnlyRootFilesystem = _js2n__-prdslib.isType '"Bool",
                  runAsGroup = _js2n__-prdslib.isType 'Integer,
                  runAsNonRoot = _js2n__-prdslib.isType '"Bool",
                  runAsUser = _js2n__-prdslib.isType 'Integer,
                  seLinuxOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/323!predicate",
                  seccompProfile =
                    _js2n__-refsenv."_js2n__-:oneOf/328!predicate",
                  windowsOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/366!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/337!predicate"
        | doc "Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Service" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/343!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/344!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/338!predicate"
        | doc "ServiceAccount binds together: * a name, understood by users, and perhaps by peripheral systems, for an identity * a principal that can be authenticated and authorized * a set of secrets"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  automountServiceAccountToken = _js2n__-prdslib.isType '"Bool",
                  imagePullSecrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/246!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceAccount" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  secrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/270!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/34!predicate"
        | doc "TypeChecking contains results of type checking the expressions in the ValidatingAdmissionPolicy"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  expressionWarnings =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/28!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/340!predicate"
        | doc "ServiceAccountTokenProjection represents a projected service account token volume. This projection can be used to insert a service account token into the pods runtime filesystem for use against APIs (Kubernetes API Server or otherwise)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  audience = _js2n__-prdslib.isType '"String",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/342!predicate"
        | doc "ServicePort contains information on service's port."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  nodePort = _js2n__-prdslib.isType 'Integer,
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                  targetPort = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/343!predicate"
        | doc "ServiceSpec describes the attributes that a user creates on a service."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allocateLoadBalancerNodePorts =
                    _js2n__-prdslib.isType '"Bool",
                  clusterIP = _js2n__-prdslib.isType '"String",
                  clusterIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  externalIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  externalName = _js2n__-prdslib.isType '"String",
                  externalTrafficPolicy = _js2n__-prdslib.isType '"String",
                  healthCheckNodePort = _js2n__-prdslib.isType 'Integer,
                  internalTrafficPolicy = _js2n__-prdslib.isType '"String",
                  ipFamilies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ipFamilyPolicy = _js2n__-prdslib.isType '"String",
                  loadBalancerClass = _js2n__-prdslib.isType '"String",
                  loadBalancerIP = _js2n__-prdslib.isType '"String",
                  loadBalancerSourceRanges =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/342!predicate"
                        ],
                  publishNotReadyAddresses = _js2n__-prdslib.isType '"Bool",
                  selector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  sessionAffinity = _js2n__-prdslib.isType '"String",
                  sessionAffinityConfig =
                    _js2n__-refsenv."_js2n__-:oneOf/345!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/344!predicate"
        | doc "ServiceStatus represents the current status of a service."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  loadBalancer = _js2n__-refsenv."_js2n__-:oneOf/245!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/345!predicate"
        | doc "SessionAffinityConfig represents the configurations of session affinity."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { clientIP = _js2n__-refsenv."_js2n__-:oneOf/180!predicate", }
                {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/346!predicate"
        | doc "SleepAction describes a \"sleep\" action."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "seconds" ],
              _js2n__-prdslib.records.record
                { seconds = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/347!predicate"
        | doc "Represents a StorageOS persistent volume resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  volumeName = _js2n__-prdslib.isType '"String",
                  volumeNamespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/348!predicate"
        | doc "Represents a StorageOS persistent volume resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  volumeName = _js2n__-prdslib.isType '"String",
                  volumeNamespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/349!predicate"
        | doc "Sysctl defines a kernel parameter to be set"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "value" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/35!predicate"
        | doc "ValidatingAdmissionPolicy describes the definition of an admission validation policy that accepts or rejects an object without changing it."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ValidatingAdmissionPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/40!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/41!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/350!predicate"
        | doc "TCPSocketAction describes an action based on opening a socket"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/351!predicate"
        | doc "The node this Taint is attached to has the \"effect\" on any pod that does not tolerate the Taint."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "effect", "key" ],
              _js2n__-prdslib.records.record
                {
                  effect = _js2n__-prdslib.isType '"String",
                  key = _js2n__-prdslib.isType '"String",
                  timeAdded = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/352!predicate"
        | doc "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  effect = _js2n__-prdslib.isType '"String",
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  tolerationSeconds = _js2n__-prdslib.isType 'Integer,
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/353!predicate"
        | doc "A topology selector requirement is a selector that matches given label. This is an alpha feature and may change in the future."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "values" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/354!predicate"
        | doc "A topology selector term represents the result of label queries. A null or empty topology selector term matches no objects. The requirements of them are ANDed. It provides a subset of functionality as NodeSelectorTerm. This is an alpha feature and may change in the future."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchLabelExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/353!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/355!predicate"
        | doc "TopologySpreadConstraint specifies how to spread matching pods among the given topology."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  matchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  maxSkew = _js2n__-prdslib.isType 'Integer,
                  minDomains = _js2n__-prdslib.isType 'Integer,
                  nodeAffinityPolicy = _js2n__-prdslib.isType '"String",
                  nodeTaintsPolicy = _js2n__-prdslib.isType '"String",
                  topologyKey = _js2n__-prdslib.isType '"String",
                  whenUnsatisfiable = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/356!predicate"
        | doc "TypedLocalObjectReference contains enough information to let you locate the typed referenced object inside the same namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/357!predicate" =
        _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/358!predicate"
        | doc "Volume represents a named volume in a pod that may be accessed by any container in the pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  awsElasticBlockStore =
                    _js2n__-refsenv."_js2n__-:oneOf/165!predicate",
                  azureDisk = _js2n__-refsenv."_js2n__-:oneOf/168!predicate",
                  azureFile = _js2n__-refsenv."_js2n__-:oneOf/170!predicate",
                  cephfs = _js2n__-refsenv."_js2n__-:oneOf/176!predicate",
                  cinder = _js2n__-refsenv."_js2n__-:oneOf/178!predicate",
                  configMap = _js2n__-refsenv."_js2n__-:oneOf/191!predicate",
                  csi = _js2n__-refsenv."_js2n__-:oneOf/173!predicate",
                  downwardAPI = _js2n__-refsenv."_js2n__-:oneOf/204!predicate",
                  emptyDir = _js2n__-refsenv."_js2n__-:oneOf/205!predicate",
                  ephemeral = _js2n__-refsenv."_js2n__-:oneOf/215!predicate",
                  fc = _js2n__-refsenv."_js2n__-:oneOf/221!predicate",
                  flexVolume = _js2n__-refsenv."_js2n__-:oneOf/223!predicate",
                  flocker = _js2n__-refsenv."_js2n__-:oneOf/224!predicate",
                  gcePersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/225!predicate",
                  gitRepo = _js2n__-refsenv."_js2n__-:oneOf/227!predicate",
                  glusterfs = _js2n__-refsenv."_js2n__-:oneOf/229!predicate",
                  hostPath = _js2n__-refsenv."_js2n__-:oneOf/234!predicate",
                  iscsi = _js2n__-refsenv."_js2n__-:oneOf/236!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  nfs = _js2n__-refsenv."_js2n__-:oneOf/249!predicate",
                  persistentVolumeClaim =
                    _js2n__-refsenv."_js2n__-:oneOf/278!predicate",
                  photonPersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/282!predicate",
                  portworxVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/304!predicate",
                  projected = _js2n__-refsenv."_js2n__-:oneOf/307!predicate",
                  quobyte = _js2n__-refsenv."_js2n__-:oneOf/308!predicate",
                  rbd = _js2n__-refsenv."_js2n__-:oneOf/310!predicate",
                  scaleIO = _js2n__-refsenv."_js2n__-:oneOf/325!predicate",
                  secret = _js2n__-refsenv."_js2n__-:oneOf/335!predicate",
                  storageos = _js2n__-refsenv."_js2n__-:oneOf/348!predicate",
                  vsphereVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/364!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/359!predicate"
        | doc "volumeDevice describes a mapping of a raw block device within a container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "devicePath", "name" ],
              _js2n__-prdslib.records.record
                {
                  devicePath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/36!predicate"
        | doc m%"
          ValidatingAdmissionPolicyBinding binds the ValidatingAdmissionPolicy with paramerized resources. ValidatingAdmissionPolicyBinding and parameter CRDs together define how cluster administrators configure policies for clusters.
          
          For a given admission request, each binding will cause its policy to be evaluated N times, where N is 1 for policies/bindings that don't use params, otherwise N is the number of parameters selected by the binding.
          
          The CEL expressions of a policy must have a computed CEL cost below the maximum CEL budget. Each evaluation of the policy is given an independent CEL cost budget. Adding/removing policies, bindings, or params can not affect whether a given (policy, binding, param) combination is within its own CEL budget.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/38!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/360!predicate"
        | doc "VolumeMount describes a mounting of a Volume within a container."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "mountPath", "name" ],
              _js2n__-prdslib.records.record
                {
                  mountPath = _js2n__-prdslib.isType '"String",
                  mountPropagation = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  subPath = _js2n__-prdslib.isType '"String",
                  subPathExpr = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/361!predicate"
        | doc "VolumeNodeAffinity defines constraints that limit what nodes this volume can be accessed from."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { required = _js2n__-refsenv."_js2n__-:oneOf/263!predicate", }
                {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/362!predicate"
        | doc "Projection that may be projected along with other supported volume types"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  clusterTrustBundle =
                    _js2n__-refsenv."_js2n__-:oneOf/181!predicate",
                  configMap = _js2n__-refsenv."_js2n__-:oneOf/190!predicate",
                  downwardAPI = _js2n__-refsenv."_js2n__-:oneOf/202!predicate",
                  secret = _js2n__-refsenv."_js2n__-:oneOf/333!predicate",
                  serviceAccountToken =
                    _js2n__-refsenv."_js2n__-:oneOf/340!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/363!predicate"
        | doc "VolumeResourceRequirements describes the storage resource requirements for a volume."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  requests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/364!predicate"
        | doc "Represents a vSphere volume resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumePath" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  storagePolicyID = _js2n__-prdslib.isType '"String",
                  storagePolicyName = _js2n__-prdslib.isType '"String",
                  volumePath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/365!predicate"
        | doc "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "podAffinityTerm", "weight" ],
              _js2n__-prdslib.records.record
                {
                  podAffinityTerm =
                    _js2n__-refsenv."_js2n__-:oneOf/285!predicate",
                  weight = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/366!predicate"
        | doc "WindowsSecurityContextOptions contain Windows-specific options and credentials."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  gmsaCredentialSpec = _js2n__-prdslib.isType '"String",
                  gmsaCredentialSpecName = _js2n__-prdslib.isType '"String",
                  hostProcess = _js2n__-prdslib.isType '"Bool",
                  runAsUserName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/367!predicate"
        | doc "Endpoint represents a single logical \"backend\" implementing a service."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "addresses" ],
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  conditions = _js2n__-refsenv."_js2n__-:oneOf/368!predicate",
                  deprecatedTopology =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  hints = _js2n__-refsenv."_js2n__-:oneOf/369!predicate",
                  hostname = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  targetRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  zone = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/368!predicate"
        | doc "EndpointConditions represents the current condition of an endpoint."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ready = _js2n__-prdslib.isType '"Bool",
                  serving = _js2n__-prdslib.isType '"Bool",
                  terminating = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/369!predicate"
        | doc "EndpointHints provides hints describing how an endpoint should be consumed."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  forZones =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/373!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/370!predicate"
        | doc "EndpointPort represents a Port used by an EndpointSlice"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/371!predicate"
        | doc "EndpointSlice represents a subset of the endpoints that implement a service. For a given service there may be multiple EndpointSlice objects, selected by labels, which must be joined to produce the full set of endpoints."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "addressType", "endpoints" ],
              _js2n__-prdslib.records.record
                {
                  addressType = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  endpoints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/367!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EndpointSlice" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/370!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/373!predicate"
        | doc "ForZone provides information about which zones should consume this endpoint."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/374!predicate"
        | doc "Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system. Events have a limited retention time and triggers and messages may evolve with time.  Event consumers should not rely on the timing of an event with a given Reason reflecting a consistent underlying trigger, or the continued existence of events with that Reason.  Events should be treated as informative, best-effort, supplemental data."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "eventTime" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  deprecatedCount = _js2n__-prdslib.isType 'Integer,
                  deprecatedFirstTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deprecatedLastTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deprecatedSource =
                    _js2n__-refsenv."_js2n__-:oneOf/219!predicate",
                  eventTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Event" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  note = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  regarding = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  related = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  reportingController = _js2n__-prdslib.isType '"String",
                  reportingInstance = _js2n__-prdslib.isType '"String",
                  series = _js2n__-refsenv."_js2n__-:oneOf/376!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/376!predicate"
        | doc "EventSeries contain information on series of events, i.e. thing that was/is happening continuously for some time. How often to update the EventSeries is up to the event reporters. The default event reporter in \"k8s.io/client-go/tools/events/event_broadcaster.go\" shows how this struct is updated on heartbeats and can guide customized reporter implementations."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "count", "lastObservedTime" ],
              _js2n__-prdslib.records.record
                {
                  count = _js2n__-prdslib.isType 'Integer,
                  lastObservedTime =
                    _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/377!predicate"
        | doc "ExemptPriorityLevelConfiguration describes the configurable aspects of the handling of exempt requests. In the mandatory exempt configuration object the values in the fields here can be modified by authorized users, unlike the rest of the `spec`."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/378!predicate"
        | doc "FlowDistinguisherMethod specifies the method of a flow distinguisher."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                { type = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/379!predicate"
        | doc "FlowSchema defines the schema of a group of flows. Note that a flow is made up of a set of inbound API requests with similar attributes and is identified by a pair of strings: the name of the FlowSchema and a \"flow distinguisher\"."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchema" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/382!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/383!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/38!predicate"
        | doc "ValidatingAdmissionPolicyBindingSpec is the specification of the ValidatingAdmissionPolicyBinding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchResources =
                    _js2n__-refsenv."_js2n__-:oneOf/30!predicate",
                  paramRef = _js2n__-refsenv."_js2n__-:oneOf/33!predicate",
                  policyName = _js2n__-prdslib.isType '"String",
                  validationActions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/380!predicate"
        | doc "FlowSchemaCondition describes conditions for a FlowSchema."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/382!predicate"
        | doc "FlowSchemaSpec describes how the FlowSchema's specification looks like."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "priorityLevelConfiguration" ],
              _js2n__-prdslib.records.record
                {
                  distinguisherMethod =
                    _js2n__-refsenv."_js2n__-:oneOf/378!predicate",
                  matchingPrecedence = _js2n__-prdslib.isType 'Integer,
                  priorityLevelConfiguration =
                    _js2n__-refsenv."_js2n__-:oneOf/392!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/388!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/383!predicate"
        | doc "FlowSchemaStatus represents the current state of a FlowSchema."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/380!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/384!predicate"
        | doc "GroupSubject holds detailed information for group-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/385!predicate"
        | doc "LimitResponse defines how to handle requests that can not be executed right now."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  queuing = _js2n__-refsenv."_js2n__-:oneOf/395!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/386!predicate"
        | doc m%"
          LimitedPriorityLevelConfiguration specifies how to handle requests that are subject to limits. It addresses two issues:
            - How are requests for this priority level limited?
            - What should be done with requests that exceed the limit?
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  borrowingLimitPercent = _js2n__-prdslib.isType 'Integer,
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  limitResponse =
                    _js2n__-refsenv."_js2n__-:oneOf/385!predicate",
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/387!predicate"
        | doc "NonResourcePolicyRule is a predicate that matches non-resource requests according to their verb and the target non-resource URL. A NonResourcePolicyRule matches a request if and only if both (a) at least one member of verbs matches the request and (b) at least one member of nonResourceURLs matches the request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nonResourceURLs", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/388!predicate"
        | doc "PolicyRulesWithSubjects prescribes a test that applies to a request to an apiserver. The test considers the subject making the request, the verb being requested, and the resource to be acted upon. This PolicyRulesWithSubjects matches a request if and only if both (a) at least one member of subjects matches the request and (b) at least one member of resourceRules or nonResourceRules matches the request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "subjects" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/387!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/396!predicate"
                        ],
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/398!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/389!predicate"
        | doc "PriorityLevelConfiguration represents the configuration of a priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityLevelConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/393!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/394!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/390!predicate"
        | doc "PriorityLevelConfigurationCondition defines the condition of priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/392!predicate"
        | doc "PriorityLevelConfigurationReference contains information that points to the \"request-priority\" being used."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/393!predicate"
        | doc "PriorityLevelConfigurationSpec specifies the configuration of a priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  exempt = _js2n__-refsenv."_js2n__-:oneOf/377!predicate",
                  limited = _js2n__-refsenv."_js2n__-:oneOf/386!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/394!predicate"
        | doc "PriorityLevelConfigurationStatus represents the current state of a \"request-priority\"."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/390!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/395!predicate"
        | doc "QueuingConfiguration holds the configuration parameters for queuing"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  handSize = _js2n__-prdslib.isType 'Integer,
                  queueLengthLimit = _js2n__-prdslib.isType 'Integer,
                  queues = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/396!predicate"
        | doc "ResourcePolicyRule is a predicate that matches some resource requests, testing the request's verb and the target resource. A ResourcePolicyRule matches a resource request if and only if: (a) at least one member of verbs matches the request, (b) at least one member of apiGroups matches the request, (c) at least one member of resources matches the request, and (d) either (d1) the request does not specify a namespace (i.e., `Namespace==\"\"`) and clusterScope is true or (d2) the request specifies a namespace and least one member of namespaces matches the request's namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiGroups", "resources", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clusterScope = _js2n__-prdslib.isType '"Bool",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/397!predicate"
        | doc "ServiceAccountSubject holds detailed information for service-account-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/398!predicate"
        | doc "Subject matches the originator of a request, as identified by the request authentication system. There are three ways of matching an originator; by user, group, or service account."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-refsenv."_js2n__-:oneOf/384!predicate",
                  kind = _js2n__-prdslib.isType '"String",
                  serviceAccount =
                    _js2n__-refsenv."_js2n__-:oneOf/397!predicate",
                  user = _js2n__-refsenv."_js2n__-:oneOf/399!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/399!predicate"
        | doc "UserSubject holds detailed information for user-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/4!predicate"
        | doc "RuleWithOperations is a tuple of Operations and Resources. It is recommended to make sure that all the tuple expansions are valid."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/40!predicate"
        | doc "ValidatingAdmissionPolicySpec is the specification of the desired behavior of the AdmissionPolicy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  auditAnnotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/27!predicate"
                        ],
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/29!predicate"
                        ],
                  matchConstraints =
                    _js2n__-refsenv."_js2n__-:oneOf/30!predicate",
                  paramKind = _js2n__-refsenv."_js2n__-:oneOf/32!predicate",
                  validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/42!predicate"
                        ],
                  variables =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/43!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/400!predicate"
        | doc "ExemptPriorityLevelConfiguration describes the configurable aspects of the handling of exempt requests. In the mandatory exempt configuration object the values in the fields here can be modified by authorized users, unlike the rest of the `spec`."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/401!predicate"
        | doc "FlowDistinguisherMethod specifies the method of a flow distinguisher."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                { type = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/402!predicate"
        | doc "FlowSchema defines the schema of a group of flows. Note that a flow is made up of a set of inbound API requests with similar attributes and is identified by a pair of strings: the name of the FlowSchema and a \"flow distinguisher\"."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchema" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/405!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/406!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/403!predicate"
        | doc "FlowSchemaCondition describes conditions for a FlowSchema."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/405!predicate"
        | doc "FlowSchemaSpec describes how the FlowSchema's specification looks like."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "priorityLevelConfiguration" ],
              _js2n__-prdslib.records.record
                {
                  distinguisherMethod =
                    _js2n__-refsenv."_js2n__-:oneOf/401!predicate",
                  matchingPrecedence = _js2n__-prdslib.isType 'Integer,
                  priorityLevelConfiguration =
                    _js2n__-refsenv."_js2n__-:oneOf/415!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/411!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/406!predicate"
        | doc "FlowSchemaStatus represents the current state of a FlowSchema."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/403!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/407!predicate"
        | doc "GroupSubject holds detailed information for group-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/408!predicate"
        | doc "LimitResponse defines how to handle requests that can not be executed right now."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  queuing = _js2n__-refsenv."_js2n__-:oneOf/418!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/409!predicate"
        | doc m%"
          LimitedPriorityLevelConfiguration specifies how to handle requests that are subject to limits. It addresses two issues:
            - How are requests for this priority level limited?
            - What should be done with requests that exceed the limit?
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  borrowingLimitPercent = _js2n__-prdslib.isType 'Integer,
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  limitResponse =
                    _js2n__-refsenv."_js2n__-:oneOf/408!predicate",
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/41!predicate"
        | doc "ValidatingAdmissionPolicyStatus represents the status of an admission validation policy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  typeChecking = _js2n__-refsenv."_js2n__-:oneOf/34!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/410!predicate"
        | doc "NonResourcePolicyRule is a predicate that matches non-resource requests according to their verb and the target non-resource URL. A NonResourcePolicyRule matches a request if and only if both (a) at least one member of verbs matches the request and (b) at least one member of nonResourceURLs matches the request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nonResourceURLs", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/411!predicate"
        | doc "PolicyRulesWithSubjects prescribes a test that applies to a request to an apiserver. The test considers the subject making the request, the verb being requested, and the resource to be acted upon. This PolicyRulesWithSubjects matches a request if and only if both (a) at least one member of subjects matches the request and (b) at least one member of resourceRules or nonResourceRules matches the request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "subjects" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/410!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/419!predicate"
                        ],
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/421!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/412!predicate"
        | doc "PriorityLevelConfiguration represents the configuration of a priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityLevelConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/416!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/417!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/413!predicate"
        | doc "PriorityLevelConfigurationCondition defines the condition of priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/415!predicate"
        | doc "PriorityLevelConfigurationReference contains information that points to the \"request-priority\" being used."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/416!predicate"
        | doc "PriorityLevelConfigurationSpec specifies the configuration of a priority level."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  exempt = _js2n__-refsenv."_js2n__-:oneOf/400!predicate",
                  limited = _js2n__-refsenv."_js2n__-:oneOf/409!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/417!predicate"
        | doc "PriorityLevelConfigurationStatus represents the current state of a \"request-priority\"."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/413!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/418!predicate"
        | doc "QueuingConfiguration holds the configuration parameters for queuing"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  handSize = _js2n__-prdslib.isType 'Integer,
                  queueLengthLimit = _js2n__-prdslib.isType 'Integer,
                  queues = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/419!predicate"
        | doc "ResourcePolicyRule is a predicate that matches some resource requests, testing the request's verb and the target resource. A ResourcePolicyRule matches a resource request if and only if: (a) at least one member of verbs matches the request, (b) at least one member of apiGroups matches the request, (c) at least one member of resources matches the request, and (d) either (d1) the request does not specify a namespace (i.e., `Namespace==\"\"`) and clusterScope is true or (d2) the request specifies a namespace and least one member of namespaces matches the request's namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiGroups", "resources", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clusterScope = _js2n__-prdslib.isType '"Bool",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/42!predicate"
        | doc "Validation specifies the CEL expression which is used to apply the validation."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/420!predicate"
        | doc "ServiceAccountSubject holds detailed information for service-account-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/421!predicate"
        | doc "Subject matches the originator of a request, as identified by the request authentication system. There are three ways of matching an originator; by user, group, or service account."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-refsenv."_js2n__-:oneOf/407!predicate",
                  kind = _js2n__-prdslib.isType '"String",
                  serviceAccount =
                    _js2n__-refsenv."_js2n__-:oneOf/420!predicate",
                  user = _js2n__-refsenv."_js2n__-:oneOf/422!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/422!predicate"
        | doc "UserSubject holds detailed information for user-kind subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/423!predicate"
        | doc "HTTPIngressPath associates a path with a backend. Incoming urls matching the path are forwarded to the backend."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "backend", "pathType" ],
              _js2n__-prdslib.records.record
                {
                  backend = _js2n__-refsenv."_js2n__-:oneOf/427!predicate",
                  path = _js2n__-prdslib.isType '"String",
                  pathType = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/424!predicate"
        | doc "HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://<host>/<path>?<searchpart> -> backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last '/' and before the first '?' or '#'."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "paths" ],
              _js2n__-prdslib.records.record
                {
                  paths =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/423!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/425!predicate"
        | doc "IPBlock describes a particular CIDR (Ex. \"192.168.1.0/24\",\"2001:db8::/64\") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "cidr" ],
              _js2n__-prdslib.records.record
                {
                  cidr = _js2n__-prdslib.isType '"String",
                  except =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/426!predicate"
        | doc "Ingress is a collection of rules that allow inbound connections to reach the endpoints defined by a backend. An Ingress can be configured to give services externally-reachable urls, load balance traffic, terminate SSL, offer name based virtual hosting etc."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Ingress" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/438!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/439!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/427!predicate"
        | doc "IngressBackend describes all endpoints for a given service and port."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resource = _js2n__-refsenv."_js2n__-:oneOf/356!predicate",
                  service = _js2n__-refsenv."_js2n__-:oneOf/437!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/428!predicate"
        | doc "IngressClass represents the class of the Ingress, referenced by the Ingress Spec. The `ingressclass.kubernetes.io/is-default-class` annotation can be used to indicate that an IngressClass should be considered default. When a single IngressClass resource has this annotation set to true, new Ingress resources without a class specified will be assigned this default class."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IngressClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/431!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/43!predicate"
        | doc "Variable is the definition of a variable that is used for composition. A variable is defined as a named expression."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/430!predicate"
        | doc "IngressClassParametersReference identifies an API object. This can be used to specify a cluster or namespace-scoped resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/431!predicate"
        | doc "IngressClassSpec provides information about the class of an Ingress."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  controller = _js2n__-prdslib.isType '"String",
                  parameters = _js2n__-refsenv."_js2n__-:oneOf/430!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/433!predicate"
        | doc "IngressLoadBalancerIngress represents the status of a load-balancer ingress point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/435!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/434!predicate"
        | doc "IngressLoadBalancerStatus represents the status of a load-balancer."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/433!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/435!predicate"
        | doc "IngressPortStatus represents the error condition of a service port"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port", "protocol" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/436!predicate"
        | doc "IngressRule represents the rules mapping the paths under a specified host to the related backend services. Incoming requests are first evaluated for a host match, then routed to the backend associated with the matching IngressRuleValue."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  http = _js2n__-refsenv."_js2n__-:oneOf/424!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/437!predicate"
        | doc "IngressServiceBackend references a Kubernetes Service as a Backend."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/448!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/438!predicate"
        | doc "IngressSpec describes the Ingress the user wishes to exist."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultBackend =
                    _js2n__-refsenv."_js2n__-:oneOf/427!predicate",
                  ingressClassName = _js2n__-prdslib.isType '"String",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/436!predicate"
                        ],
                  tls =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/440!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/439!predicate"
        | doc "IngressStatus describe the current state of the Ingress."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  loadBalancer = _js2n__-refsenv."_js2n__-:oneOf/434!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/44!predicate"
        | doc "An API server instance reports the version it can decode and the version it encodes objects to when persisting objects in the backend."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiServerID = _js2n__-prdslib.isType '"String",
                  decodableVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  encodingVersion = _js2n__-prdslib.isType '"String",
                  servedVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/440!predicate"
        | doc "IngressTLS describes the transport layer security associated with an ingress."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hosts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  secretName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/441!predicate"
        | doc "NetworkPolicy describes what network traffic is allowed for a set of Pods"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "NetworkPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/447!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/442!predicate"
        | doc "NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/446!predicate"
                        ],
                  to =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/445!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/443!predicate"
        | doc "NetworkPolicyIngressRule describes a particular set of traffic that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and from."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  from =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/445!predicate"
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/446!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/445!predicate"
        | doc "NetworkPolicyPeer describes a peer to allow traffic to/from. Only certain combinations of fields are allowed"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ipBlock = _js2n__-refsenv."_js2n__-:oneOf/425!predicate",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  podSelector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/446!predicate"
        | doc "NetworkPolicyPort describes a port to allow traffic on"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  endPort = _js2n__-prdslib.isType 'Integer,
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/447!predicate"
        | doc "NetworkPolicySpec provides the specification of a NetworkPolicy"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "podSelector" ],
              _js2n__-prdslib.records.record
                {
                  egress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/442!predicate"
                        ],
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/443!predicate"
                        ],
                  podSelector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  policyTypes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/448!predicate"
        | doc "ServiceBackendPort is the service port being referenced."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  number = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/449!predicate"
        | doc "IPAddress represents a single IP of a single IP Family. The object is designed to be used by APIs that operate on IP addresses. The object is used by the Service core API for allocation of IP addresses. An IP address can be represented in different formats, to guarantee the uniqueness of the IP, the name of the object is the IP address in canonical format, four decimal digits separated by dots suppressing leading zeros for IPv4 and the representation defined by RFC 5952 for IPv6. Valid: 192.168.1.5 or 2001:db8::1 or 2001:db8:aaaa:bbbb:cccc:dddd:eeee:1 Invalid: 10.01.2.3 or 2001:db8:0:0:0::1"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IPAddress" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/451!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/45!predicate"
        | doc "Storage version of a specific resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec", "status" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageVersion" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/48!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/49!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/451!predicate"
        | doc "IPAddressSpec describe the attributes in an IP Address."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { parentRef = _js2n__-refsenv."_js2n__-:oneOf/452!predicate", }
                {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/452!predicate"
        | doc "ParentReference describes a reference to a parent object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/453!predicate"
        | doc "ServiceCIDR defines a range of IP addresses using CIDR format (e.g. 192.168.0.0/24 or 2001:db2::/64). This range is used to allocate ClusterIPs to Service objects."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceCIDR" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/455!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/456!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/455!predicate"
        | doc "ServiceCIDRSpec define the CIDRs the user wants to use for allocating ClusterIPs for Services."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  cidrs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/456!predicate"
        | doc "ServiceCIDRStatus describes the current state of the ServiceCIDR."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/457!predicate"
        | doc "Overhead structure represents the resource overhead associated with running a pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  podFixed =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/458!predicate"
        | doc "RuntimeClass defines a class of container runtime supported in the cluster. The RuntimeClass is used to determine which container runtime is used to run all containers in a pod. RuntimeClasses are manually defined by a user or cluster provisioner, and referenced in the PodSpec. The Kubelet is responsible for resolving the RuntimeClassName reference before running the pod.  For more details, see https://kubernetes.io/docs/concepts/containers/runtime-class/"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "handler" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  handler = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RuntimeClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  overhead = _js2n__-refsenv."_js2n__-:oneOf/457!predicate",
                  scheduling = _js2n__-refsenv."_js2n__-:oneOf/460!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/46!predicate"
        | doc "Describes the state of the storageVersion at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "reason", "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/460!predicate"
        | doc "Scheduling specifies the scheduling constraints for nodes supporting a RuntimeClass."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nodeSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  tolerations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/352!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/462!predicate"
        | doc "PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodDisruptionBudget" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/464!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/465!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/464!predicate"
        | doc "PodDisruptionBudgetSpec is a description of a PodDisruptionBudget."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  minAvailable = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  unhealthyPodEvictionPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/465!predicate"
        | doc "PodDisruptionBudgetStatus represents information about the status of a PodDisruptionBudget. Status may trail the actual state of a system."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "currentHealthy",
                  "desiredHealthy",
                  "disruptionsAllowed",
                  "expectedPods"
                ],
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  currentHealthy = _js2n__-prdslib.isType 'Integer,
                  desiredHealthy = _js2n__-prdslib.isType 'Integer,
                  disruptedPods =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/566!predicate"
                        ],
                  disruptionsAllowed = _js2n__-prdslib.isType 'Integer,
                  expectedPods = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/466!predicate"
        | doc "AggregationRule describes how to locate ClusterRoles to aggregate into the ClusterRole"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  clusterRoleSelectors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/553!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/467!predicate"
        | doc "ClusterRole is a cluster level, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding or ClusterRoleBinding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  aggregationRule =
                    _js2n__-refsenv."_js2n__-:oneOf/466!predicate",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRole" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/471!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/468!predicate"
        | doc "ClusterRoleBinding references a ClusterRole, but not contain it.  It can reference a ClusterRole in the global namespace, and adds who information via Subject."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "roleRef" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRoleBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  roleRef = _js2n__-refsenv."_js2n__-:oneOf/476!predicate",
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/477!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/471!predicate"
        | doc "PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/472!predicate"
        | doc "Role is a namespaced, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Role" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/471!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/473!predicate"
        | doc "RoleBinding references a role, but does not contain it.  It can reference a Role in the same namespace or a ClusterRole in the global namespace. It adds who information via Subjects and namespace information by which namespace it exists in.  RoleBindings in a given namespace only have effect in that namespace."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "roleRef" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RoleBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  roleRef = _js2n__-refsenv."_js2n__-:oneOf/476!predicate",
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/477!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/476!predicate"
        | doc "RoleRef contains information that points to the role being used"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "apiGroup", "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/477!predicate"
        | doc "Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/478!predicate"
        | doc "AllocationResult contains attributes of an allocated resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  availableOnNodes =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                  resourceHandles =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/496!predicate"
                        ],
                  shareable = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/479!predicate"
        | doc m%"
          PodSchedulingContext objects hold information that is needed to schedule a Pod with ResourceClaims that use "WaitForFirstConsumer" allocation mode.
          
          This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodSchedulingContext" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/481!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/482!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/48!predicate"
        | doc "StorageVersionSpec is an empty spec."
        = _js2n__-prdslib.isType 'Record,
      "_js2n__-:oneOf/481!predicate"
        | doc "PodSchedulingContextSpec describes where resources for the Pod are needed."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  potentialNodes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  selectedNode = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/482!predicate"
        | doc "PodSchedulingContextStatus describes where resources for the Pod can be allocated."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceClaims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/487!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/483!predicate"
        | doc m%"
          ResourceClaim describes which resources are needed by a resource consumer. Its status tracks whether the resource has been allocated and what the resulting attributes are.
          
          This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaim" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/488!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/489!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/484!predicate"
        | doc "ResourceClaimConsumerReference contains enough information to let you locate the consumer of a ResourceClaim. The user must be a resource in the same namespace as the ResourceClaim."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "resource", "uid" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/486!predicate"
        | doc "ResourceClaimParametersReference contains enough information to let you locate the parameters for a ResourceClaim. The object must be in the same namespace as the ResourceClaim."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/487!predicate"
        | doc "ResourceClaimSchedulingStatus contains information about one particular ResourceClaim with \"WaitForFirstConsumer\" allocation mode."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  unsuitableNodes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/488!predicate"
        | doc "ResourceClaimSpec defines how a resource is to be allocated."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "resourceClassName" ],
              _js2n__-prdslib.records.record
                {
                  allocationMode = _js2n__-prdslib.isType '"String",
                  parametersRef =
                    _js2n__-refsenv."_js2n__-:oneOf/486!predicate",
                  resourceClassName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/489!predicate"
        | doc "ResourceClaimStatus tracks whether the resource has been allocated and what the resulting attributes are."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allocation = _js2n__-refsenv."_js2n__-:oneOf/478!predicate",
                  deallocationRequested = _js2n__-prdslib.isType '"Bool",
                  driverName = _js2n__-prdslib.isType '"String",
                  reservedFor =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/484!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/49!predicate"
        | doc "API server instances report the versions they can decode and the version they encode objects to when persisting objects in the backend."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  commonEncodingVersion = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/46!predicate"
                        ],
                  storageVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/44!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/490!predicate"
        | doc "ResourceClaimTemplate is used to produce ResourceClaim objects."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaimTemplate" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/492!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/492!predicate"
        | doc "ResourceClaimTemplateSpec contains the metadata and fields for a ResourceClaim."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/488!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/493!predicate"
        | doc m%"
          ResourceClass is used by administrators to influence how resources are allocated.
          
          This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driverName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  parametersRef =
                    _js2n__-refsenv."_js2n__-:oneOf/495!predicate",
                  suitableNodes =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/495!predicate"
        | doc "ResourceClassParametersReference contains enough information to let you locate the parameters for a ResourceClass."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/496!predicate"
        | doc "ResourceHandle holds opaque resource data for processing by a specific kubelet plugin."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  data = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/497!predicate"
        | doc "PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "value" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  description = _js2n__-prdslib.isType '"String",
                  globalDefault = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  preemptionPolicy = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/499!predicate"
        | doc "CSIDriver captures information about a Container Storage Interface (CSI) volume driver deployed on the cluster. Kubernetes attach detach controller uses this object to determine whether attach is required. Kubelet uses this object to determine whether pod information needs to be passed on mount. CSIDriver objects are non-namespaced."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIDriver" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/501!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/5!predicate"
        | doc "ServiceReference holds a reference to Service.legacy.k8s.io"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/50!predicate"
        | doc "ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "revision" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  data = _js2n__-refsenv."_js2n__-:oneOf/568!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ControllerRevision" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  revision = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/501!predicate"
        | doc "CSIDriverSpec is the specification of a CSIDriver."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  attachRequired = _js2n__-prdslib.isType '"Bool",
                  fsGroupPolicy = _js2n__-prdslib.isType '"String",
                  podInfoOnMount = _js2n__-prdslib.isType '"Bool",
                  requiresRepublish = _js2n__-prdslib.isType '"Bool",
                  seLinuxMount = _js2n__-prdslib.isType '"Bool",
                  storageCapacity = _js2n__-prdslib.isType '"Bool",
                  tokenRequests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/510!predicate"
                        ],
                  volumeLifecycleModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/502!predicate"
        | doc "CSINode holds information about all CSI drivers installed on a node. CSI drivers do not need to create the CSINode object directly. As long as they use the node-driver-registrar sidecar container, the kubelet will automatically populate the CSINode object for the CSI driver as part of kubelet plugin registration. CSINode has the same name as a node. If the object is missing, it means either there are no CSI Drivers available on the node, or the Kubelet version is low enough that it doesn't create this object. CSINode has an OwnerReference that points to the corresponding node object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSINode" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/505!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/503!predicate"
        | doc "CSINodeDriver holds information about the specification of one CSI driver installed on a node"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "nodeID" ],
              _js2n__-prdslib.records.record
                {
                  allocatable = _js2n__-refsenv."_js2n__-:oneOf/517!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  nodeID = _js2n__-prdslib.isType '"String",
                  topologyKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/505!predicate"
        | doc "CSINodeSpec holds information about the specification of all CSI drivers installed on a node"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "drivers" ],
              _js2n__-prdslib.records.record
                {
                  drivers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/503!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/506!predicate"
        | doc m%"
          CSIStorageCapacity stores the result of one CSI GetCapacity call. For a given StorageClass, this describes the available capacity in a particular topology segment.  This can be used when considering where to instantiate new PersistentVolumes.
          
          For example this can express things like: - StorageClass "standard" has "1234 GiB" available in "topology.kubernetes.io/zone=us-east1" - StorageClass "localssd" has "10 GiB" available in "kubernetes.io/hostname=knode-abc123"
          
          The following three cases all imply that no capacity is available for a certain combination: - no object exists with suitable topology and storage class name - such an object exists, but the capacity is unset - such an object exists, but the capacity is zero
          
          The producer of these objects can decide which approach is more suitable.
          
          They are consumed by the kube-scheduler when a CSI driver opts into capacity-aware scheduling with CSIDriverSpec.StorageCapacity. The scheduler compares the MaximumVolumeSize against the requested size of pending volumes to filter out unsuitable nodes. If MaximumVolumeSize is unset, it falls back to a comparison against the less precise Capacity. If that is also unset, the scheduler assumes that capacity is insufficient and tries some other node.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "storageClassName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  capacity = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIStorageCapacity" ]
                        ],
                  maximumVolumeSize =
                    _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  nodeTopology = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/508!predicate"
        | doc m%"
          StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.
          
          StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "provisioner" ],
              _js2n__-prdslib.records.record
                {
                  allowVolumeExpansion = _js2n__-prdslib.isType '"Bool",
                  allowedTopologies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/354!predicate"
                        ],
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  mountOptions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  parameters =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  provisioner = _js2n__-prdslib.isType '"String",
                  reclaimPolicy = _js2n__-prdslib.isType '"String",
                  volumeBindingMode = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/510!predicate"
        | doc "TokenRequest contains parameters of a service account token."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "audience" ],
              _js2n__-prdslib.records.record
                {
                  audience = _js2n__-prdslib.isType '"String",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/511!predicate"
        | doc m%"
          VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.
          
          VolumeAttachment objects are non-namespaced.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttachment" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/514!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/515!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/513!predicate"
        | doc "VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  inlineVolumeSpec =
                    _js2n__-refsenv."_js2n__-:oneOf/280!predicate",
                  persistentVolumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/514!predicate"
        | doc "VolumeAttachmentSpec is the specification of a VolumeAttachment request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "attacher", "nodeName", "source" ],
              _js2n__-prdslib.records.record
                {
                  attacher = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  source = _js2n__-refsenv."_js2n__-:oneOf/513!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/515!predicate"
        | doc "VolumeAttachmentStatus is the status of a VolumeAttachment request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "attached" ],
              _js2n__-prdslib.records.record
                {
                  attachError = _js2n__-refsenv."_js2n__-:oneOf/516!predicate",
                  attached = _js2n__-prdslib.isType '"Bool",
                  attachmentMetadata =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  detachError = _js2n__-refsenv."_js2n__-:oneOf/516!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/516!predicate"
        | doc "VolumeError captures an error encountered during a volume operation."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  message = _js2n__-prdslib.isType '"String",
                  time = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/517!predicate"
        | doc "VolumeNodeResources is a set of resource limits for scheduling of volumes."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { count = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/518!predicate"
        | doc "VolumeAttributesClass represents a specification of mutable volume attributes defined by the CSI driver. The class can be specified during dynamic provisioning of PersistentVolumeClaims, and changed in the PersistentVolumeClaim spec after provisioning."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driverName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttributesClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  parameters =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/52!predicate"
        | doc "DaemonSet represents the configuration of a daemon set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DaemonSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/55!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/56!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/520!predicate"
        | doc "CustomResourceColumnDefinition specifies a column for server side printing."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "jsonPath", "name", "type" ],
              _js2n__-prdslib.records.record
                {
                  description = _js2n__-prdslib.isType '"String",
                  format = _js2n__-prdslib.isType '"String",
                  jsonPath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "priority" = _js2n__-prdslib.isType 'Integer,
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/521!predicate"
        | doc "CustomResourceConversion describes how to convert different versions of a CR."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "strategy" ],
              _js2n__-prdslib.records.record
                {
                  strategy = _js2n__-prdslib.isType '"String",
                  webhook = _js2n__-refsenv."_js2n__-:oneOf/542!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/522!predicate"
        | doc "CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CustomResourceDefinition" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/526!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/527!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/523!predicate"
        | doc "CustomResourceDefinitionCondition contains details for the current condition of this pod."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/525!predicate"
        | doc "CustomResourceDefinitionNames indicates the names to serve this CustomResourceDefinition"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "plural" ],
              _js2n__-prdslib.records.record
                {
                  categories =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  kind = _js2n__-prdslib.isType '"String",
                  listKind = _js2n__-prdslib.isType '"String",
                  plural = _js2n__-prdslib.isType '"String",
                  shortNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  singular = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/526!predicate"
        | doc "CustomResourceDefinitionSpec describes how a user wants their resource to appear"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "group", "names", "scope", "versions" ],
              _js2n__-prdslib.records.record
                {
                  conversion = _js2n__-refsenv."_js2n__-:oneOf/521!predicate",
                  group = _js2n__-prdslib.isType '"String",
                  names = _js2n__-refsenv."_js2n__-:oneOf/525!predicate",
                  preserveUnknownFields = _js2n__-prdslib.isType '"Bool",
                  scope = _js2n__-prdslib.isType '"String",
                  versions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/528!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/527!predicate"
        | doc "CustomResourceDefinitionStatus indicates the state of the CustomResourceDefinition"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  acceptedNames =
                    _js2n__-refsenv."_js2n__-:oneOf/525!predicate",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/523!predicate"
                        ],
                  storedVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/528!predicate"
        | doc "CustomResourceDefinitionVersion describes a version for CRD."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "served", "storage" ],
              _js2n__-prdslib.records.record
                {
                  additionalPrinterColumns =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/520!predicate"
                        ],
                  deprecated = _js2n__-prdslib.isType '"Bool",
                  deprecationWarning = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  schema = _js2n__-refsenv."_js2n__-:oneOf/532!predicate",
                  served = _js2n__-prdslib.isType '"Bool",
                  storage = _js2n__-prdslib.isType '"Bool",
                  subresources = _js2n__-refsenv."_js2n__-:oneOf/531!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/529!predicate"
        | doc "CustomResourceSubresourceScale defines how to serve the scale subresource for CustomResources."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "specReplicasPath", "statusReplicasPath" ],
              _js2n__-prdslib.records.record
                {
                  labelSelectorPath = _js2n__-prdslib.isType '"String",
                  specReplicasPath = _js2n__-prdslib.isType '"String",
                  statusReplicasPath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/53!predicate"
        | doc "DaemonSetCondition describes the state of a DaemonSet at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/530!predicate"
        | doc "CustomResourceSubresourceStatus defines how to serve the status subresource for CustomResources. Status is represented by the `.status` JSON path inside of a CustomResource. When set, * exposes a /status subresource for the custom resource * PUT requests to the /status subresource take a custom resource object, and ignore changes to anything except the status stanza * PUT/POST/PATCH requests to the custom resource ignore changes to the status stanza"
        = _js2n__-prdslib.isType 'Record,
      "_js2n__-:oneOf/531!predicate"
        | doc "CustomResourceSubresources defines the status and scale subresources for CustomResources."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  scale = _js2n__-refsenv."_js2n__-:oneOf/529!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/530!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/532!predicate"
        | doc "CustomResourceValidation is a list of validation methods for CustomResources."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  openAPIV3Schema =
                    _js2n__-refsenv."_js2n__-:oneOf/535!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/533!predicate"
        | doc "ExternalDocumentation allows referencing an external resource for extended documentation."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  description = _js2n__-prdslib.isType '"String",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/534!predicate"
        | doc "JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil."
        = _js2n__-prdslib.always,
      "_js2n__-:oneOf/535!predicate"
        | doc "JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/)."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  "$ref" = _js2n__-prdslib.isType '"String",
                  "$schema" = _js2n__-prdslib.isType '"String",
                  additionalItems =
                    _js2n__-refsenv."_js2n__-:oneOf/537!predicate",
                  additionalProperties =
                    _js2n__-refsenv."_js2n__-:oneOf/537!predicate",
                  allOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  anyOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  "default" = _js2n__-refsenv."_js2n__-:oneOf/534!predicate",
                  definitions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  dependencies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/538!predicate"
                        ],
                  description = _js2n__-prdslib.isType '"String",
                  enum =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/534!predicate"
                        ],
                  example = _js2n__-refsenv."_js2n__-:oneOf/534!predicate",
                  exclusiveMaximum = _js2n__-prdslib.isType '"Bool",
                  exclusiveMinimum = _js2n__-prdslib.isType '"Bool",
                  externalDocs = _js2n__-refsenv."_js2n__-:oneOf/533!predicate",
                  format = _js2n__-prdslib.isType '"String",
                  id = _js2n__-prdslib.isType '"String",
                  items = _js2n__-refsenv."_js2n__-:oneOf/536!predicate",
                  maxItems = _js2n__-prdslib.isType 'Integer,
                  maxLength = _js2n__-prdslib.isType 'Integer,
                  maxProperties = _js2n__-prdslib.isType 'Integer,
                  maximum = _js2n__-prdslib.isType '"Number",
                  minItems = _js2n__-prdslib.isType 'Integer,
                  minLength = _js2n__-prdslib.isType 'Integer,
                  minProperties = _js2n__-prdslib.isType 'Integer,
                  minimum = _js2n__-prdslib.isType '"Number",
                  multipleOf = _js2n__-prdslib.isType '"Number",
                  not = _js2n__-refsenv."_js2n__-:oneOf/535!predicate",
                  nullable = _js2n__-prdslib.isType '"Bool",
                  oneOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  pattern = _js2n__-prdslib.isType '"String",
                  patternProperties =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  properties =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  required =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  title = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                  uniqueItems = _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-embedded-resource =
                    _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-int-or-string = _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-list-map-keys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  x-kubernetes-list-type = _js2n__-prdslib.isType '"String",
                  x-kubernetes-map-type = _js2n__-prdslib.isType '"String",
                  x-kubernetes-preserve-unknown-fields =
                    _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/540!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/536!predicate"
        | doc "JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes."
        = _js2n__-prdslib.always,
      "_js2n__-:oneOf/537!predicate"
        | doc "JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property."
        = _js2n__-prdslib.always,
      "_js2n__-:oneOf/538!predicate"
        | doc "JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array."
        = _js2n__-prdslib.always,
      "_js2n__-:oneOf/539!predicate"
        | doc "ServiceReference holds a reference to Service.legacy.k8s.io"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/540!predicate"
        | doc "ValidationRule describes a validation rule written in the CEL expression language."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "rule" ],
              _js2n__-prdslib.records.record
                {
                  fieldPath = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  optionalOldSelf = _js2n__-prdslib.isType '"Bool",
                  reason = _js2n__-prdslib.isType '"String",
                  rule = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/541!predicate"
        | doc "WebhookClientConfig contains the information to make a TLS connection with the webhook."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  service = _js2n__-refsenv."_js2n__-:oneOf/539!predicate",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/542!predicate"
        | doc "WebhookConversion describes how to call a conversion webhook"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "conversionReviewVersions" ],
              _js2n__-prdslib.records.record
                {
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/541!predicate",
                  conversionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/543!predicate" =
        _js2n__-prdslib.oneOf
            [
              _js2n__-prdslib.isType '"String",
              _js2n__-prdslib.isType '"Number"
            ],
      "_js2n__-:oneOf/544!predicate"
        | doc "APIGroup contains the name, the supported versions, and the preferred version of a group."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "versions" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIGroup" ]
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  preferredVersion =
                    _js2n__-refsenv."_js2n__-:oneOf/552!predicate",
                  serverAddressByClientCIDRs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/562!predicate"
                        ],
                  versions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/552!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/546!predicate"
        | doc "APIResource specifies the name of a resource and whether it is namespaced."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "kind", "name", "namespaced", "singularName", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  categories =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  group = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaced = _js2n__-prdslib.isType '"Bool",
                  shortNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  singularName = _js2n__-prdslib.isType '"String",
                  storageVersionHash = _js2n__-prdslib.isType '"String",
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/549!predicate"
        | doc "Condition contains details for one aspect of the current state of this API Resource."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "lastTransitionTime", "message", "reason", "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/55!predicate"
        | doc "DaemonSetSpec is the specification of a daemon set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  updateStrategy =
                    _js2n__-refsenv."_js2n__-:oneOf/57!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/550!predicate"
        | doc "DeleteOptions may be provided when deleting an API object."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  dryRun =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  gracePeriodSeconds = _js2n__-prdslib.isType 'Integer,
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DeleteOptions" ]
                        ],
                  orphanDependents = _js2n__-prdslib.isType '"Bool",
                  preconditions =
                    _js2n__-refsenv."_js2n__-:oneOf/561!predicate",
                  propagationPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/551!predicate"
        | doc m%"
          FieldsV1 stores a set of fields in a data structure like a Trie, in JSON format.
          
          Each key is either a '.' representing the field itself, and will always map to an empty set, or a string representing a sub-field or item. The string will follow one of these four formats: 'f:<name>', where <name> is the name of a field in a struct, or key in a map 'v:<value>', where <value> is the exact json formatted value of a list item 'i:<index>', where <index> is position of a item in a list 'k:<keys>', where <keys> is a map of  a list item's key fields to their unique values If a key maps to an empty Fields value, the field that key represents is part of the set.
          
          The exact format is defined in sigs.k8s.io/structured-merge-diff
        "%
        = _js2n__-prdslib.isType 'Record,
      "_js2n__-:oneOf/552!predicate"
        | doc "GroupVersion contains the \"group/version\" and \"version\" string of a version. It is made a struct to keep extensibility."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "groupVersion", "version" ],
              _js2n__-prdslib.records.record
                {
                  groupVersion = _js2n__-prdslib.isType '"String",
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/553!predicate"
        | doc "A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/554!predicate"
                        ],
                  matchLabels =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/554!predicate"
        | doc "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "operator" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/555!predicate"
        | doc "ListMeta describes metadata that synthetic resources must have, including lists and various status objects. A resource may have only one of {ObjectMeta, ListMeta}."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  continue = _js2n__-prdslib.isType '"String",
                  remainingItemCount = _js2n__-prdslib.isType 'Integer,
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  selfLink = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/556!predicate"
        | doc "ManagedFieldsEntry is a workflow-id, a FieldSet and the group version of the resource that the fieldset applies to."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldsType = _js2n__-prdslib.isType '"String",
                  fieldsV1 = _js2n__-refsenv."_js2n__-:oneOf/551!predicate",
                  manager = _js2n__-prdslib.isType '"String",
                  operation = _js2n__-prdslib.isType '"String",
                  subresource = _js2n__-prdslib.isType '"String",
                  time = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/557!predicate"
        | doc "MicroTime is version of Time with microsecond level precision."
        = _js2n__-prdslib.isType '"String",
      "_js2n__-:oneOf/558!predicate"
        | doc "ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  annotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  creationTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deletionGracePeriodSeconds = _js2n__-prdslib.isType 'Integer,
                  deletionTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  finalizers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  generateName = _js2n__-prdslib.isType '"String",
                  generation = _js2n__-prdslib.isType 'Integer,
                  labels =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  managedFields =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/556!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  ownerReferences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/559!predicate"
                        ],
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  selfLink = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/559!predicate"
        | doc "OwnerReference contains enough information to let you identify an owning object. An owning object must be in the same namespace as the dependent, or be cluster-scoped, so there is no namespace field."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiVersion", "kind", "name", "uid" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  blockOwnerDeletion = _js2n__-prdslib.isType '"Bool",
                  controller = _js2n__-prdslib.isType '"Bool",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/56!predicate"
        | doc "DaemonSetStatus represents the current status of a daemon set."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "currentNumberScheduled",
                  "desiredNumberScheduled",
                  "numberMisscheduled",
                  "numberReady"
                ],
              _js2n__-prdslib.records.record
                {
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/53!predicate"
                        ],
                  currentNumberScheduled = _js2n__-prdslib.isType 'Integer,
                  desiredNumberScheduled = _js2n__-prdslib.isType 'Integer,
                  numberAvailable = _js2n__-prdslib.isType 'Integer,
                  numberMisscheduled = _js2n__-prdslib.isType 'Integer,
                  numberReady = _js2n__-prdslib.isType 'Integer,
                  numberUnavailable = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  updatedNumberScheduled = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/561!predicate"
        | doc "Preconditions must be fulfilled before an operation (update, delete, etc.) is carried out."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/562!predicate"
        | doc "ServerAddressByClientCIDR helps the client to determine the server address that they should use, depending on the clientCIDR that they match."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "clientCIDR", "serverAddress" ],
              _js2n__-prdslib.records.record
                {
                  clientCIDR = _js2n__-prdslib.isType '"String",
                  serverAddress = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/564!predicate"
        | doc "StatusCause provides more information about an api.Status failure, including cases when multiple errors are encountered."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  field = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/565!predicate"
        | doc "StatusDetails is a set of additional properties that MAY be set by the server to provide additional information about a response. The Reason field of a Status object defines what attributes will be set. Clients must ignore fields that do not match the defined type of each attribute, and should assume that any attribute may be empty, invalid, or under defined."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  causes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/564!predicate"
                        ],
                  group = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  retryAfterSeconds = _js2n__-prdslib.isType 'Integer,
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/566!predicate"
        | doc "Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers."
        = _js2n__-prdslib.isType '"String",
      "_js2n__-:oneOf/568!predicate"
        | doc m%"
          RawExtension is used to hold extensions in external versions.
          
          To use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.
          
          // Internal package:
          
          	type MyAPIObject struct {
          		runtime.TypeMeta `json:",inline"`
          		MyPlugin runtime.Object `json:"myPlugin"`
          	}
          
          	type PluginA struct {
          		AOption string `json:"aOption"`
          	}
          
          // External package:
          
          	type MyAPIObject struct {
          		runtime.TypeMeta `json:",inline"`
          		MyPlugin runtime.RawExtension `json:"myPlugin"`
          	}
          
          	type PluginA struct {
          		AOption string `json:"aOption"`
          	}
          
          // On the wire, the JSON will look something like this:
          
          	{
          		"kind":"MyAPIObject",
          		"apiVersion":"v1",
          		"myPlugin": {
          			"kind":"PluginA",
          			"aOption":"foo",
          		},
          	}
          
          So what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)
        "%
        = _js2n__-prdslib.isType 'Record,
      "_js2n__-:oneOf/569!predicate" =
        _js2n__-prdslib.oneOf
            [
              _js2n__-prdslib.isType '"String",
              _js2n__-prdslib.isType 'Integer
            ],
      "_js2n__-:oneOf/57!predicate"
        | doc "DaemonSetUpdateStrategy is a struct used to control the update strategy for a DaemonSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/69!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/571!predicate"
        | doc "APIService represents a server for a particular GroupVersion. Name must be \"version.group\"."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIService" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/574!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/575!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/572!predicate"
        | doc "APIServiceCondition describes the state of an APIService at a particular point"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/574!predicate"
        | doc "APIServiceSpec contains information for locating and communicating with a server. Only https is supported, though you are able to disable certificate verification."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "groupPriorityMinimum", "versionPriority" ],
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  group = _js2n__-prdslib.isType '"String",
                  groupPriorityMinimum = _js2n__-prdslib.isType 'Integer,
                  insecureSkipTLSVerify = _js2n__-prdslib.isType '"Bool",
                  service = _js2n__-refsenv."_js2n__-:oneOf/576!predicate",
                  version = _js2n__-prdslib.isType '"String",
                  versionPriority = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/575!predicate"
        | doc "APIServiceStatus contains derived information about an API server"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/572!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/576!predicate"
        | doc "ServiceReference holds a reference to Service.legacy.k8s.io"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/58!predicate"
        | doc "Deployment enables declarative updates for Pods and ReplicaSets."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Deployment" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/61!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/62!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/59!predicate"
        | doc "DeploymentCondition describes the state of a deployment at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastUpdateTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/6!predicate"
        | doc "ValidatingWebhook describes an admission webhook and the resources and operations it applies to."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "admissionReviewVersions",
                  "clientConfig",
                  "name",
                  "sideEffects"
                ],
              _js2n__-prdslib.records.record
                {
                  admissionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/9!predicate",
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/0!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/4!predicate"
                        ],
                  sideEffects = _js2n__-prdslib.isType '"String",
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/61!predicate"
        | doc "DeploymentSpec is the specification of the desired behavior of the Deployment."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  paused = _js2n__-prdslib.isType '"Bool",
                  progressDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  strategy = _js2n__-refsenv."_js2n__-:oneOf/63!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/62!predicate"
        | doc "DeploymentStatus is the most recently observed status of the Deployment."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/59!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  unavailableReplicas = _js2n__-prdslib.isType 'Integer,
                  updatedReplicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/63!predicate"
        | doc "DeploymentStrategy describes how to replace existing pods with new ones."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/70!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/64!predicate"
        | doc "ReplicaSet ensures that a specified number of pod replicas are running at any given time."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicaSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/67!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/68!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/65!predicate"
        | doc "ReplicaSetCondition describes the state of a replica set at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/67!predicate"
        | doc "ReplicaSetSpec is the specification of a ReplicaSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/68!predicate"
        | doc "ReplicaSetStatus represents the current status of a ReplicaSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/65!predicate"
                        ],
                  fullyLabeledReplicas = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/69!predicate"
        | doc "Spec to control the desired behavior of daemon set rolling update."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxSurge = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/7!predicate"
        | doc "ValidatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and object without changing it."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingWebhookConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  webhooks =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/6!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/70!predicate"
        | doc "Spec to control the desired behavior of rolling update."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxSurge = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/71!predicate"
        | doc "RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  partition = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/72!predicate"
        | doc m%"
          StatefulSet represents a set of pods with consistent identities. Identities are defined as:
            - Network: A single stable DNS and hostname.
            - Storage: As many VolumeClaims as requested.
          
          The StatefulSet guarantees that a given network identity will always map to the same storage identity.
        "%
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StatefulSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/77!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/78!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/73!predicate"
        | doc "StatefulSetCondition describes the state of a statefulset at a certain point."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/75!predicate"
        | doc "StatefulSetOrdinals describes the policy used for replica ordinal assignment in this StatefulSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { start = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/76!predicate"
        | doc "StatefulSetPersistentVolumeClaimRetentionPolicy describes the policy used for PVCs created from the StatefulSet VolumeClaimTemplates."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  whenDeleted = _js2n__-prdslib.isType '"String",
                  whenScaled = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/77!predicate"
        | doc "A StatefulSetSpec is the specification of a StatefulSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "selector", "serviceName", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  ordinals = _js2n__-refsenv."_js2n__-:oneOf/75!predicate",
                  persistentVolumeClaimRetentionPolicy =
                    _js2n__-refsenv."_js2n__-:oneOf/76!predicate",
                  podManagementPolicy = _js2n__-prdslib.isType '"String",
                  replicas = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  serviceName = _js2n__-prdslib.isType '"String",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  updateStrategy =
                    _js2n__-refsenv."_js2n__-:oneOf/79!predicate",
                  volumeClaimTemplates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/272!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/78!predicate"
        | doc "StatefulSetStatus represents the current state of a StatefulSet."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/73!predicate"
                        ],
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  currentRevision = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  updateRevision = _js2n__-prdslib.isType '"String",
                  updatedReplicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/79!predicate"
        | doc "StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/71!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/80!predicate"
        | doc "BoundObjectReference is a reference to an object that a token is bound to."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/82!predicate"
        | doc "SelfSubjectReviewStatus is filled by the kube-apiserver and sent back to a user."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/84!predicate"
        | doc "TokenRequestSpec contains client provided parameters of a token request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "audiences" ],
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  boundObjectRef =
                    _js2n__-refsenv."_js2n__-:oneOf/80!predicate",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/85!predicate"
        | doc "TokenRequestStatus is the result of a token request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "expirationTimestamp", "token" ],
              _js2n__-prdslib.records.record
                {
                  expirationTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  token = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/87!predicate"
        | doc "TokenReviewSpec is a description of the token authentication request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  token = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/88!predicate"
        | doc "TokenReviewStatus is the result of the token authentication request."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  authenticated = _js2n__-prdslib.isType '"Bool",
                  error = _js2n__-prdslib.isType '"String",
                  user = _js2n__-refsenv."_js2n__-:oneOf/89!predicate",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/89!predicate"
        | doc "UserInfo holds the information about the user needed to implement the user.Info interface."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  uid = _js2n__-prdslib.isType '"String",
                  username = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/9!predicate"
        | doc "WebhookClientConfig contains the information to make a TLS connection with the webhook"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  service = _js2n__-refsenv."_js2n__-:oneOf/5!predicate",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/91!predicate"
        | doc "SelfSubjectReviewStatus is filled by the kube-apiserver and sent back to a user."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/93!predicate"
        | doc "SelfSubjectReviewStatus is filled by the kube-apiserver and sent back to a user."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/95!predicate"
        | doc "NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  verb = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/96!predicate"
        | doc "NonResourceRule holds information that describes a rule for the non-resource"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/97!predicate"
        | doc "ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface"
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                  subresource = _js2n__-prdslib.isType '"String",
                  verb = _js2n__-prdslib.isType '"String",
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
      "_js2n__-:oneOf/98!predicate"
        | doc "ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete."
        = _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
    }
    in
  _js2n__-prdslib.contract_from_predicate
      (_js2n__-prdslib.oneOf
        [
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "admissionReviewVersions",
                  "clientConfig",
                  "name",
                  "sideEffects"
                ],
              _js2n__-prdslib.records.record
                {
                  admissionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/9!predicate",
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/0!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  reinvocationPolicy = _js2n__-prdslib.isType '"String",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/4!predicate"
                        ],
                  sideEffects = _js2n__-prdslib.isType '"String",
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "MutatingWebhookConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  webhooks =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/1!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/2!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "MutatingWebhookConfigurationList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "admissionReviewVersions",
                  "clientConfig",
                  "name",
                  "sideEffects"
                ],
              _js2n__-prdslib.records.record
                {
                  admissionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/9!predicate",
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/0!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/4!predicate"
                        ],
                  sideEffects = _js2n__-prdslib.isType '"String",
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingWebhookConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  webhooks =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/6!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/7!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingWebhookConfigurationList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  service = _js2n__-refsenv."_js2n__-:oneOf/5!predicate",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "valueExpression" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  valueExpression = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldRef", "warning" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-prdslib.isType '"String",
                  warning = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  excludeResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/14!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/14!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  parameterNotFoundAction = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  expressionWarnings =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/11!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ValidatingAdmissionPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/23!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/24!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/21!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/19!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBindingList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchResources =
                    _js2n__-refsenv."_js2n__-:oneOf/13!predicate",
                  paramRef = _js2n__-refsenv."_js2n__-:oneOf/16!predicate",
                  policyName = _js2n__-prdslib.isType '"String",
                  validationActions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/18!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  auditAnnotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/10!predicate"
                        ],
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/12!predicate"
                        ],
                  matchConstraints =
                    _js2n__-refsenv."_js2n__-:oneOf/13!predicate",
                  paramKind = _js2n__-refsenv."_js2n__-:oneOf/15!predicate",
                  validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/25!predicate"
                        ],
                  variables =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/26!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  typeChecking = _js2n__-refsenv."_js2n__-:oneOf/17!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "valueExpression" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  valueExpression = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldRef", "warning" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-prdslib.isType '"String",
                  warning = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  excludeResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/31!predicate"
                        ],
                  matchPolicy = _js2n__-prdslib.isType '"String",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  objectSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/31!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  apiVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  operations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  parameterNotFoundAction = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  expressionWarnings =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/28!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ValidatingAdmissionPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/40!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/41!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/38!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/36!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyBindingList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchResources =
                    _js2n__-refsenv."_js2n__-:oneOf/30!predicate",
                  paramRef = _js2n__-refsenv."_js2n__-:oneOf/33!predicate",
                  policyName = _js2n__-prdslib.isType '"String",
                  validationActions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/35!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "ValidatingAdmissionPolicyList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  auditAnnotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/27!predicate"
                        ],
                  failurePolicy = _js2n__-prdslib.isType '"String",
                  matchConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/29!predicate"
                        ],
                  matchConstraints =
                    _js2n__-refsenv."_js2n__-:oneOf/30!predicate",
                  paramKind = _js2n__-refsenv."_js2n__-:oneOf/32!predicate",
                  validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/42!predicate"
                        ],
                  variables =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/43!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  typeChecking = _js2n__-refsenv."_js2n__-:oneOf/34!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "expression", "name" ],
              _js2n__-prdslib.records.record
                {
                  expression = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiServerID = _js2n__-prdslib.isType '"String",
                  decodableVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  encodingVersion = _js2n__-prdslib.isType '"String",
                  servedVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec", "status" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageVersion" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/48!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/49!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "reason", "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/45!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageVersionList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  commonEncodingVersion = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/46!predicate"
                        ],
                  storageVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/44!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "revision" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  data = _js2n__-refsenv."_js2n__-:oneOf/568!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ControllerRevision" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  revision = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/50!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ControllerRevisionList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DaemonSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/55!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/56!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/52!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DaemonSetList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  updateStrategy =
                    _js2n__-refsenv."_js2n__-:oneOf/57!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "currentNumberScheduled",
                  "desiredNumberScheduled",
                  "numberMisscheduled",
                  "numberReady"
                ],
              _js2n__-prdslib.records.record
                {
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/53!predicate"
                        ],
                  currentNumberScheduled = _js2n__-prdslib.isType 'Integer,
                  desiredNumberScheduled = _js2n__-prdslib.isType 'Integer,
                  numberAvailable = _js2n__-prdslib.isType 'Integer,
                  numberMisscheduled = _js2n__-prdslib.isType 'Integer,
                  numberReady = _js2n__-prdslib.isType 'Integer,
                  numberUnavailable = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  updatedNumberScheduled = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/69!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Deployment" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/61!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/62!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastUpdateTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/58!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DeploymentList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  paused = _js2n__-prdslib.isType '"Bool",
                  progressDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  strategy = _js2n__-refsenv."_js2n__-:oneOf/63!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/59!predicate"
                        ],
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  unavailableReplicas = _js2n__-prdslib.isType 'Integer,
                  updatedReplicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/70!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicaSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/67!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/68!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/64!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicaSetList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "selector" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/65!predicate"
                        ],
                  fullyLabeledReplicas = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxSurge = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxSurge = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  partition = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StatefulSet" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/77!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/78!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/72!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StatefulSetList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { start = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  whenDeleted = _js2n__-prdslib.isType '"String",
                  whenScaled = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "selector", "serviceName", "template" ],
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  ordinals = _js2n__-refsenv."_js2n__-:oneOf/75!predicate",
                  persistentVolumeClaimRetentionPolicy =
                    _js2n__-refsenv."_js2n__-:oneOf/76!predicate",
                  podManagementPolicy = _js2n__-prdslib.isType '"String",
                  replicas = _js2n__-prdslib.isType 'Integer,
                  revisionHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  serviceName = _js2n__-prdslib.isType '"String",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  updateStrategy =
                    _js2n__-refsenv."_js2n__-:oneOf/79!predicate",
                  volumeClaimTemplates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/272!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  collisionCount = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/73!predicate"
                        ],
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  currentRevision = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  updateRevision = _js2n__-prdslib.isType '"String",
                  updatedReplicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  rollingUpdate = _js2n__-refsenv."_js2n__-:oneOf/71!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SelfSubjectReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/82!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "TokenRequest" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/84!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/85!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "audiences" ],
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  boundObjectRef =
                    _js2n__-refsenv."_js2n__-:oneOf/80!predicate",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "expirationTimestamp", "token" ],
              _js2n__-prdslib.records.record
                {
                  expirationTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  token = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "TokenReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/87!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/88!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  token = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  audiences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  authenticated = _js2n__-prdslib.isType '"Bool",
                  error = _js2n__-prdslib.isType '"String",
                  user = _js2n__-refsenv."_js2n__-:oneOf/89!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  uid = _js2n__-prdslib.isType '"String",
                  username = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SelfSubjectReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/91!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SelfSubjectReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/93!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { userInfo = _js2n__-refsenv."_js2n__-:oneOf/89!predicate", } {}
                false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "LocalSubjectAccessReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/104!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/105!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  verb = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                  subresource = _js2n__-prdslib.isType '"String",
                  verb = _js2n__-prdslib.isType '"String",
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SelfSubjectAccessReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/100!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/105!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nonResourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/95!predicate",
                  resourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/97!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SelfSubjectRulesReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/102!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/106!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { namespace = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SubjectAccessReview" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/104!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/105!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nonResourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/95!predicate",
                  resourceAttributes =
                    _js2n__-refsenv."_js2n__-:oneOf/97!predicate",
                  uid = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "allowed" ],
              _js2n__-prdslib.records.record
                {
                  allowed = _js2n__-prdslib.isType '"Bool",
                  denied = _js2n__-prdslib.isType '"Bool",
                  evaluationError = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "incomplete", "nonResourceRules", "resourceRules" ],
              _js2n__-prdslib.records.record
                {
                  evaluationError = _js2n__-prdslib.isType '"String",
                  incomplete = _js2n__-prdslib.isType '"Bool",
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/96!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/98!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscaler" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/110!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/111!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/108!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscalerList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxReplicas", "scaleTargetRef" ],
              _js2n__-prdslib.records.record
                {
                  maxReplicas = _js2n__-prdslib.isType 'Integer,
                  minReplicas = _js2n__-prdslib.isType 'Integer,
                  scaleTargetRef =
                    _js2n__-refsenv."_js2n__-:oneOf/107!predicate",
                  targetCPUUtilizationPercentage =
                    _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "currentReplicas", "desiredReplicas" ],
              _js2n__-prdslib.records.record
                {
                  currentCPUUtilizationPercentage =
                    _js2n__-prdslib.isType 'Integer,
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  desiredReplicas = _js2n__-prdslib.isType 'Integer,
                  lastScaleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Scale" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/113!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/114!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { replicas = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "container", "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  container = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "container", "current", "name" ],
              _js2n__-prdslib.records.record
                {
                  container = _js2n__-prdslib.isType '"String",
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "periodSeconds", "type", "value" ],
              _js2n__-prdslib.records.record
                {
                  periodSeconds = _js2n__-prdslib.isType 'Integer,
                  type = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  policies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/120!predicate"
                        ],
                  selectPolicy = _js2n__-prdslib.isType '"String",
                  stabilizationWindowSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscaler" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/126!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/127!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  scaleDown = _js2n__-refsenv."_js2n__-:oneOf/121!predicate",
                  scaleUp = _js2n__-refsenv."_js2n__-:oneOf/121!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/122!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "HorizontalPodAutoscalerList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxReplicas", "scaleTargetRef" ],
              _js2n__-prdslib.records.record
                {
                  behavior = _js2n__-refsenv."_js2n__-:oneOf/123!predicate",
                  maxReplicas = _js2n__-prdslib.isType 'Integer,
                  metrics =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/129!predicate"
                        ],
                  minReplicas = _js2n__-prdslib.isType 'Integer,
                  scaleTargetRef =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "desiredReplicas" ],
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/124!predicate"
                        ],
                  currentMetrics =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/130!predicate"
                        ],
                  currentReplicas = _js2n__-prdslib.isType 'Integer,
                  desiredReplicas = _js2n__-prdslib.isType 'Integer,
                  lastScaleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  containerResource =
                    _js2n__-refsenv."_js2n__-:oneOf/115!predicate",
                  external = _js2n__-refsenv."_js2n__-:oneOf/118!predicate",
                  object = _js2n__-refsenv."_js2n__-:oneOf/133!predicate",
                  pods = _js2n__-refsenv."_js2n__-:oneOf/135!predicate",
                  resource = _js2n__-refsenv."_js2n__-:oneOf/137!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  containerResource =
                    _js2n__-refsenv."_js2n__-:oneOf/116!predicate",
                  external = _js2n__-refsenv."_js2n__-:oneOf/119!predicate",
                  object = _js2n__-refsenv."_js2n__-:oneOf/134!predicate",
                  pods = _js2n__-refsenv."_js2n__-:oneOf/136!predicate",
                  resource = _js2n__-refsenv."_js2n__-:oneOf/138!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  averageUtilization = _js2n__-prdslib.isType 'Integer,
                  averageValue = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  type = _js2n__-prdslib.isType '"String",
                  value = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  averageUtilization = _js2n__-prdslib.isType 'Integer,
                  averageValue = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  value = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "describedObject", "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  describedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "current", "describedObject", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  describedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/117!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "metric", "target" ],
              _js2n__-prdslib.records.record
                {
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "metric" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  metric = _js2n__-refsenv."_js2n__-:oneOf/128!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "target" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  target = _js2n__-refsenv."_js2n__-:oneOf/131!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "current", "name" ],
              _js2n__-prdslib.records.record
                {
                  current = _js2n__-refsenv."_js2n__-:oneOf/132!predicate",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CronJob" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/141!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/142!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/139!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CronJobList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "jobTemplate", "schedule" ],
              _js2n__-prdslib.records.record
                {
                  concurrencyPolicy = _js2n__-prdslib.isType '"String",
                  failedJobsHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  jobTemplate = _js2n__-refsenv."_js2n__-:oneOf/148!predicate",
                  schedule = _js2n__-prdslib.isType '"String",
                  startingDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  successfulJobsHistoryLimit = _js2n__-prdslib.isType 'Integer,
                  suspend = _js2n__-prdslib.isType '"Bool",
                  timeZone = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/270!predicate"
                        ],
                  lastScheduleTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastSuccessfulTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Job" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/146!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/147!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/143!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "JobList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "template" ],
              _js2n__-prdslib.records.record
                {
                  activeDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  backoffLimit = _js2n__-prdslib.isType 'Integer,
                  backoffLimitPerIndex = _js2n__-prdslib.isType 'Integer,
                  completionMode = _js2n__-prdslib.isType '"String",
                  completions = _js2n__-prdslib.isType 'Integer,
                  manualSelector = _js2n__-prdslib.isType '"Bool",
                  maxFailedIndexes = _js2n__-prdslib.isType 'Integer,
                  parallelism = _js2n__-prdslib.isType 'Integer,
                  podFailurePolicy =
                    _js2n__-refsenv."_js2n__-:oneOf/149!predicate",
                  podReplacementPolicy = _js2n__-prdslib.isType '"String",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  suspend = _js2n__-prdslib.isType '"Bool",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                  ttlSecondsAfterFinished = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active = _js2n__-prdslib.isType 'Integer,
                  completedIndexes = _js2n__-prdslib.isType '"String",
                  completionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/144!predicate"
                        ],
                  failed = _js2n__-prdslib.isType 'Integer,
                  failedIndexes = _js2n__-prdslib.isType '"String",
                  ready = _js2n__-prdslib.isType 'Integer,
                  startTime = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  succeeded = _js2n__-prdslib.isType 'Integer,
                  terminating = _js2n__-prdslib.isType 'Integer,
                  uncountedTerminatedPods =
                    _js2n__-refsenv."_js2n__-:oneOf/153!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/146!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "rules" ],
              _js2n__-prdslib.records.record
                {
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/152!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "operator", "values" ],
              _js2n__-prdslib.records.record
                {
                  containerName = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType 'Integer)
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "action" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  onExitCodes = _js2n__-refsenv."_js2n__-:oneOf/150!predicate",
                  onPodConditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/151!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  failed =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  succeeded =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CertificateSigningRequest" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/157!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/158!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastUpdateTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/154!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "CertificateSigningRequestList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "request", "signerName" ],
              _js2n__-prdslib.records.record
                {
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                  extra =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.allOf
                              [
                                _js2n__-prdslib.isType '"Array",
                                _js2n__-prdslib.arrays.arrayOf
                                  (_js2n__-prdslib.isType '"String")
                              ])
                        ],
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  request = _js2n__-prdslib.isType '"String",
                  signerName = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                  usages =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  username = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  certificate = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/155!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterTrustBundle" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/161!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/159!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterTrustBundleList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "trustBundle" ],
              _js2n__-prdslib.records.record
                {
                  signerName = _js2n__-prdslib.isType '"String",
                  trustBundle = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Lease" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/164!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/162!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "LeaseList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  acquireTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  holderIdentity = _js2n__-prdslib.isType '"String",
                  leaseDurationSeconds = _js2n__-prdslib.isType 'Integer,
                  leaseTransitions = _js2n__-prdslib.isType 'Integer,
                  renewTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  partition = _js2n__-prdslib.isType 'Integer,
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nodeAffinity = _js2n__-refsenv."_js2n__-:oneOf/257!predicate",
                  podAffinity = _js2n__-refsenv."_js2n__-:oneOf/284!predicate",
                  podAntiAffinity =
                    _js2n__-refsenv."_js2n__-:oneOf/286!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "devicePath", "name" ],
              _js2n__-prdslib.records.record
                {
                  devicePath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "diskName", "diskURI" ],
              _js2n__-prdslib.records.record
                {
                  cachingMode = _js2n__-prdslib.isType '"String",
                  diskName = _js2n__-prdslib.isType '"String",
                  diskURI = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "secretName", "shareName" ],
              _js2n__-prdslib.records.record
                {
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                  secretNamespace = _js2n__-prdslib.isType '"String",
                  shareName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "secretName", "shareName" ],
              _js2n__-prdslib.records.record
                {
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                  shareName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "target" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Binding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  target = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver", "volumeHandle" ],
              _js2n__-prdslib.records.record
                {
                  controllerExpandSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  controllerPublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  nodeExpandSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  nodePublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  nodeStageSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeAttributes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  volumeHandle = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  nodePublishSecretRef =
                    _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeAttributes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  add =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  drop =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "monitors" ],
              _js2n__-prdslib.records.record
                {
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretFile = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "monitors" ],
              _js2n__-prdslib.records.record
                {
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretFile = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceClaimName = _js2n__-prdslib.isType '"String",
                  resourceClaimTemplateName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { timeoutSeconds = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                  path = _js2n__-prdslib.isType '"String",
                  signerName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/182!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ComponentStatus" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/183!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ComponentStatusList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  binaryData =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  data =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  immutable = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ConfigMap" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/185!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ConfigMapList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "kubeletConfigKey", "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  kubeletConfigKey = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  args =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  env =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/212!predicate"
                        ],
                  envFrom =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/211!predicate"
                        ],
                  image = _js2n__-prdslib.isType '"String",
                  imagePullPolicy = _js2n__-prdslib.isType '"String",
                  lifecycle = _js2n__-refsenv."_js2n__-:oneOf/238!predicate",
                  livenessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/194!predicate"
                        ],
                  readinessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  resizePolicy =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/195!predicate"
                        ],
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/336!predicate",
                  startupProbe = _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  stdin = _js2n__-prdslib.isType '"Bool",
                  stdinOnce = _js2n__-prdslib.isType '"Bool",
                  terminationMessagePath = _js2n__-prdslib.isType '"String",
                  terminationMessagePolicy = _js2n__-prdslib.isType '"String",
                  tty = _js2n__-prdslib.isType '"Bool",
                  volumeDevices =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/359!predicate"
                        ],
                  volumeMounts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/360!predicate"
                        ],
                  workingDir = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  names =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  sizeBytes = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "containerPort" ],
              _js2n__-prdslib.records.record
                {
                  containerPort = _js2n__-prdslib.isType 'Integer,
                  hostIP = _js2n__-prdslib.isType '"String",
                  hostPort = _js2n__-prdslib.isType 'Integer,
                  name = _js2n__-prdslib.isType '"String",
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "resourceName", "restartPolicy" ],
              _js2n__-prdslib.records.record
                {
                  resourceName = _js2n__-prdslib.isType '"String",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  running = _js2n__-refsenv."_js2n__-:oneOf/197!predicate",
                  terminated = _js2n__-refsenv."_js2n__-:oneOf/198!predicate",
                  waiting = _js2n__-refsenv."_js2n__-:oneOf/199!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { startedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate", }
                {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "exitCode" ],
              _js2n__-prdslib.records.record
                {
                  containerID = _js2n__-prdslib.isType '"String",
                  exitCode = _js2n__-prdslib.isType 'Integer,
                  finishedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  signal = _js2n__-prdslib.isType 'Integer,
                  startedAt = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "image", "imageID", "name", "ready", "restartCount" ],
              _js2n__-prdslib.records.record
                {
                  allocatedResources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  containerID = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  imageID = _js2n__-prdslib.isType '"String",
                  lastState = _js2n__-refsenv."_js2n__-:oneOf/196!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ready = _js2n__-prdslib.isType '"Bool",
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartCount = _js2n__-prdslib.isType 'Integer,
                  started = _js2n__-prdslib.isType '"Bool",
                  state = _js2n__-refsenv."_js2n__-:oneOf/196!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "Port" ],
              _js2n__-prdslib.records.record
                { Port = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/203!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  fieldRef = _js2n__-refsenv."_js2n__-:oneOf/269!predicate",
                  mode = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                  resourceFieldRef =
                    _js2n__-refsenv."_js2n__-:oneOf/317!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/203!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  medium = _js2n__-prdslib.isType '"String",
                  sizeLimit = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "ip" ],
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  targetRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/206!predicate"
                        ],
                  notReadyAddresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/206!predicate"
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/207!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Endpoints" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  subsets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/208!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/209!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EndpointsList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configMapRef = _js2n__-refsenv."_js2n__-:oneOf/186!predicate",
                  prefix = _js2n__-prdslib.isType '"String",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/330!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                  valueFrom = _js2n__-refsenv."_js2n__-:oneOf/213!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configMapKeyRef =
                    _js2n__-refsenv."_js2n__-:oneOf/187!predicate",
                  fieldRef = _js2n__-refsenv."_js2n__-:oneOf/269!predicate",
                  resourceFieldRef =
                    _js2n__-refsenv."_js2n__-:oneOf/317!predicate",
                  secretKeyRef = _js2n__-refsenv."_js2n__-:oneOf/331!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  args =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  env =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/212!predicate"
                        ],
                  envFrom =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/211!predicate"
                        ],
                  image = _js2n__-prdslib.isType '"String",
                  imagePullPolicy = _js2n__-prdslib.isType '"String",
                  lifecycle = _js2n__-refsenv."_js2n__-:oneOf/238!predicate",
                  livenessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/194!predicate"
                        ],
                  readinessProbe =
                    _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  resizePolicy =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/195!predicate"
                        ],
                  resources = _js2n__-refsenv."_js2n__-:oneOf/322!predicate",
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/336!predicate",
                  startupProbe = _js2n__-refsenv."_js2n__-:oneOf/306!predicate",
                  stdin = _js2n__-prdslib.isType '"Bool",
                  stdinOnce = _js2n__-prdslib.isType '"Bool",
                  targetContainerName = _js2n__-prdslib.isType '"String",
                  terminationMessagePath = _js2n__-prdslib.isType '"String",
                  terminationMessagePolicy = _js2n__-prdslib.isType '"String",
                  tty = _js2n__-prdslib.isType '"Bool",
                  volumeDevices =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/359!predicate"
                        ],
                  volumeMounts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/360!predicate"
                        ],
                  workingDir = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  volumeClaimTemplate =
                    _js2n__-refsenv."_js2n__-:oneOf/277!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "involvedObject", "metadata" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  count = _js2n__-prdslib.isType 'Integer,
                  eventTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  firstTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  involvedObject =
                    _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Event" ]
                        ],
                  lastTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  reason = _js2n__-prdslib.isType '"String",
                  related = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  reportingComponent = _js2n__-prdslib.isType '"String",
                  reportingInstance = _js2n__-prdslib.isType '"String",
                  series = _js2n__-refsenv."_js2n__-:oneOf/218!predicate",
                  source = _js2n__-refsenv."_js2n__-:oneOf/219!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/216!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EventList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  count = _js2n__-prdslib.isType 'Integer,
                  lastObservedTime =
                    _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  component = _js2n__-prdslib.isType '"String",
                  host = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  targetWWNs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  wwids =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driver" ],
              _js2n__-prdslib.records.record
                {
                  driver = _js2n__-prdslib.isType '"String",
                  fsType = _js2n__-prdslib.isType '"String",
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  datasetName = _js2n__-prdslib.isType '"String",
                  datasetUUID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "pdName" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  partition = _js2n__-prdslib.isType 'Integer,
                  pdName = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  port = _js2n__-prdslib.isType 'Integer,
                  service = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "repository" ],
              _js2n__-prdslib.records.record
                {
                  directory = _js2n__-prdslib.isType '"String",
                  repository = _js2n__-prdslib.isType '"String",
                  revision = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "endpoints", "path" ],
              _js2n__-prdslib.records.record
                {
                  endpoints = _js2n__-prdslib.isType '"String",
                  endpointsNamespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "endpoints", "path" ],
              _js2n__-prdslib.records.record
                {
                  endpoints = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  httpHeaders =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/231!predicate"
                        ],
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  scheme = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "value" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostnames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ip = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { ip = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "iqn", "lun", "targetPortal" ],
              _js2n__-prdslib.records.record
                {
                  chapAuthDiscovery = _js2n__-prdslib.isType '"Bool",
                  chapAuthSession = _js2n__-prdslib.isType '"Bool",
                  fsType = _js2n__-prdslib.isType '"String",
                  initiatorName = _js2n__-prdslib.isType '"String",
                  iqn = _js2n__-prdslib.isType '"String",
                  iscsiInterface = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  portals =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  targetPortal = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "iqn", "lun", "targetPortal" ],
              _js2n__-prdslib.records.record
                {
                  chapAuthDiscovery = _js2n__-prdslib.isType '"Bool",
                  chapAuthSession = _js2n__-prdslib.isType '"Bool",
                  fsType = _js2n__-prdslib.isType '"String",
                  initiatorName = _js2n__-prdslib.isType '"String",
                  iqn = _js2n__-prdslib.isType '"String",
                  iscsiInterface = _js2n__-prdslib.isType '"String",
                  lun = _js2n__-prdslib.isType 'Integer,
                  portals =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  targetPortal = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "path" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  mode = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  postStart = _js2n__-refsenv."_js2n__-:oneOf/239!predicate",
                  preStop = _js2n__-refsenv."_js2n__-:oneOf/239!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  exec = _js2n__-refsenv."_js2n__-:oneOf/220!predicate",
                  httpGet = _js2n__-refsenv."_js2n__-:oneOf/230!predicate",
                  sleep = _js2n__-refsenv."_js2n__-:oneOf/346!predicate",
                  tcpSocket = _js2n__-refsenv."_js2n__-:oneOf/350!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "LimitRange" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/243!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  "default" =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  defaultRequest =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  max =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  maxLimitRequestRatio =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  min =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/240!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "LimitRangeList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "limits" ],
              _js2n__-prdslib.records.record
                {
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/241!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  ipMode = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/303!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/244!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status" ],
              _js2n__-prdslib.records.record
                {
                  status = _js2n__-prdslib.isType '"String",
                  targetVolumeAttributesClassName =
                    _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path", "server" ],
              _js2n__-prdslib.records.record
                {
                  path = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  server = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Namespace" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/253!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/254!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/250!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "NamespaceList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  finalizers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/251!predicate"
                        ],
                  phase = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Node" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/266!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/267!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "address", "type" ],
              _js2n__-prdslib.records.record
                {
                  address = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/305!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastHeartbeatTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { configMap = _js2n__-refsenv."_js2n__-:oneOf/189!predicate", }
                {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  active = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  assigned = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  error = _js2n__-prdslib.isType '"String",
                  lastKnownGood =
                    _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  kubeletEndpoint =
                    _js2n__-refsenv."_js2n__-:oneOf/201!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/255!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "NodeList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nodeSelectorTerms" ],
              _js2n__-prdslib.records.record
                {
                  nodeSelectorTerms =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/265!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "operator" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/264!predicate"
                        ],
                  matchFields =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/264!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  configSource = _js2n__-refsenv."_js2n__-:oneOf/259!predicate",
                  externalID = _js2n__-prdslib.isType '"String",
                  podCIDR = _js2n__-prdslib.isType '"String",
                  podCIDRs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  providerID = _js2n__-prdslib.isType '"String",
                  taints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/351!predicate"
                        ],
                  unschedulable = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/256!predicate"
                        ],
                  allocatable =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/258!predicate"
                        ],
                  config = _js2n__-refsenv."_js2n__-:oneOf/260!predicate",
                  daemonEndpoints =
                    _js2n__-refsenv."_js2n__-:oneOf/261!predicate",
                  images =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/193!predicate"
                        ],
                  nodeInfo = _js2n__-refsenv."_js2n__-:oneOf/268!predicate",
                  phase = _js2n__-prdslib.isType '"String",
                  volumesAttached =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/167!predicate"
                        ],
                  volumesInUse =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "architecture",
                  "bootID",
                  "containerRuntimeVersion",
                  "kernelVersion",
                  "kubeProxyVersion",
                  "kubeletVersion",
                  "machineID",
                  "operatingSystem",
                  "osImage",
                  "systemUUID"
                ],
              _js2n__-prdslib.records.record
                {
                  architecture = _js2n__-prdslib.isType '"String",
                  bootID = _js2n__-prdslib.isType '"String",
                  containerRuntimeVersion = _js2n__-prdslib.isType '"String",
                  kernelVersion = _js2n__-prdslib.isType '"String",
                  kubeProxyVersion = _js2n__-prdslib.isType '"String",
                  kubeletVersion = _js2n__-prdslib.isType '"String",
                  machineID = _js2n__-prdslib.isType '"String",
                  operatingSystem = _js2n__-prdslib.isType '"String",
                  osImage = _js2n__-prdslib.isType '"String",
                  systemUUID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "fieldPath" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldPath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldPath = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolume" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/280!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/281!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolumeClaim" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/275!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/276!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/272!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolumeClaimList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  dataSource = _js2n__-refsenv."_js2n__-:oneOf/356!predicate",
                  dataSourceRef =
                    _js2n__-refsenv."_js2n__-:oneOf/357!predicate",
                  resources = _js2n__-refsenv."_js2n__-:oneOf/363!predicate",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                  volumeAttributesClassName = _js2n__-prdslib.isType '"String",
                  volumeMode = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  allocatedResourceStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  allocatedResources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/273!predicate"
                        ],
                  currentVolumeAttributesClassName =
                    _js2n__-prdslib.isType '"String",
                  modifyVolumeStatus =
                    _js2n__-refsenv."_js2n__-:oneOf/248!predicate",
                  phase = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/275!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "claimName" ],
              _js2n__-prdslib.records.record
                {
                  claimName = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/271!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PersistentVolumeList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  accessModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  awsElasticBlockStore =
                    _js2n__-refsenv."_js2n__-:oneOf/165!predicate",
                  azureDisk = _js2n__-refsenv."_js2n__-:oneOf/168!predicate",
                  azureFile = _js2n__-refsenv."_js2n__-:oneOf/169!predicate",
                  capacity =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  cephfs = _js2n__-refsenv."_js2n__-:oneOf/175!predicate",
                  cinder = _js2n__-refsenv."_js2n__-:oneOf/177!predicate",
                  claimRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  csi = _js2n__-refsenv."_js2n__-:oneOf/172!predicate",
                  fc = _js2n__-refsenv."_js2n__-:oneOf/221!predicate",
                  flexVolume = _js2n__-refsenv."_js2n__-:oneOf/222!predicate",
                  flocker = _js2n__-refsenv."_js2n__-:oneOf/224!predicate",
                  gcePersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/225!predicate",
                  glusterfs = _js2n__-refsenv."_js2n__-:oneOf/228!predicate",
                  hostPath = _js2n__-refsenv."_js2n__-:oneOf/234!predicate",
                  iscsi = _js2n__-refsenv."_js2n__-:oneOf/235!predicate",
                  local = _js2n__-refsenv."_js2n__-:oneOf/247!predicate",
                  mountOptions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nfs = _js2n__-refsenv."_js2n__-:oneOf/249!predicate",
                  nodeAffinity = _js2n__-refsenv."_js2n__-:oneOf/361!predicate",
                  persistentVolumeReclaimPolicy =
                    _js2n__-prdslib.isType '"String",
                  photonPersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/282!predicate",
                  portworxVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/304!predicate",
                  quobyte = _js2n__-refsenv."_js2n__-:oneOf/308!predicate",
                  rbd = _js2n__-refsenv."_js2n__-:oneOf/309!predicate",
                  scaleIO = _js2n__-refsenv."_js2n__-:oneOf/324!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                  storageos = _js2n__-refsenv."_js2n__-:oneOf/347!predicate",
                  volumeAttributesClassName = _js2n__-prdslib.isType '"String",
                  volumeMode = _js2n__-prdslib.isType '"String",
                  vsphereVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/364!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastPhaseTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  phase = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "pdID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  pdID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Pod" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/298!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/299!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/365!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/285!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "topologyKey" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  matchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  mismatchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  topologyKey = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/365!predicate"
                        ],
                  requiredDuringSchedulingIgnoredDuringExecution =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/285!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastProbeTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nameservers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  options =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/289!predicate"
                        ],
                  searches =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { ip = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/283!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "conditionType" ],
              _js2n__-prdslib.records.record
                { conditionType = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  source = _js2n__-refsenv."_js2n__-:oneOf/179!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  resourceClaimName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsGroup = _js2n__-prdslib.isType 'Integer,
                  fsGroupChangePolicy = _js2n__-prdslib.isType '"String",
                  runAsGroup = _js2n__-prdslib.isType 'Integer,
                  runAsNonRoot = _js2n__-prdslib.isType '"Bool",
                  runAsUser = _js2n__-prdslib.isType 'Integer,
                  seLinuxOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/323!predicate",
                  seccompProfile =
                    _js2n__-refsenv."_js2n__-:oneOf/328!predicate",
                  supplementalGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType 'Integer)
                        ],
                  sysctls =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/349!predicate"
                        ],
                  windowsOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/366!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "containers" ],
              _js2n__-prdslib.records.record
                {
                  activeDeadlineSeconds = _js2n__-prdslib.isType 'Integer,
                  affinity = _js2n__-refsenv."_js2n__-:oneOf/166!predicate",
                  automountServiceAccountToken = _js2n__-prdslib.isType '"Bool",
                  containers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/192!predicate"
                        ],
                  dnsConfig = _js2n__-refsenv."_js2n__-:oneOf/288!predicate",
                  dnsPolicy = _js2n__-prdslib.isType '"String",
                  enableServiceLinks = _js2n__-prdslib.isType '"Bool",
                  ephemeralContainers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/214!predicate"
                        ],
                  hostAliases =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/232!predicate"
                        ],
                  hostIPC = _js2n__-prdslib.isType '"Bool",
                  hostNetwork = _js2n__-prdslib.isType '"Bool",
                  hostPID = _js2n__-prdslib.isType '"Bool",
                  hostUsers = _js2n__-prdslib.isType '"Bool",
                  hostname = _js2n__-prdslib.isType '"String",
                  imagePullSecrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/246!predicate"
                        ],
                  initContainers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/192!predicate"
                        ],
                  nodeName = _js2n__-prdslib.isType '"String",
                  nodeSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  os = _js2n__-refsenv."_js2n__-:oneOf/292!predicate",
                  overhead =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  preemptionPolicy = _js2n__-prdslib.isType '"String",
                  "priority" = _js2n__-prdslib.isType 'Integer,
                  priorityClassName = _js2n__-prdslib.isType '"String",
                  readinessGates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/293!predicate"
                        ],
                  resourceClaims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/294!predicate"
                        ],
                  restartPolicy = _js2n__-prdslib.isType '"String",
                  runtimeClassName = _js2n__-prdslib.isType '"String",
                  schedulerName = _js2n__-prdslib.isType '"String",
                  schedulingGates =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/296!predicate"
                        ],
                  securityContext =
                    _js2n__-refsenv."_js2n__-:oneOf/297!predicate",
                  serviceAccount = _js2n__-prdslib.isType '"String",
                  serviceAccountName = _js2n__-prdslib.isType '"String",
                  setHostnameAsFQDN = _js2n__-prdslib.isType '"Bool",
                  shareProcessNamespace = _js2n__-prdslib.isType '"Bool",
                  subdomain = _js2n__-prdslib.isType '"String",
                  terminationGracePeriodSeconds =
                    _js2n__-prdslib.isType 'Integer,
                  tolerations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/352!predicate"
                        ],
                  topologySpreadConstraints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/355!predicate"
                        ],
                  volumes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/358!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/287!predicate"
                        ],
                  containerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  ephemeralContainerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  hostIP = _js2n__-prdslib.isType '"String",
                  hostIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/233!predicate"
                        ],
                  initContainerStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/200!predicate"
                        ],
                  message = _js2n__-prdslib.isType '"String",
                  nominatedNodeName = _js2n__-prdslib.isType '"String",
                  phase = _js2n__-prdslib.isType '"String",
                  podIP = _js2n__-prdslib.isType '"String",
                  podIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/290!predicate"
                        ],
                  qosClass = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  resize = _js2n__-prdslib.isType '"String",
                  resourceClaimStatuses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/295!predicate"
                        ],
                  startTime = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodTemplate" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/300!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodTemplateList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/298!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port", "protocol" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumeID" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  volumeID = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "preference", "weight" ],
              _js2n__-prdslib.records.record
                {
                  preference = _js2n__-refsenv."_js2n__-:oneOf/265!predicate",
                  weight = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  exec = _js2n__-refsenv."_js2n__-:oneOf/220!predicate",
                  failureThreshold = _js2n__-prdslib.isType 'Integer,
                  grpc = _js2n__-refsenv."_js2n__-:oneOf/226!predicate",
                  httpGet = _js2n__-refsenv."_js2n__-:oneOf/230!predicate",
                  initialDelaySeconds = _js2n__-prdslib.isType 'Integer,
                  periodSeconds = _js2n__-prdslib.isType 'Integer,
                  successThreshold = _js2n__-prdslib.isType 'Integer,
                  tcpSocket = _js2n__-refsenv."_js2n__-:oneOf/350!predicate",
                  terminationGracePeriodSeconds =
                    _js2n__-prdslib.isType 'Integer,
                  timeoutSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  sources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/362!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "registry", "volume" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  registry = _js2n__-prdslib.isType '"String",
                  tenant = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                  volume = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "image", "monitors" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  keyring = _js2n__-prdslib.isType '"String",
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  pool = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "image", "monitors" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  image = _js2n__-prdslib.isType '"String",
                  keyring = _js2n__-prdslib.isType '"String",
                  monitors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  pool = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicationController" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/314!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/315!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/311!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ReplicationControllerList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  minReadySeconds = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                  selector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  template = _js2n__-refsenv."_js2n__-:oneOf/302!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "replicas" ],
              _js2n__-prdslib.records.record
                {
                  availableReplicas = _js2n__-prdslib.isType 'Integer,
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/312!predicate"
                        ],
                  fullyLabeledReplicas = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  readyReplicas = _js2n__-prdslib.isType 'Integer,
                  replicas = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "resource" ],
              _js2n__-prdslib.records.record
                {
                  containerName = _js2n__-prdslib.isType '"String",
                  divisor = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  resource = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceQuota" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/320!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/321!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/318!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceQuotaList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hard =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  scopeSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/326!predicate",
                  scopes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hard =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  used =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  claims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/316!predicate"
                        ],
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  requests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  level = _js2n__-prdslib.isType '"String",
                  role = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                  user = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "gateway", "secretRef", "system" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  gateway = _js2n__-prdslib.isType '"String",
                  protectionDomain = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/334!predicate",
                  sslEnabled = _js2n__-prdslib.isType '"Bool",
                  storageMode = _js2n__-prdslib.isType '"String",
                  storagePool = _js2n__-prdslib.isType '"String",
                  system = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "gateway", "secretRef", "system" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  gateway = _js2n__-prdslib.isType '"String",
                  protectionDomain = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  sslEnabled = _js2n__-prdslib.isType '"Bool",
                  storageMode = _js2n__-prdslib.isType '"String",
                  storagePool = _js2n__-prdslib.isType '"String",
                  system = _js2n__-prdslib.isType '"String",
                  volumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/327!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "operator", "scopeName" ],
              _js2n__-prdslib.records.record
                {
                  operator = _js2n__-prdslib.isType '"String",
                  scopeName = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  localhostProfile = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  data =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  immutable = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Secret" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  stringData =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/329!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "SecretList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  "optional" = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultMode = _js2n__-prdslib.isType 'Integer,
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/237!predicate"
                        ],
                  "optional" = _js2n__-prdslib.isType '"Bool",
                  secretName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allowPrivilegeEscalation = _js2n__-prdslib.isType '"Bool",
                  capabilities = _js2n__-refsenv."_js2n__-:oneOf/174!predicate",
                  privileged = _js2n__-prdslib.isType '"Bool",
                  procMount = _js2n__-prdslib.isType '"String",
                  readOnlyRootFilesystem = _js2n__-prdslib.isType '"Bool",
                  runAsGroup = _js2n__-prdslib.isType 'Integer,
                  runAsNonRoot = _js2n__-prdslib.isType '"Bool",
                  runAsUser = _js2n__-prdslib.isType 'Integer,
                  seLinuxOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/323!predicate",
                  seccompProfile =
                    _js2n__-refsenv."_js2n__-:oneOf/328!predicate",
                  windowsOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/366!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Service" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/343!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/344!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  automountServiceAccountToken = _js2n__-prdslib.isType '"Bool",
                  imagePullSecrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/246!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceAccount" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  secrets =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/270!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/338!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceAccountList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "path" ],
              _js2n__-prdslib.records.record
                {
                  audience = _js2n__-prdslib.isType '"String",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                  path = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/337!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  nodePort = _js2n__-prdslib.isType 'Integer,
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                  targetPort = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allocateLoadBalancerNodePorts =
                    _js2n__-prdslib.isType '"Bool",
                  clusterIP = _js2n__-prdslib.isType '"String",
                  clusterIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  externalIPs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  externalName = _js2n__-prdslib.isType '"String",
                  externalTrafficPolicy = _js2n__-prdslib.isType '"String",
                  healthCheckNodePort = _js2n__-prdslib.isType 'Integer,
                  internalTrafficPolicy = _js2n__-prdslib.isType '"String",
                  ipFamilies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ipFamilyPolicy = _js2n__-prdslib.isType '"String",
                  loadBalancerClass = _js2n__-prdslib.isType '"String",
                  loadBalancerIP = _js2n__-prdslib.isType '"String",
                  loadBalancerSourceRanges =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/342!predicate"
                        ],
                  publishNotReadyAddresses = _js2n__-prdslib.isType '"Bool",
                  selector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  sessionAffinity = _js2n__-prdslib.isType '"String",
                  sessionAffinityConfig =
                    _js2n__-refsenv."_js2n__-:oneOf/345!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  loadBalancer = _js2n__-refsenv."_js2n__-:oneOf/245!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { clientIP = _js2n__-refsenv."_js2n__-:oneOf/180!predicate", }
                {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "seconds" ],
              _js2n__-prdslib.records.record
                { seconds = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  volumeName = _js2n__-prdslib.isType '"String",
                  volumeNamespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  secretRef = _js2n__-refsenv."_js2n__-:oneOf/246!predicate",
                  volumeName = _js2n__-prdslib.isType '"String",
                  volumeNamespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "value" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "effect", "key" ],
              _js2n__-prdslib.records.record
                {
                  effect = _js2n__-prdslib.isType '"String",
                  key = _js2n__-prdslib.isType '"String",
                  timeAdded = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  effect = _js2n__-prdslib.isType '"String",
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  tolerationSeconds = _js2n__-prdslib.isType 'Integer,
                  value = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "values" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchLabelExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/353!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "maxSkew", "topologyKey", "whenUnsatisfiable" ],
              _js2n__-prdslib.records.record
                {
                  labelSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  matchLabelKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  maxSkew = _js2n__-prdslib.isType 'Integer,
                  minDomains = _js2n__-prdslib.isType 'Integer,
                  nodeAffinityPolicy = _js2n__-prdslib.isType '"String",
                  nodeTaintsPolicy = _js2n__-prdslib.isType '"String",
                  topologyKey = _js2n__-prdslib.isType '"String",
                  whenUnsatisfiable = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  awsElasticBlockStore =
                    _js2n__-refsenv."_js2n__-:oneOf/165!predicate",
                  azureDisk = _js2n__-refsenv."_js2n__-:oneOf/168!predicate",
                  azureFile = _js2n__-refsenv."_js2n__-:oneOf/170!predicate",
                  cephfs = _js2n__-refsenv."_js2n__-:oneOf/176!predicate",
                  cinder = _js2n__-refsenv."_js2n__-:oneOf/178!predicate",
                  configMap = _js2n__-refsenv."_js2n__-:oneOf/191!predicate",
                  csi = _js2n__-refsenv."_js2n__-:oneOf/173!predicate",
                  downwardAPI = _js2n__-refsenv."_js2n__-:oneOf/204!predicate",
                  emptyDir = _js2n__-refsenv."_js2n__-:oneOf/205!predicate",
                  ephemeral = _js2n__-refsenv."_js2n__-:oneOf/215!predicate",
                  fc = _js2n__-refsenv."_js2n__-:oneOf/221!predicate",
                  flexVolume = _js2n__-refsenv."_js2n__-:oneOf/223!predicate",
                  flocker = _js2n__-refsenv."_js2n__-:oneOf/224!predicate",
                  gcePersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/225!predicate",
                  gitRepo = _js2n__-refsenv."_js2n__-:oneOf/227!predicate",
                  glusterfs = _js2n__-refsenv."_js2n__-:oneOf/229!predicate",
                  hostPath = _js2n__-refsenv."_js2n__-:oneOf/234!predicate",
                  iscsi = _js2n__-refsenv."_js2n__-:oneOf/236!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  nfs = _js2n__-refsenv."_js2n__-:oneOf/249!predicate",
                  persistentVolumeClaim =
                    _js2n__-refsenv."_js2n__-:oneOf/278!predicate",
                  photonPersistentDisk =
                    _js2n__-refsenv."_js2n__-:oneOf/282!predicate",
                  portworxVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/304!predicate",
                  projected = _js2n__-refsenv."_js2n__-:oneOf/307!predicate",
                  quobyte = _js2n__-refsenv."_js2n__-:oneOf/308!predicate",
                  rbd = _js2n__-refsenv."_js2n__-:oneOf/310!predicate",
                  scaleIO = _js2n__-refsenv."_js2n__-:oneOf/325!predicate",
                  secret = _js2n__-refsenv."_js2n__-:oneOf/335!predicate",
                  storageos = _js2n__-refsenv."_js2n__-:oneOf/348!predicate",
                  vsphereVolume =
                    _js2n__-refsenv."_js2n__-:oneOf/364!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "devicePath", "name" ],
              _js2n__-prdslib.records.record
                {
                  devicePath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "mountPath", "name" ],
              _js2n__-prdslib.records.record
                {
                  mountPath = _js2n__-prdslib.isType '"String",
                  mountPropagation = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  readOnly = _js2n__-prdslib.isType '"Bool",
                  subPath = _js2n__-prdslib.isType '"String",
                  subPathExpr = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { required = _js2n__-refsenv."_js2n__-:oneOf/263!predicate", }
                {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  clusterTrustBundle =
                    _js2n__-refsenv."_js2n__-:oneOf/181!predicate",
                  configMap = _js2n__-refsenv."_js2n__-:oneOf/190!predicate",
                  downwardAPI = _js2n__-refsenv."_js2n__-:oneOf/202!predicate",
                  secret = _js2n__-refsenv."_js2n__-:oneOf/333!predicate",
                  serviceAccountToken =
                    _js2n__-refsenv."_js2n__-:oneOf/340!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  limits =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                  requests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "volumePath" ],
              _js2n__-prdslib.records.record
                {
                  fsType = _js2n__-prdslib.isType '"String",
                  storagePolicyID = _js2n__-prdslib.isType '"String",
                  storagePolicyName = _js2n__-prdslib.isType '"String",
                  volumePath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "podAffinityTerm", "weight" ],
              _js2n__-prdslib.records.record
                {
                  podAffinityTerm =
                    _js2n__-refsenv."_js2n__-:oneOf/285!predicate",
                  weight = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  gmsaCredentialSpec = _js2n__-prdslib.isType '"String",
                  gmsaCredentialSpecName = _js2n__-prdslib.isType '"String",
                  hostProcess = _js2n__-prdslib.isType '"Bool",
                  runAsUserName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "addresses" ],
              _js2n__-prdslib.records.record
                {
                  addresses =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  conditions = _js2n__-refsenv."_js2n__-:oneOf/368!predicate",
                  deprecatedTopology =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  hints = _js2n__-refsenv."_js2n__-:oneOf/369!predicate",
                  hostname = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  targetRef = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  zone = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ready = _js2n__-prdslib.isType '"Bool",
                  serving = _js2n__-prdslib.isType '"Bool",
                  terminating = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  forZones =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/373!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  appProtocol = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "addressType", "endpoints" ],
              _js2n__-prdslib.records.record
                {
                  addressType = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  endpoints =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/367!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EndpointSlice" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/370!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/371!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EndpointSliceList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "eventTime" ],
              _js2n__-prdslib.records.record
                {
                  action = _js2n__-prdslib.isType '"String",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  deprecatedCount = _js2n__-prdslib.isType 'Integer,
                  deprecatedFirstTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deprecatedLastTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deprecatedSource =
                    _js2n__-refsenv."_js2n__-:oneOf/219!predicate",
                  eventTime = _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Event" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  note = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  regarding = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  related = _js2n__-refsenv."_js2n__-:oneOf/270!predicate",
                  reportingController = _js2n__-prdslib.isType '"String",
                  reportingInstance = _js2n__-prdslib.isType '"String",
                  series = _js2n__-refsenv."_js2n__-:oneOf/376!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/374!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "EventList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "count", "lastObservedTime" ],
              _js2n__-prdslib.records.record
                {
                  count = _js2n__-prdslib.isType 'Integer,
                  lastObservedTime =
                    _js2n__-refsenv."_js2n__-:oneOf/557!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                { type = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchema" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/382!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/383!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/379!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchemaList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "priorityLevelConfiguration" ],
              _js2n__-prdslib.records.record
                {
                  distinguisherMethod =
                    _js2n__-refsenv."_js2n__-:oneOf/378!predicate",
                  matchingPrecedence = _js2n__-prdslib.isType 'Integer,
                  priorityLevelConfiguration =
                    _js2n__-refsenv."_js2n__-:oneOf/392!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/388!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/380!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  queuing = _js2n__-refsenv."_js2n__-:oneOf/395!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  borrowingLimitPercent = _js2n__-prdslib.isType 'Integer,
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  limitResponse =
                    _js2n__-refsenv."_js2n__-:oneOf/385!predicate",
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nonResourceURLs", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "subjects" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/387!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/396!predicate"
                        ],
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/398!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityLevelConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/393!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/394!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/389!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "PriorityLevelConfigurationList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  exempt = _js2n__-refsenv."_js2n__-:oneOf/377!predicate",
                  limited = _js2n__-refsenv."_js2n__-:oneOf/386!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/390!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  handSize = _js2n__-prdslib.isType 'Integer,
                  queueLengthLimit = _js2n__-prdslib.isType 'Integer,
                  queues = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiGroups", "resources", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clusterScope = _js2n__-prdslib.isType '"Bool",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-refsenv."_js2n__-:oneOf/384!predicate",
                  kind = _js2n__-prdslib.isType '"String",
                  serviceAccount =
                    _js2n__-refsenv."_js2n__-:oneOf/397!predicate",
                  user = _js2n__-refsenv."_js2n__-:oneOf/399!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                { type = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchema" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/405!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/406!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/402!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "FlowSchemaList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "priorityLevelConfiguration" ],
              _js2n__-prdslib.records.record
                {
                  distinguisherMethod =
                    _js2n__-refsenv."_js2n__-:oneOf/401!predicate",
                  matchingPrecedence = _js2n__-prdslib.isType 'Integer,
                  priorityLevelConfiguration =
                    _js2n__-refsenv."_js2n__-:oneOf/415!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/411!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/403!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  queuing = _js2n__-refsenv."_js2n__-:oneOf/418!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  borrowingLimitPercent = _js2n__-prdslib.isType 'Integer,
                  lendablePercent = _js2n__-prdslib.isType 'Integer,
                  limitResponse =
                    _js2n__-refsenv."_js2n__-:oneOf/408!predicate",
                  nominalConcurrencyShares = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "nonResourceURLs", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "subjects" ],
              _js2n__-prdslib.records.record
                {
                  nonResourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/410!predicate"
                        ],
                  resourceRules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/419!predicate"
                        ],
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/421!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityLevelConfiguration" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/416!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/417!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/412!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "PriorityLevelConfigurationList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "type" ],
              _js2n__-prdslib.records.record
                {
                  exempt = _js2n__-refsenv."_js2n__-:oneOf/400!predicate",
                  limited = _js2n__-refsenv."_js2n__-:oneOf/409!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/413!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  handSize = _js2n__-prdslib.isType 'Integer,
                  queueLengthLimit = _js2n__-prdslib.isType 'Integer,
                  queues = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiGroups", "resources", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  clusterScope = _js2n__-prdslib.isType '"Bool",
                  namespaces =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind" ],
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-refsenv."_js2n__-:oneOf/407!predicate",
                  kind = _js2n__-prdslib.isType '"String",
                  serviceAccount =
                    _js2n__-refsenv."_js2n__-:oneOf/420!predicate",
                  user = _js2n__-refsenv."_js2n__-:oneOf/422!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                { name = _js2n__-prdslib.isType '"String", } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "backend", "pathType" ],
              _js2n__-prdslib.records.record
                {
                  backend = _js2n__-refsenv."_js2n__-:oneOf/427!predicate",
                  path = _js2n__-prdslib.isType '"String",
                  pathType = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "paths" ],
              _js2n__-prdslib.records.record
                {
                  paths =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/423!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "cidr" ],
              _js2n__-prdslib.records.record
                {
                  cidr = _js2n__-prdslib.isType '"String",
                  except =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Ingress" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/438!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/439!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resource = _js2n__-refsenv."_js2n__-:oneOf/356!predicate",
                  service = _js2n__-refsenv."_js2n__-:oneOf/437!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IngressClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/431!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/428!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IngressClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  scope = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  controller = _js2n__-prdslib.isType '"String",
                  parameters = _js2n__-refsenv."_js2n__-:oneOf/430!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/426!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IngressList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hostname = _js2n__-prdslib.isType '"String",
                  ip = _js2n__-prdslib.isType '"String",
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/435!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/433!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "port", "protocol" ],
              _js2n__-prdslib.records.record
                {
                  error = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  host = _js2n__-prdslib.isType '"String",
                  http = _js2n__-refsenv."_js2n__-:oneOf/424!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  port = _js2n__-refsenv."_js2n__-:oneOf/448!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  defaultBackend =
                    _js2n__-refsenv."_js2n__-:oneOf/427!predicate",
                  ingressClassName = _js2n__-prdslib.isType '"String",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/436!predicate"
                        ],
                  tls =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/440!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  loadBalancer = _js2n__-refsenv."_js2n__-:oneOf/434!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  hosts =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  secretName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "NetworkPolicy" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/447!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/446!predicate"
                        ],
                  to =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/445!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  from =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/445!predicate"
                        ],
                  ports =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/446!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/441!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "NetworkPolicyList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  ipBlock = _js2n__-refsenv."_js2n__-:oneOf/425!predicate",
                  namespaceSelector =
                    _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  podSelector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  endPort = _js2n__-prdslib.isType 'Integer,
                  port = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  protocol = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "podSelector" ],
              _js2n__-prdslib.records.record
                {
                  egress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/442!predicate"
                        ],
                  ingress =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/443!predicate"
                        ],
                  podSelector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  policyTypes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  number = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IPAddress" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/451!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/449!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "IPAddressList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { parentRef = _js2n__-refsenv."_js2n__-:oneOf/452!predicate", }
                {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  group = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceCIDR" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/455!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/456!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/453!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ServiceCIDRList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  cidrs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  podFixed =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/543!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "handler" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  handler = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RuntimeClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  overhead = _js2n__-refsenv."_js2n__-:oneOf/457!predicate",
                  scheduling = _js2n__-refsenv."_js2n__-:oneOf/460!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/458!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RuntimeClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  nodeSelector =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  tolerations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/352!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  deleteOptions =
                    _js2n__-refsenv."_js2n__-:oneOf/550!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Eviction" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodDisruptionBudget" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/464!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/465!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/462!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodDisruptionBudgetList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  maxUnavailable =
                    _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  minAvailable = _js2n__-refsenv."_js2n__-:oneOf/569!predicate",
                  selector = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  unhealthyPodEvictionPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "currentHealthy",
                  "desiredHealthy",
                  "disruptionsAllowed",
                  "expectedPods"
                ],
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/549!predicate"
                        ],
                  currentHealthy = _js2n__-prdslib.isType 'Integer,
                  desiredHealthy = _js2n__-prdslib.isType 'Integer,
                  disruptedPods =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/566!predicate"
                        ],
                  disruptionsAllowed = _js2n__-prdslib.isType 'Integer,
                  expectedPods = _js2n__-prdslib.isType 'Integer,
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  clusterRoleSelectors =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/553!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  aggregationRule =
                    _js2n__-refsenv."_js2n__-:oneOf/466!predicate",
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRole" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/471!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "roleRef" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRoleBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  roleRef = _js2n__-refsenv."_js2n__-:oneOf/476!predicate",
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/477!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/468!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRoleBindingList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/467!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ClusterRoleList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "verbs" ],
              _js2n__-prdslib.records.record
                {
                  apiGroups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  nonResourceURLs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resourceNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Role" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  rules =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/471!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "roleRef" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RoleBinding" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  roleRef = _js2n__-refsenv."_js2n__-:oneOf/476!predicate",
                  subjects =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/477!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/473!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RoleBindingList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/472!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "RoleList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "apiGroup", "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  availableOnNodes =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                  resourceHandles =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/496!predicate"
                        ],
                  shareable = _js2n__-prdslib.isType '"Bool",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodSchedulingContext" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/481!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/482!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/479!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PodSchedulingContextList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  potentialNodes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  selectedNode = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceClaims =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/487!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaim" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/488!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/489!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "resource", "uid" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  resource = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/483!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaimList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  unsuitableNodes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "resourceClassName" ],
              _js2n__-prdslib.records.record
                {
                  allocationMode = _js2n__-prdslib.isType '"String",
                  parametersRef =
                    _js2n__-refsenv."_js2n__-:oneOf/486!predicate",
                  resourceClassName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  allocation = _js2n__-refsenv."_js2n__-:oneOf/478!predicate",
                  deallocationRequested = _js2n__-prdslib.isType '"Bool",
                  driverName = _js2n__-prdslib.isType '"String",
                  reservedFor =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/484!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaimTemplate" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/492!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/490!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClaimTemplateList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/488!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driverName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  parametersRef =
                    _js2n__-refsenv."_js2n__-:oneOf/495!predicate",
                  suitableNodes =
                    _js2n__-refsenv."_js2n__-:oneOf/263!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/493!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "ResourceClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "name" ],
              _js2n__-prdslib.records.record
                {
                  apiGroup = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  data = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "value" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  description = _js2n__-prdslib.isType '"String",
                  globalDefault = _js2n__-prdslib.isType '"Bool",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  preemptionPolicy = _js2n__-prdslib.isType '"String",
                  value = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/497!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "PriorityClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIDriver" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/501!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/499!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIDriverList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  attachRequired = _js2n__-prdslib.isType '"Bool",
                  fsGroupPolicy = _js2n__-prdslib.isType '"String",
                  podInfoOnMount = _js2n__-prdslib.isType '"Bool",
                  requiresRepublish = _js2n__-prdslib.isType '"Bool",
                  seLinuxMount = _js2n__-prdslib.isType '"Bool",
                  storageCapacity = _js2n__-prdslib.isType '"Bool",
                  tokenRequests =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/510!predicate"
                        ],
                  volumeLifecycleModes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSINode" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/505!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "nodeID" ],
              _js2n__-prdslib.records.record
                {
                  allocatable = _js2n__-refsenv."_js2n__-:oneOf/517!predicate",
                  name = _js2n__-prdslib.isType '"String",
                  nodeID = _js2n__-prdslib.isType '"String",
                  topologyKeys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/502!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSINodeList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "drivers" ],
              _js2n__-prdslib.records.record
                {
                  drivers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/503!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "storageClassName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  capacity = _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIStorageCapacity" ]
                        ],
                  maximumVolumeSize =
                    _js2n__-refsenv."_js2n__-:oneOf/543!predicate",
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  nodeTopology = _js2n__-refsenv."_js2n__-:oneOf/553!predicate",
                  storageClassName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/506!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CSIStorageCapacityList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "provisioner" ],
              _js2n__-prdslib.records.record
                {
                  allowVolumeExpansion = _js2n__-prdslib.isType '"Bool",
                  allowedTopologies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/354!predicate"
                        ],
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  mountOptions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  parameters =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  provisioner = _js2n__-prdslib.isType '"String",
                  reclaimPolicy = _js2n__-prdslib.isType '"String",
                  volumeBindingMode = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/508!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "StorageClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "audience" ],
              _js2n__-prdslib.records.record
                {
                  audience = _js2n__-prdslib.isType '"String",
                  expirationSeconds = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttachment" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/514!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/515!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/511!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttachmentList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  inlineVolumeSpec =
                    _js2n__-refsenv."_js2n__-:oneOf/280!predicate",
                  persistentVolumeName = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "attacher", "nodeName", "source" ],
              _js2n__-prdslib.records.record
                {
                  attacher = _js2n__-prdslib.isType '"String",
                  nodeName = _js2n__-prdslib.isType '"String",
                  source = _js2n__-refsenv."_js2n__-:oneOf/513!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "attached" ],
              _js2n__-prdslib.records.record
                {
                  attachError = _js2n__-refsenv."_js2n__-:oneOf/516!predicate",
                  attached = _js2n__-prdslib.isType '"Bool",
                  attachmentMetadata =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  detachError = _js2n__-refsenv."_js2n__-:oneOf/516!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  message = _js2n__-prdslib.isType '"String",
                  time = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                { count = _js2n__-prdslib.isType 'Integer, } {} false
                _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "driverName" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  driverName = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttributesClass" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  parameters =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/518!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "VolumeAttributesClassList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "jsonPath", "name", "type" ],
              _js2n__-prdslib.records.record
                {
                  description = _js2n__-prdslib.isType '"String",
                  format = _js2n__-prdslib.isType '"String",
                  jsonPath = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  "priority" = _js2n__-prdslib.isType 'Integer,
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "strategy" ],
              _js2n__-prdslib.records.record
                {
                  strategy = _js2n__-prdslib.isType '"String",
                  webhook = _js2n__-refsenv."_js2n__-:oneOf/542!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "spec" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "CustomResourceDefinition" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/526!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/527!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/522!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum
                            [ "CustomResourceDefinitionList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "kind", "plural" ],
              _js2n__-prdslib.records.record
                {
                  categories =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  kind = _js2n__-prdslib.isType '"String",
                  listKind = _js2n__-prdslib.isType '"String",
                  plural = _js2n__-prdslib.isType '"String",
                  shortNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  singular = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "group", "names", "scope", "versions" ],
              _js2n__-prdslib.records.record
                {
                  conversion = _js2n__-refsenv."_js2n__-:oneOf/521!predicate",
                  group = _js2n__-prdslib.isType '"String",
                  names = _js2n__-refsenv."_js2n__-:oneOf/525!predicate",
                  preserveUnknownFields = _js2n__-prdslib.isType '"Bool",
                  scope = _js2n__-prdslib.isType '"String",
                  versions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/528!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  acceptedNames =
                    _js2n__-refsenv."_js2n__-:oneOf/525!predicate",
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/523!predicate"
                        ],
                  storedVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "served", "storage" ],
              _js2n__-prdslib.records.record
                {
                  additionalPrinterColumns =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/520!predicate"
                        ],
                  deprecated = _js2n__-prdslib.isType '"Bool",
                  deprecationWarning = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  schema = _js2n__-refsenv."_js2n__-:oneOf/532!predicate",
                  served = _js2n__-prdslib.isType '"Bool",
                  storage = _js2n__-prdslib.isType '"Bool",
                  subresources = _js2n__-refsenv."_js2n__-:oneOf/531!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "specReplicasPath", "statusReplicasPath" ],
              _js2n__-prdslib.records.record
                {
                  labelSelectorPath = _js2n__-prdslib.isType '"String",
                  specReplicasPath = _js2n__-prdslib.isType '"String",
                  statusReplicasPath = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  scale = _js2n__-refsenv."_js2n__-:oneOf/529!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/530!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  openAPIV3Schema =
                    _js2n__-refsenv."_js2n__-:oneOf/535!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  description = _js2n__-prdslib.isType '"String",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.always,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  "$ref" = _js2n__-prdslib.isType '"String",
                  "$schema" = _js2n__-prdslib.isType '"String",
                  additionalItems =
                    _js2n__-refsenv."_js2n__-:oneOf/537!predicate",
                  additionalProperties =
                    _js2n__-refsenv."_js2n__-:oneOf/537!predicate",
                  allOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  anyOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  "default" = _js2n__-refsenv."_js2n__-:oneOf/534!predicate",
                  definitions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  dependencies =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/538!predicate"
                        ],
                  description = _js2n__-prdslib.isType '"String",
                  enum =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/534!predicate"
                        ],
                  example = _js2n__-refsenv."_js2n__-:oneOf/534!predicate",
                  exclusiveMaximum = _js2n__-prdslib.isType '"Bool",
                  exclusiveMinimum = _js2n__-prdslib.isType '"Bool",
                  externalDocs = _js2n__-refsenv."_js2n__-:oneOf/533!predicate",
                  format = _js2n__-prdslib.isType '"String",
                  id = _js2n__-prdslib.isType '"String",
                  items = _js2n__-refsenv."_js2n__-:oneOf/536!predicate",
                  maxItems = _js2n__-prdslib.isType 'Integer,
                  maxLength = _js2n__-prdslib.isType 'Integer,
                  maxProperties = _js2n__-prdslib.isType 'Integer,
                  maximum = _js2n__-prdslib.isType '"Number",
                  minItems = _js2n__-prdslib.isType 'Integer,
                  minLength = _js2n__-prdslib.isType 'Integer,
                  minProperties = _js2n__-prdslib.isType 'Integer,
                  minimum = _js2n__-prdslib.isType '"Number",
                  multipleOf = _js2n__-prdslib.isType '"Number",
                  not = _js2n__-refsenv."_js2n__-:oneOf/535!predicate",
                  nullable = _js2n__-prdslib.isType '"Bool",
                  oneOf =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  pattern = _js2n__-prdslib.isType '"String",
                  patternProperties =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  properties =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            _js2n__-refsenv."_js2n__-:oneOf/535!predicate"
                        ],
                  required =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  title = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                  uniqueItems = _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-embedded-resource =
                    _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-int-or-string = _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-list-map-keys =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  x-kubernetes-list-type = _js2n__-prdslib.isType '"String",
                  x-kubernetes-map-type = _js2n__-prdslib.isType '"String",
                  x-kubernetes-preserve-unknown-fields =
                    _js2n__-prdslib.isType '"Bool",
                  x-kubernetes-validations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/540!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.always,
          _js2n__-prdslib.always,
          _js2n__-prdslib.always,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "namespace" ],
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  path = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "rule" ],
              _js2n__-prdslib.records.record
                {
                  fieldPath = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  messageExpression = _js2n__-prdslib.isType '"String",
                  optionalOldSelf = _js2n__-prdslib.isType '"Bool",
                  reason = _js2n__-prdslib.isType '"String",
                  rule = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  service = _js2n__-refsenv."_js2n__-:oneOf/539!predicate",
                  url = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "conversionReviewVersions" ],
              _js2n__-prdslib.records.record
                {
                  clientConfig = _js2n__-refsenv."_js2n__-:oneOf/541!predicate",
                  conversionReviewVersions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.oneOf
            [
              _js2n__-prdslib.isType '"String",
              _js2n__-prdslib.isType '"Number"
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "name", "versions" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIGroup" ]
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  preferredVersion =
                    _js2n__-refsenv."_js2n__-:oneOf/552!predicate",
                  serverAddressByClientCIDRs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/562!predicate"
                        ],
                  versions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/552!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "groups" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  groups =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/544!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIGroupList" ]
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "kind", "name", "namespaced", "singularName", "verbs" ],
              _js2n__-prdslib.records.record
                {
                  categories =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  group = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  namespaced = _js2n__-prdslib.isType '"Bool",
                  shortNames =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  singularName = _js2n__-prdslib.isType '"String",
                  storageVersionHash = _js2n__-prdslib.isType '"String",
                  verbs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "groupVersion", "resources" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  groupVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIResourceList" ]
                        ],
                  resources =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/546!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "serverAddressByClientCIDRs", "versions" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIVersions" ]
                        ],
                  serverAddressByClientCIDRs =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/562!predicate"
                        ],
                  versions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "lastTransitionTime", "message", "reason", "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  observedGeneration = _js2n__-prdslib.isType 'Integer,
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  dryRun =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  gracePeriodSeconds = _js2n__-prdslib.isType 'Integer,
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "DeleteOptions" ]
                        ],
                  orphanDependents = _js2n__-prdslib.isType '"Bool",
                  preconditions =
                    _js2n__-refsenv."_js2n__-:oneOf/561!predicate",
                  propagationPolicy = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "groupVersion", "version" ],
              _js2n__-prdslib.records.record
                {
                  groupVersion = _js2n__-prdslib.isType '"String",
                  version = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  matchExpressions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/554!predicate"
                        ],
                  matchLabels =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "key", "operator" ],
              _js2n__-prdslib.records.record
                {
                  key = _js2n__-prdslib.isType '"String",
                  operator = _js2n__-prdslib.isType '"String",
                  values =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  continue = _js2n__-prdslib.isType '"String",
                  remainingItemCount = _js2n__-prdslib.isType 'Integer,
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  selfLink = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  fieldsType = _js2n__-prdslib.isType '"String",
                  fieldsV1 = _js2n__-refsenv."_js2n__-:oneOf/551!predicate",
                  manager = _js2n__-prdslib.isType '"String",
                  operation = _js2n__-prdslib.isType '"String",
                  subresource = _js2n__-prdslib.isType '"String",
                  time = _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType '"String",
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  annotations =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  creationTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  deletionGracePeriodSeconds = _js2n__-prdslib.isType 'Integer,
                  deletionTimestamp =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  finalizers =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.isType '"String")
                        ],
                  generateName = _js2n__-prdslib.isType '"String",
                  generation = _js2n__-prdslib.isType 'Integer,
                  labels =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType 'Record,
                          _js2n__-prdslib.records.record {} {} true
                            (_js2n__-prdslib.isType '"String")
                        ],
                  managedFields =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/556!predicate"
                        ],
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  ownerReferences =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/559!predicate"
                        ],
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  selfLink = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "apiVersion", "kind", "name", "uid" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  blockOwnerDeletion = _js2n__-prdslib.isType '"Bool",
                  controller = _js2n__-prdslib.isType '"Bool",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  resourceVersion = _js2n__-prdslib.isType '"String",
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "clientCIDR", "serverAddress" ],
              _js2n__-prdslib.records.record
                {
                  clientCIDR = _js2n__-prdslib.isType '"String",
                  serverAddress = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  code = _js2n__-prdslib.isType 'Integer,
                  details = _js2n__-refsenv."_js2n__-:oneOf/565!predicate",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "Status" ]
                        ],
                  message = _js2n__-prdslib.isType '"String",
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  field = _js2n__-prdslib.isType '"String",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  causes =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/564!predicate"
                        ],
                  group = _js2n__-prdslib.isType '"String",
                  kind = _js2n__-prdslib.isType '"String",
                  name = _js2n__-prdslib.isType '"String",
                  retryAfterSeconds = _js2n__-prdslib.isType 'Integer,
                  uid = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType '"String",
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "object", "type" ],
              _js2n__-prdslib.records.record
                {
                  object = _js2n__-refsenv."_js2n__-:oneOf/568!predicate",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.isType 'Record,
          _js2n__-prdslib.oneOf
            [
              _js2n__-prdslib.isType '"String",
              _js2n__-prdslib.isType 'Integer
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [
                  "buildDate",
                  "compiler",
                  "gitCommit",
                  "gitTreeState",
                  "gitVersion",
                  "goVersion",
                  "major",
                  "minor",
                  "platform"
                ],
              _js2n__-prdslib.records.record
                {
                  buildDate = _js2n__-prdslib.isType '"String",
                  compiler = _js2n__-prdslib.isType '"String",
                  gitCommit = _js2n__-prdslib.isType '"String",
                  gitTreeState = _js2n__-prdslib.isType '"String",
                  gitVersion = _js2n__-prdslib.isType '"String",
                  goVersion = _js2n__-prdslib.isType '"String",
                  major = _js2n__-prdslib.isType '"String",
                  minor = _js2n__-prdslib.isType '"String",
                  platform = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIService" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/558!predicate",
                  spec = _js2n__-refsenv."_js2n__-:oneOf/574!predicate",
                  status = _js2n__-refsenv."_js2n__-:oneOf/575!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "status", "type" ],
              _js2n__-prdslib.records.record
                {
                  lastTransitionTime =
                    _js2n__-refsenv."_js2n__-:oneOf/566!predicate",
                  message = _js2n__-prdslib.isType '"String",
                  reason = _js2n__-prdslib.isType '"String",
                  status = _js2n__-prdslib.isType '"String",
                  type = _js2n__-prdslib.isType '"String",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required [ "items" ],
              _js2n__-prdslib.records.record
                {
                  apiVersion = _js2n__-prdslib.isType '"String",
                  items =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/571!predicate"
                        ],
                  kind =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.enum [ "APIServiceList" ]
                        ],
                  metadata = _js2n__-refsenv."_js2n__-:oneOf/555!predicate",
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.required
                [ "groupPriorityMinimum", "versionPriority" ],
              _js2n__-prdslib.records.record
                {
                  caBundle = _js2n__-prdslib.isType '"String",
                  group = _js2n__-prdslib.isType '"String",
                  groupPriorityMinimum = _js2n__-prdslib.isType 'Integer,
                  insecureSkipTLSVerify = _js2n__-prdslib.isType '"Bool",
                  service = _js2n__-refsenv."_js2n__-:oneOf/576!predicate",
                  version = _js2n__-prdslib.isType '"String",
                  versionPriority = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  conditions =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.isType '"Array",
                          _js2n__-prdslib.arrays.arrayOf
                            _js2n__-refsenv."_js2n__-:oneOf/572!predicate"
                        ],
                } {} false _js2n__-prdslib.never
            ],
          _js2n__-prdslib.allOf
            [
              _js2n__-prdslib.isType 'Record,
              _js2n__-prdslib.records.record
                {
                  name = _js2n__-prdslib.isType '"String",
                  namespace = _js2n__-prdslib.isType '"String",
                  port = _js2n__-prdslib.isType 'Integer,
                } {} false _js2n__-prdslib.never
            ]
        ])