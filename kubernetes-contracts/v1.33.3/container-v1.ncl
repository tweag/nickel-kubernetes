# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      args | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      command | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      env
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                name | String,
                value | js2n.Nullable String | optional,
                valueFrom
                  | js2n.Nullable
                    {
                      configMapKeyRef
                        | js2n.Nullable
                          {
                            key | String,
                            name | js2n.Nullable String | optional,
                            "optional" | js2n.Nullable Bool | optional
                          }
                        | optional,
                      fieldRef
                        | js2n.Nullable
                          {
                            apiVersion | js2n.Nullable String | optional,
                            fieldPath | String
                          }
                        | optional,
                      resourceFieldRef
                        | js2n.Nullable
                          {
                            containerName | js2n.Nullable String | optional,
                            divisor
                              | js2n.OneOf
                                [ js2n.Nullable String, js2n.Nullable Number ]
                              | optional,
                            resource | String
                          }
                        | optional,
                      secretKeyRef
                        | js2n.Nullable
                          {
                            key | String,
                            name | js2n.Nullable String | optional,
                            "optional" | js2n.Nullable Bool | optional
                          }
                        | optional
                    }
                  | optional
              }
          ))
        | optional,
      envFrom
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                configMapRef
                  | js2n.Nullable
                    {
                      name | js2n.Nullable String | optional,
                      "optional" | js2n.Nullable Bool | optional
                    }
                  | optional,
                prefix | js2n.Nullable String | optional,
                secretRef
                  | js2n.Nullable
                    {
                      name | js2n.Nullable String | optional,
                      "optional" | js2n.Nullable Bool | optional
                    }
                  | optional
              }
          ))
        | optional,
      image | js2n.Nullable String | optional,
      imagePullPolicy | js2n.Nullable String | optional,
      lifecycle
        | js2n.Nullable
          {
            postStart
              | js2n.Nullable
                {
                  exec
                    | js2n.Nullable
                      {
                        command
                          | js2n.Nullable (Array (js2n.Nullable String))
                          | optional
                      }
                    | optional,
                  httpGet
                    | js2n.Nullable
                      {
                        host | js2n.Nullable String | optional,
                        httpHeaders
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable { name | String, value | String }
                            ))
                          | optional,
                        path | js2n.Nullable String | optional,
                        port
                          | js2n.OneOf
                            [
                              js2n.Nullable String,
                              js2n.Nullable std.number.Integer
                            ],
                        scheme | js2n.Nullable String | optional
                      }
                    | optional,
                  sleep
                    | js2n.Nullable { seconds | std.number.Integer }
                    | optional,
                  tcpSocket
                    | js2n.Nullable
                      {
                        host | js2n.Nullable String | optional,
                        port
                          | js2n.OneOf
                            [
                              js2n.Nullable String,
                              js2n.Nullable std.number.Integer
                            ]
                      }
                    | optional
                }
              | optional,
            preStop
              | js2n.Nullable
                {
                  exec
                    | js2n.Nullable
                      {
                        command
                          | js2n.Nullable (Array (js2n.Nullable String))
                          | optional
                      }
                    | optional,
                  httpGet
                    | js2n.Nullable
                      {
                        host | js2n.Nullable String | optional,
                        httpHeaders
                          | js2n.Nullable
                            (Array (
                              js2n.Nullable { name | String, value | String }
                            ))
                          | optional,
                        path | js2n.Nullable String | optional,
                        port
                          | js2n.OneOf
                            [
                              js2n.Nullable String,
                              js2n.Nullable std.number.Integer
                            ],
                        scheme | js2n.Nullable String | optional
                      }
                    | optional,
                  sleep
                    | js2n.Nullable { seconds | std.number.Integer }
                    | optional,
                  tcpSocket
                    | js2n.Nullable
                      {
                        host | js2n.Nullable String | optional,
                        port
                          | js2n.OneOf
                            [
                              js2n.Nullable String,
                              js2n.Nullable std.number.Integer
                            ]
                      }
                    | optional
                }
              | optional,
            stopSignal | js2n.Nullable String | optional
          }
        | optional,
      livenessProbe
        | js2n.Nullable
          {
            exec
              | js2n.Nullable
                {
                  command
                    | js2n.Nullable (Array (js2n.Nullable String))
                    | optional
                }
              | optional,
            failureThreshold | js2n.Nullable std.number.Integer | optional,
            grpc
              | js2n.Nullable
                {
                  port | std.number.Integer,
                  service | js2n.Nullable String | optional
                }
              | optional,
            httpGet
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  httpHeaders
                    | js2n.Nullable
                      (Array (js2n.Nullable { name | String, value | String }))
                    | optional,
                  path | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [
                        js2n.Nullable String,
                        js2n.Nullable std.number.Integer
                      ],
                  scheme | js2n.Nullable String | optional
                }
              | optional,
            initialDelaySeconds | js2n.Nullable std.number.Integer | optional,
            periodSeconds | js2n.Nullable std.number.Integer | optional,
            successThreshold | js2n.Nullable std.number.Integer | optional,
            tcpSocket
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
                }
              | optional,
            terminationGracePeriodSeconds
              | js2n.Nullable std.number.Integer
              | optional,
            timeoutSeconds | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      name | js2n.Nullable String,
      ports
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                containerPort | std.number.Integer,
                hostIP | js2n.Nullable String | optional,
                hostPort | js2n.Nullable std.number.Integer | optional,
                name | js2n.Nullable String | optional,
                protocol | js2n.Nullable String | optional
              }
          ))
        | optional,
      readinessProbe
        | js2n.Nullable
          {
            exec
              | js2n.Nullable
                {
                  command
                    | js2n.Nullable (Array (js2n.Nullable String))
                    | optional
                }
              | optional,
            failureThreshold | js2n.Nullable std.number.Integer | optional,
            grpc
              | js2n.Nullable
                {
                  port | std.number.Integer,
                  service | js2n.Nullable String | optional
                }
              | optional,
            httpGet
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  httpHeaders
                    | js2n.Nullable
                      (Array (js2n.Nullable { name | String, value | String }))
                    | optional,
                  path | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [
                        js2n.Nullable String,
                        js2n.Nullable std.number.Integer
                      ],
                  scheme | js2n.Nullable String | optional
                }
              | optional,
            initialDelaySeconds | js2n.Nullable std.number.Integer | optional,
            periodSeconds | js2n.Nullable std.number.Integer | optional,
            successThreshold | js2n.Nullable std.number.Integer | optional,
            tcpSocket
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
                }
              | optional,
            terminationGracePeriodSeconds
              | js2n.Nullable std.number.Integer
              | optional,
            timeoutSeconds | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      resizePolicy
        | js2n.Nullable
          (Array (
            js2n.Nullable { resourceName | String, restartPolicy | String }
          ))
        | optional,
      resources
        | js2n.Nullable
          {
            claims
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    { name | String, request | js2n.Nullable String | optional }
                ))
              | optional,
            limits
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional,
            requests
              | js2n.Nullable
                ({
                  _ | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
                })
              | optional
          }
        | optional,
      restartPolicy | js2n.Nullable String | optional,
      securityContext
        | js2n.Nullable
          {
            allowPrivilegeEscalation | js2n.Nullable Bool | optional,
            appArmorProfile
              | js2n.Nullable
                {
                  localhostProfile | js2n.Nullable String | optional,
                  type | String
                }
              | optional,
            capabilities
              | js2n.Nullable
                {
                  add | js2n.Nullable (Array (js2n.Nullable String)) | optional,
                  drop | js2n.Nullable (Array (js2n.Nullable String)) | optional
                }
              | optional,
            privileged | js2n.Nullable Bool | optional,
            procMount | js2n.Nullable String | optional,
            readOnlyRootFilesystem | js2n.Nullable Bool | optional,
            runAsGroup | js2n.Nullable std.number.Integer | optional,
            runAsNonRoot | js2n.Nullable Bool | optional,
            runAsUser | js2n.Nullable std.number.Integer | optional,
            seLinuxOptions
              | js2n.Nullable
                {
                  level | js2n.Nullable String | optional,
                  role | js2n.Nullable String | optional,
                  type | js2n.Nullable String | optional,
                  user | js2n.Nullable String | optional
                }
              | optional,
            seccompProfile
              | js2n.Nullable
                {
                  localhostProfile | js2n.Nullable String | optional,
                  type | String
                }
              | optional,
            windowsOptions
              | js2n.Nullable
                {
                  gmsaCredentialSpec | js2n.Nullable String | optional,
                  gmsaCredentialSpecName | js2n.Nullable String | optional,
                  hostProcess | js2n.Nullable Bool | optional,
                  runAsUserName | js2n.Nullable String | optional
                }
              | optional
          }
        | optional,
      startupProbe
        | js2n.Nullable
          {
            exec
              | js2n.Nullable
                {
                  command
                    | js2n.Nullable (Array (js2n.Nullable String))
                    | optional
                }
              | optional,
            failureThreshold | js2n.Nullable std.number.Integer | optional,
            grpc
              | js2n.Nullable
                {
                  port | std.number.Integer,
                  service | js2n.Nullable String | optional
                }
              | optional,
            httpGet
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  httpHeaders
                    | js2n.Nullable
                      (Array (js2n.Nullable { name | String, value | String }))
                    | optional,
                  path | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [
                        js2n.Nullable String,
                        js2n.Nullable std.number.Integer
                      ],
                  scheme | js2n.Nullable String | optional
                }
              | optional,
            initialDelaySeconds | js2n.Nullable std.number.Integer | optional,
            periodSeconds | js2n.Nullable std.number.Integer | optional,
            successThreshold | js2n.Nullable std.number.Integer | optional,
            tcpSocket
              | js2n.Nullable
                {
                  host | js2n.Nullable String | optional,
                  port
                    | js2n.OneOf
                      [ js2n.Nullable String, js2n.Nullable std.number.Integer ]
                }
              | optional,
            terminationGracePeriodSeconds
              | js2n.Nullable std.number.Integer
              | optional,
            timeoutSeconds | js2n.Nullable std.number.Integer | optional
          }
        | optional,
      stdin | js2n.Nullable Bool | optional,
      stdinOnce | js2n.Nullable Bool | optional,
      terminationMessagePath | js2n.Nullable String | optional,
      terminationMessagePolicy | js2n.Nullable String | optional,
      tty | js2n.Nullable Bool | optional,
      volumeDevices
        | js2n.Nullable
          (Array (js2n.Nullable { devicePath | String, name | String }))
        | optional,
      volumeMounts
        | js2n.Nullable
          (Array (
            js2n.Nullable
              {
                mountPath | String,
                mountPropagation | js2n.Nullable String | optional,
                name | String,
                readOnly | js2n.Nullable Bool | optional,
                recursiveReadOnly | js2n.Nullable String | optional,
                subPath | js2n.Nullable String | optional,
                subPathExpr | js2n.Nullable String | optional
              }
          ))
        | optional,
      workingDir | js2n.Nullable String | optional
    }