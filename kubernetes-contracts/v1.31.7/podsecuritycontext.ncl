# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      appArmorProfile
        | js2n.Nullable
          { localhostProfile | js2n.Nullable String | optional, type | String }
        | optional,
      fsGroup | js2n.Nullable std.number.Integer | optional,
      fsGroupChangePolicy | js2n.Nullable String | optional,
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
      supplementalGroups
        | js2n.Nullable (Array (js2n.Nullable std.number.Integer))
        | optional,
      supplementalGroupsPolicy | js2n.Nullable String | optional,
      sysctls
        | js2n.Nullable
          (Array (js2n.Nullable { name | String, value | String }))
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