# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      chapAuthDiscovery | js2n.Nullable Bool | optional,
      chapAuthSession | js2n.Nullable Bool | optional,
      fsType | js2n.Nullable String | optional,
      initiatorName | js2n.Nullable String | optional,
      iqn | js2n.Nullable String,
      iscsiInterface | js2n.Nullable String | optional,
      lun | js2n.Nullable std.number.Integer,
      portals | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      readOnly | js2n.Nullable Bool | optional,
      secretRef
        | js2n.Nullable { name | js2n.Nullable String | optional }
        | optional,
      targetPortal | js2n.Nullable String
    }