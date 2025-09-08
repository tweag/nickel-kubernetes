# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      allowPrivilegeEscalation | js2n.Nullable Bool | optional,
      appArmorProfile
        | js2n.Nullable
          { localhostProfile | js2n.Nullable String | optional, type | String }
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
          { localhostProfile | js2n.Nullable String | optional, type | String }
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