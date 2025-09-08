# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      apiVersion | std.enum.TagOrString | [| '"policy/v1" |] | optional,
      deleteOptions
        | js2n.Nullable
          {
            apiVersion
              | std.enum.TagOrString
              | [|
                '"storagemigration.k8s.io/v1alpha1",
                '"storage.k8s.io/v1beta1",
                '"storage.k8s.io/v1alpha1",
                '"storage.k8s.io/v1",
                '"scheduling.k8s.io/v1beta1",
                '"scheduling.k8s.io/v1alpha1",
                '"scheduling.k8s.io/v1",
                '"resource.k8s.io/v1beta2",
                '"resource.k8s.io/v1beta1",
                '"resource.k8s.io/v1alpha3",
                '"resource.k8s.io/v1",
                '"rbac.authorization.k8s.io/v1beta1",
                '"rbac.authorization.k8s.io/v1alpha1",
                '"rbac.authorization.k8s.io/v1",
                '"policy/v1beta1",
                '"policy/v1",
                '"node.k8s.io/v1beta1",
                '"node.k8s.io/v1alpha1",
                '"node.k8s.io/v1",
                '"networking.k8s.io/v1beta1",
                '"networking.k8s.io/v1",
                '"internal.apiserver.k8s.io/v1alpha1",
                '"imagepolicy.k8s.io/v1alpha1",
                '"flowcontrol.apiserver.k8s.io/v1beta3",
                '"flowcontrol.apiserver.k8s.io/v1beta2",
                '"flowcontrol.apiserver.k8s.io/v1beta1",
                '"flowcontrol.apiserver.k8s.io/v1",
                '"extensions/v1beta1",
                '"events.k8s.io/v1beta1",
                '"events.k8s.io/v1",
                '"discovery.k8s.io/v1beta1",
                '"discovery.k8s.io/v1",
                '"coordination.k8s.io/v1beta1",
                '"coordination.k8s.io/v1alpha2",
                '"coordination.k8s.io/v1",
                '"certificates.k8s.io/v1beta1",
                '"certificates.k8s.io/v1alpha1",
                '"certificates.k8s.io/v1",
                '"batch/v1beta1",
                '"batch/v1",
                '"autoscaling/v2beta2",
                '"autoscaling/v2beta1",
                '"autoscaling/v2",
                '"autoscaling/v1",
                '"authorization.k8s.io/v1beta1",
                '"authorization.k8s.io/v1",
                '"authentication.k8s.io/v1beta1",
                '"authentication.k8s.io/v1alpha1",
                '"authentication.k8s.io/v1",
                '"apps/v1beta2",
                '"apps/v1beta1",
                '"apps/v1",
                '"apiregistration.k8s.io/v1beta1",
                '"apiregistration.k8s.io/v1",
                '"apiextensions.k8s.io/v1beta1",
                '"apiextensions.k8s.io/v1",
                '"admissionregistration.k8s.io/v1beta1",
                '"admissionregistration.k8s.io/v1alpha1",
                '"admissionregistration.k8s.io/v1",
                '"admission.k8s.io/v1beta1",
                '"admission.k8s.io/v1",
                'v1
              |]
              | optional,
            dryRun | js2n.Nullable (Array (js2n.Nullable String)) | optional,
            gracePeriodSeconds | js2n.Nullable std.number.Integer | optional,
            ignoreStoreReadErrorWithClusterBreakingPotential
              | js2n.Nullable Bool
              | optional,
            kind | std.enum.TagOrString | [| 'DeleteOptions |] | optional,
            orphanDependents | js2n.Nullable Bool | optional,
            preconditions
              | js2n.Nullable
                {
                  resourceVersion | js2n.Nullable String | optional,
                  uid | js2n.Nullable String | optional
                }
              | optional,
            propagationPolicy | js2n.Nullable String | optional
          }
        | optional,
      kind | std.enum.TagOrString | [| 'Eviction |] | optional,
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
        | optional
    }