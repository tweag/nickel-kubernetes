# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      collisionCount
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision."
        | optional,
      conditions
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType '"Array",
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.arrays.arrayOf
                (_js2n__-prdslib.allOf
                  [
                    _js2n__-prdslib.anyOf
                      [
                        _js2n__-prdslib.isType 'Record,
                        _js2n__-prdslib.isType 'Null
                      ],
                    _js2n__-prdslib.records.required [ "status", "type" ],
                    _js2n__-prdslib.records.record
                      {
                        lastTransitionTime =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        message =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        reason =
                          _js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ],
                        status = _js2n__-prdslib.isType '"String",
                        type = _js2n__-prdslib.isType '"String",
                      } {} false _js2n__-prdslib.never
                  ])
            ])
        | doc "Represents the latest available observations of a DaemonSet's current state."
        | optional,
      currentNumberScheduled
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/",
      desiredNumberScheduled
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/",
      numberAvailable
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)"
        | optional,
      numberMisscheduled
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/",
      numberReady
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "numberReady is the number of nodes that should be running the daemon pod and have one or more of the daemon pod running with a Ready Condition.",
      numberUnavailable
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)"
        | optional,
      observedGeneration
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The most recent generation observed by the daemon set controller."
        | optional,
      updatedNumberScheduled
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "The total number of nodes that are running updated daemon pod"
        | optional,
    }