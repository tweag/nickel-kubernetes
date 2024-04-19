# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      status
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          status is the status of the ControllerModifyVolume operation. It can be in any of following states:
           - Pending
             Pending indicates that the PersistentVolumeClaim cannot be modified due to unmet requirements, such as
             the specified VolumeAttributesClass not existing.
           - InProgress
             InProgress indicates that the volume is being modified.
           - Infeasible
            Infeasible indicates that the request has been rejected as invalid by the CSI driver. To
          	  resolve the error, a valid VolumeAttributesClass needs to be specified.
          Note: New statuses can be added in the future. Consumers should check for unknown statuses and fail appropriately.
        "%,
      targetVolumeAttributesClassName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "targetVolumeAttributesClassName is the name of the VolumeAttributesClass the PVC currently being reconciled"
        | optional,
    }