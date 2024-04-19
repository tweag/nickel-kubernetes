# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let _js2n__-prdslib
  = import ".js2n-lib/predicates.ncl"
  in
let rec _js2n__-refsenv
    = {}
    in
  {
      resourceClaimName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc "ResourceClaimName is the name of a ResourceClaim object in the same namespace as this pod."
        | optional,
      resourceClaimTemplateName
        | _js2n__-prdslib.contract_from_predicate
          (_js2n__-prdslib.anyOf
            [ _js2n__-prdslib.isType '"String", _js2n__-prdslib.isType 'Null ])
        | doc m%"
          ResourceClaimTemplateName is the name of a ResourceClaimTemplate object in the same namespace as this pod.
          
          The template will be used to create a new ResourceClaim, which will be bound to this pod. When this pod is deleted, the ResourceClaim will also be deleted. The pod name and resource name, along with a generated component, will be used to form a unique name for the ResourceClaim, which will be recorded in pod.status.resourceClaimStatuses.
          
          This field is immutable and no changes will be made to the corresponding ResourceClaim by the control plane after creating the ResourceClaim.
        "%
        | optional,
    }