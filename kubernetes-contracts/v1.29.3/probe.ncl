# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      exec
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.record
                {
                  command =
                    _js2n__-prdslib.allOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"Array",
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.arrays.arrayOf
                            (_js2n__-prdslib.anyOf
                              [
                                _js2n__-prdslib.isType '"String",
                                _js2n__-prdslib.isType 'Null
                              ])
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "ExecAction describes a \"run in container\" action."
        | optional,
      failureThreshold
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
        | optional,
      grpc
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  port = _js2n__-prdslib.isType 'Integer,
                  service =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | optional,
      httpGet
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  httpHeaders =
                    _js2n__-prdslib.allOf
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
                                _js2n__-prdslib.records.required
                                  [ "name", "value" ],
                                _js2n__-prdslib.records.record
                                  {
                                    name = _js2n__-prdslib.isType '"String",
                                    value = _js2n__-prdslib.isType '"String",
                                  } {} false _js2n__-prdslib.never
                              ])
                        ],
                  path =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  port =
                    _js2n__-prdslib.oneOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Integer,
                              _js2n__-prdslib.isType 'Null
                            ]
                        ],
                  scheme =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "HTTPGetAction describes an action based on HTTP Get requests."
        | optional,
      initialDelaySeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
        | optional,
      periodSeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
        | optional,
      successThreshold
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
        | optional,
      tcpSocket
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.allOf
            [
              _js2n__-prdslib.anyOf
                [
                  _js2n__-prdslib.isType 'Record,
                  _js2n__-prdslib.isType 'Null
                ],
              _js2n__-prdslib.records.required [ "port" ],
              _js2n__-prdslib.records.record
                {
                  host =
                    _js2n__-prdslib.anyOf
                        [
                          _js2n__-prdslib.isType '"String",
                          _js2n__-prdslib.isType 'Null
                        ],
                  port =
                    _js2n__-prdslib.oneOf
                        [
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType '"String",
                              _js2n__-prdslib.isType 'Null
                            ],
                          _js2n__-prdslib.anyOf
                            [
                              _js2n__-prdslib.isType 'Integer,
                              _js2n__-prdslib.isType 'Null
                            ]
                        ],
                } {} false _js2n__-prdslib.never
            ])
        | doc "TCPSocketAction describes an action based on opening a socket"
        | optional,
      terminationGracePeriodSeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Optional duration in seconds the pod needs to terminate gracefully upon probe failure. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. If this value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value overrides the value provided by the pod spec. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate. Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset."
        | optional,
      timeoutSeconds
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType 'Integer, _js2n__-prdslib.isType 'Null ])
        | doc "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
        | optional,
    }