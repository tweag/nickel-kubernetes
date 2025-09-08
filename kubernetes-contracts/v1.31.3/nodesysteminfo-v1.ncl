# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs = {} in
  {
      architecture | js2n.Nullable String,
      bootID | js2n.Nullable String,
      containerRuntimeVersion | js2n.Nullable String,
      kernelVersion | js2n.Nullable String,
      kubeProxyVersion | js2n.Nullable String,
      kubeletVersion | js2n.Nullable String,
      machineID | js2n.Nullable String,
      operatingSystem | js2n.Nullable String,
      osImage | js2n.Nullable String,
      systemUUID | js2n.Nullable String
    }