# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      awsElasticBlockStore
        | js2n.Nullable
          {
            fsType | js2n.Nullable String | optional,
            partition | js2n.Nullable std.number.Integer | optional,
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
            shareName | String
          }
        | optional,
      cephfs
        | js2n.Nullable
          {
            monitors | Array (js2n.Nullable String),
            path | js2n.Nullable String | optional,
            readOnly | js2n.Nullable Bool | optional,
            secretFile | js2n.Nullable String | optional,
            secretRef
              | js2n.Nullable { name | js2n.Nullable String | optional }
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
              | js2n.Nullable { name | js2n.Nullable String | optional }
              | optional,
            volumeID | String
          }
        | optional,
      configMap
        | js2n.Nullable
          {
            defaultMode | js2n.Nullable std.number.Integer | optional,
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      key | String,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String
                    }
                ))
              | optional,
            name | js2n.Nullable String | optional,
            "optional" | js2n.Nullable Bool | optional
          }
        | optional,
      csi
        | js2n.Nullable
          {
            driver | String,
            fsType | js2n.Nullable String | optional,
            nodePublishSecretRef
              | js2n.Nullable { name | js2n.Nullable String | optional }
              | optional,
            readOnly | js2n.Nullable Bool | optional,
            volumeAttributes
              | js2n.Nullable ({ _ | js2n.Nullable String })
              | optional
          }
        | optional,
      downwardAPI
        | js2n.Nullable
          {
            defaultMode | js2n.Nullable std.number.Integer | optional,
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      fieldRef
                        | js2n.Nullable
                          {
                            apiVersion | js2n.Nullable String | optional,
                            fieldPath | String
                          }
                        | optional,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String,
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
                        | optional
                    }
                ))
              | optional
          }
        | optional,
      emptyDir
        | js2n.Nullable
          {
            medium | js2n.Nullable String | optional,
            sizeLimit
              | js2n.OneOf [ js2n.Nullable String, js2n.Nullable Number ]
              | optional
          }
        | optional,
      ephemeral
        | js2n.Nullable
          {
            volumeClaimTemplate
              | js2n.Nullable
                {
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
                        generation
                          | js2n.Nullable std.number.Integer
                          | optional,
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
                                  fieldsV1
                                    | js2n.Nullable ({ _ | Dyn })
                                    | optional,
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
                      }
                    | optional,
                  spec
                    | {
                      accessModes
                        | js2n.Nullable (Array (js2n.Nullable String))
                        | optional,
                      dataSource
                        | js2n.Nullable
                          {
                            apiGroup | js2n.Nullable String | optional,
                            kind | String,
                            name | String
                          }
                        | optional,
                      dataSourceRef
                        | js2n.Nullable
                          {
                            apiGroup | js2n.Nullable String | optional,
                            kind | String,
                            name | String,
                            namespace | js2n.Nullable String | optional
                          }
                        | optional,
                      resources
                        | js2n.Nullable
                          {
                            limits
                              | js2n.Nullable
                                ({
                                  _ | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                })
                              | optional,
                            requests
                              | js2n.Nullable
                                ({
                                  _ | js2n.OneOf
                                    [
                                      js2n.Nullable String,
                                      js2n.Nullable Number
                                    ]
                                })
                              | optional
                          }
                        | optional,
                      selector
                        | js2n.Nullable
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
                                          (Array (js2n.Nullable String))
                                        | optional
                                    }
                                ))
                              | optional,
                            matchLabels
                              | js2n.Nullable ({ _ | js2n.Nullable String })
                              | optional
                          }
                        | optional,
                      storageClassName | js2n.Nullable String | optional,
                      volumeAttributesClassName
                        | js2n.Nullable String
                        | optional,
                      volumeMode | js2n.Nullable String | optional,
                      volumeName | js2n.Nullable String | optional
                    }
                }
              | optional
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
            wwids | js2n.Nullable (Array (js2n.Nullable String)) | optional
          }
        | optional,
      flexVolume
        | js2n.Nullable
          {
            driver | String,
            fsType | js2n.Nullable String | optional,
            options | js2n.Nullable ({ _ | js2n.Nullable String }) | optional,
            readOnly | js2n.Nullable Bool | optional,
            secretRef
              | js2n.Nullable { name | js2n.Nullable String | optional }
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
            partition | js2n.Nullable std.number.Integer | optional,
            pdName | String,
            readOnly | js2n.Nullable Bool | optional
          }
        | optional,
      gitRepo
        | js2n.Nullable
          {
            directory | js2n.Nullable String | optional,
            repository | String,
            revision | js2n.Nullable String | optional
          }
        | optional,
      glusterfs
        | js2n.Nullable
          {
            endpoints | String,
            path | String,
            readOnly | js2n.Nullable Bool | optional
          }
        | optional,
      hostPath
        | js2n.Nullable
          { path | String, type | js2n.Nullable String | optional }
        | optional,
      image
        | js2n.Nullable
          {
            pullPolicy | js2n.Nullable String | optional,
            reference | js2n.Nullable String | optional
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
            portals | js2n.Nullable (Array (js2n.Nullable String)) | optional,
            readOnly | js2n.Nullable Bool | optional,
            secretRef
              | js2n.Nullable { name | js2n.Nullable String | optional }
              | optional,
            targetPortal | String
          }
        | optional,
      name | js2n.Nullable String,
      nfs
        | js2n.Nullable
          {
            path | String,
            readOnly | js2n.Nullable Bool | optional,
            server | String
          }
        | optional,
      persistentVolumeClaim
        | js2n.Nullable
          { claimName | String, readOnly | js2n.Nullable Bool | optional }
        | optional,
      photonPersistentDisk
        | js2n.Nullable
          { fsType | js2n.Nullable String | optional, pdID | String }
        | optional,
      portworxVolume
        | js2n.Nullable
          {
            fsType | js2n.Nullable String | optional,
            readOnly | js2n.Nullable Bool | optional,
            volumeID | String
          }
        | optional,
      projected
        | js2n.Nullable
          {
            defaultMode | js2n.Nullable std.number.Integer | optional,
            sources
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      clusterTrustBundle
                        | js2n.Nullable
                          {
                            labelSelector
                              | js2n.Nullable
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
                                                (Array (js2n.Nullable String))
                                              | optional
                                          }
                                      ))
                                    | optional,
                                  matchLabels
                                    | js2n.Nullable
                                      ({ _ | js2n.Nullable String })
                                    | optional
                                }
                              | optional,
                            name | js2n.Nullable String | optional,
                            "optional" | js2n.Nullable Bool | optional,
                            path | String,
                            signerName | js2n.Nullable String | optional
                          }
                        | optional,
                      configMap
                        | js2n.Nullable
                          {
                            items
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      key | String,
                                      mode
                                        | js2n.Nullable std.number.Integer
                                        | optional,
                                      path | String
                                    }
                                ))
                              | optional,
                            name | js2n.Nullable String | optional,
                            "optional" | js2n.Nullable Bool | optional
                          }
                        | optional,
                      downwardAPI
                        | js2n.Nullable
                          {
                            items
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      fieldRef
                                        | js2n.Nullable
                                          {
                                            apiVersion
                                              | js2n.Nullable String
                                              | optional,
                                            fieldPath | String
                                          }
                                        | optional,
                                      mode
                                        | js2n.Nullable std.number.Integer
                                        | optional,
                                      path | String,
                                      resourceFieldRef
                                        | js2n.Nullable
                                          {
                                            containerName
                                              | js2n.Nullable String
                                              | optional,
                                            divisor
                                              | js2n.OneOf
                                                [
                                                  js2n.Nullable String,
                                                  js2n.Nullable Number
                                                ]
                                              | optional,
                                            resource | String
                                          }
                                        | optional
                                    }
                                ))
                              | optional
                          }
                        | optional,
                      podCertificate
                        | js2n.Nullable
                          {
                            certificateChainPath
                              | js2n.Nullable String
                              | optional,
                            credentialBundlePath
                              | js2n.Nullable String
                              | optional,
                            keyPath | js2n.Nullable String | optional,
                            keyType | String,
                            maxExpirationSeconds
                              | js2n.Nullable std.number.Integer
                              | optional,
                            signerName | String
                          }
                        | optional,
                      secret
                        | js2n.Nullable
                          {
                            items
                              | js2n.Nullable
                                (Array (
                                  js2n.Nullable
                                    {
                                      key | String,
                                      mode
                                        | js2n.Nullable std.number.Integer
                                        | optional,
                                      path | String
                                    }
                                ))
                              | optional,
                            name | js2n.Nullable String | optional,
                            "optional" | js2n.Nullable Bool | optional
                          }
                        | optional,
                      serviceAccountToken
                        | js2n.Nullable
                          {
                            audience | js2n.Nullable String | optional,
                            expirationSeconds
                              | js2n.Nullable std.number.Integer
                              | optional,
                            path | String
                          }
                        | optional
                    }
                ))
              | optional
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
              | js2n.Nullable { name | js2n.Nullable String | optional }
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
            secretRef | { name | js2n.Nullable String | optional },
            sslEnabled | js2n.Nullable Bool | optional,
            storageMode | js2n.Nullable String | optional,
            storagePool | js2n.Nullable String | optional,
            system | String,
            volumeName | js2n.Nullable String | optional
          }
        | optional,
      secret
        | js2n.Nullable
          {
            defaultMode | js2n.Nullable std.number.Integer | optional,
            items
              | js2n.Nullable
                (Array (
                  js2n.Nullable
                    {
                      key | String,
                      mode | js2n.Nullable std.number.Integer | optional,
                      path | String
                    }
                ))
              | optional,
            "optional" | js2n.Nullable Bool | optional,
            secretName | js2n.Nullable String | optional
          }
        | optional,
      storageos
        | js2n.Nullable
          {
            fsType | js2n.Nullable String | optional,
            readOnly | js2n.Nullable Bool | optional,
            secretRef
              | js2n.Nullable { name | js2n.Nullable String | optional }
              | optional,
            volumeName | js2n.Nullable String | optional,
            volumeNamespace | js2n.Nullable String | optional
          }
        | optional,
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