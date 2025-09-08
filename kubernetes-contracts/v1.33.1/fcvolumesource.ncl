# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      fsType | js2n.Nullable String | optional,
      lun | js2n.Nullable std.number.Integer | optional,
      readOnly | js2n.Nullable Bool | optional,
      targetWWNs | js2n.Nullable (Array (js2n.Nullable String)) | optional,
      wwids | js2n.Nullable (Array (js2n.Nullable String)) | optional
    }