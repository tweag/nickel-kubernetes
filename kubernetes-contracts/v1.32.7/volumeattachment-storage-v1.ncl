# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| '"storage.k8s.io/v1" |] | optional,
      kind | std.enum.TagOrString | [| 'VolumeAttachment |] | optional,
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
            attacher | String,
            nodeName | String,
            source
              | {
                inlineVolumeSpec
                  | js2n.Nullable
                    {
                      accessModes
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      awsElasticBlockStore
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            partition
                              | js2n.Nullable std.number.Integer
                              | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            volumeID | String
                          }
                        | optional,
                      azureDisk
                        | js2n.Nullable
                          {
                            cachingMode | js2n.Nullable String | optional,
                            diskName | String,
                            diskURI | String,
                            fsType | js2n.Nullable String | optional,
                            kind | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional
                          }
                        | optional,
                      azureFile
                        | js2n.Nullable
                          {
                            readOnly | js2n.Nullable Bool | optional,
                            secretName | String,
                            secretNamespace | js2n.Nullable String | optional,
                            shareName | String
                          }
                        | optional,
                      capacity
                        | js2n.Nullable
                          ({
                            _ | js2n.OneOf
                              [ js2n.Nullable String, js2n.Nullable Number ]
                          })
                        | optional,
                      cephfs
                        | js2n.Nullable
                          {
                            monitors | Array (js2n.Nullable String),
                            path | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretFile | js2n.Nullable String | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            user | js2n.Nullable String | optional
                          }
                        | optional,
                      cinder
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            volumeID | String
                          }
                        | optional,
                      claimRef
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
                      csi
                        | js2n.Nullable
                          {
                            controllerExpandSecretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            controllerPublishSecretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            driver | String,
                            fsType | js2n.Nullable String | optional,
                            nodeExpandSecretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            nodePublishSecretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            nodeStageSecretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            volumeAttributes
                              | js2n.Nullable ({ _ | js2n.Nullable String })
                              | optional,
                            volumeHandle | String
                          }
                        | optional,
                      fc
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            lun | js2n.Nullable std.number.Integer | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            targetWWNs
                              | js2n.Nullable (Array (js2n.Nullable String))
                              | optional,
                            wwids
                              | js2n.Nullable (Array (js2n.Nullable String))
                              | optional
                          }
                        | optional,
                      flexVolume
                        | js2n.Nullable
                          {
                            driver | String,
                            fsType | js2n.Nullable String | optional,
                            options
                              | js2n.Nullable ({ _ | js2n.Nullable String })
                              | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional
                          }
                        | optional,
                      flocker
                        | js2n.Nullable
                          {
                            datasetName | js2n.Nullable String | optional,
                            datasetUUID | js2n.Nullable String | optional
                          }
                        | optional,
                      gcePersistentDisk
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            partition
                              | js2n.Nullable std.number.Integer
                              | optional,
                            pdName | String,
                            readOnly | js2n.Nullable Bool | optional
                          }
                        | optional,
                      glusterfs
                        | js2n.Nullable
                          {
                            endpoints | String,
                            endpointsNamespace
                              | js2n.Nullable String
                              | optional,
                            path | String,
                            readOnly | js2n.Nullable Bool | optional
                          }
                        | optional,
                      hostPath
                        | js2n.Nullable
                          {
                            path | String,
                            type | js2n.Nullable String | optional
                          }
                        | optional,
                      iscsi
                        | js2n.Nullable
                          {
                            chapAuthDiscovery | js2n.Nullable Bool | optional,
                            chapAuthSession | js2n.Nullable Bool | optional,
                            fsType | js2n.Nullable String | optional,
                            initiatorName | js2n.Nullable String | optional,
                            iqn | String,
                            iscsiInterface | js2n.Nullable String | optional,
                            lun | std.number.Integer,
                            portals
                              | js2n.Nullable (Array (js2n.Nullable String))
                              | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            targetPortal | String
                          }
                        | optional,
                      local
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            path | String
                          }
                        | optional,
                      mountOptions
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      nfs
                        | js2n.Nullable
                          {
                            path | String,
                            readOnly | js2n.Nullable Bool | optional,
                            server | String
                          }
                        | optional,
                      nodeAffinity
                        | js2n.Nullable
                          {
                            required
                              | js2n.Nullable
                                {
                                  nodeSelectorTerms
                                    | Array (
                                      js2n.Nullable
                                        {
                                          matchExpressions
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    key | String,
                                                    operator | String,
                                                    values
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional
                                                  }
                                              ))
                                            | optional,
                                          matchFields
                                            | js2n.Nullable
                                              (Array (
                                                js2n.Nullable
                                                  {
                                                    key | String,
                                                    operator | String,
                                                    values
                                                      | js2n.Nullable
                                                        (Array (
                                                          js2n.Nullable String
                                                        ))
                                                      | optional
                                                  }
                                              ))
                                            | optional
                                        }
                                    )
                                }
                              | optional
                          }
                        | optional,
                      persistentVolumeReclaimPolicy
                        | js2n.Nullable String
                        | optional,
                      photonPersistentDisk
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            pdID | String
                          }
                        | optional,
                      portworxVolume
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            volumeID | String
                          }
                        | optional,
                      quobyte
                        | js2n.Nullable
                          {
                            group | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            registry | String,
                            tenant | js2n.Nullable String | optional,
                            user | js2n.Nullable String | optional,
                            volume | String
                          }
                        | optional,
                      rbd
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            image | String,
                            keyring | js2n.Nullable String | optional,
                            monitors | Array (js2n.Nullable String),
                            pool | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional
                                }
                              | optional,
                            user | js2n.Nullable String | optional
                          }
                        | optional,
                      scaleIO
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            gateway | String,
                            protectionDomain | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | {
                                name | js2n.Nullable String | optional,
                                namespace | js2n.Nullable String | optional
                              },
                            sslEnabled | js2n.Nullable Bool | optional,
                            storageMode | js2n.Nullable String | optional,
                            storagePool | js2n.Nullable String | optional,
                            system | String,
                            volumeName | js2n.Nullable String | optional
                          }
                        | optional,
                      storageClassName | js2n.Nullable String | optional,
                      storageos
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            readOnly | js2n.Nullable Bool | optional,
                            secretRef
                              | js2n.Nullable
                                {
                                  apiVersion | js2n.Nullable String | optional,
                                  fieldPath | js2n.Nullable String | optional,
                                  kind | js2n.Nullable String | optional,
                                  name | js2n.Nullable String | optional,
                                  namespace | js2n.Nullable String | optional,
                                  resourceVersion
                                    | js2n.Nullable String
                                    | optional,
                                  uid | js2n.Nullable String | optional
                                }
                              | optional,
                            volumeName | js2n.Nullable String | optional,
                            volumeNamespace | js2n.Nullable String | optional
                          }
                        | optional,
                      volumeAttributesClassName
                        | js2n.Nullable String
                        | optional,
                      volumeMode | js2n.Nullable String | optional,
                      vsphereVolume
                        | js2n.Nullable
                          {
                            fsType | js2n.Nullable String | optional,
                            storagePolicyID | js2n.Nullable String | optional,
                            storagePolicyName | js2n.Nullable String | optional,
                            volumePath | String
                          }
                        | optional
                    }
                  | optional,
                persistentVolumeName | js2n.Nullable String | optional
              }
          },
      status
        | js2n.Nullable
          {
            attachError
              | js2n.Nullable
                {
                  message | js2n.Nullable String | optional,
                  time | js2n.Nullable String | optional
                }
              | optional,
            attached | Bool,
            attachmentMetadata
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional,
            detachError
              | js2n.Nullable
                {
                  message | js2n.Nullable String | optional,
                  time | js2n.Nullable String | optional
                }
              | optional
          }
        | optional
    }