# `nickel-kubernetes`

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This repository contains [Nickel](https://github.com/tweag/nickel) definitions of [Kubernetes](https://github.com/kubernetes/kubernetes) resources, allowing easy expression of k8s entities in Nickel language. Never write a yaml spaghetti again!

## Roadmap

- [x] Generate nickel definitions out of Kubernetes openapi manifests
- [x] Generate nickel definitions out of Argo Workflows openapi manifests
- [ ] Differentiate between required and optional fields of k8s objects (otherwise schemas are nearly useless in real-life scenarios, as well as constructing minimal object from default values in made much harder; **gated by** [Nickel issue #373](https://github.com/tweag/nickel/issues/373))
- [ ] Make sure k8s schemas disallow adding fields not defined in said schemas (otherwise the result is too sensitive to typos in field names; **gated by** [Nickel issue #303](https://github.com/tweag/nickel/issues/303))
- [ ] Provide appropriate default values, allowing for easy construction of minimal, viable k8s objects (**gated by** not having optional fields)
- [ ] Expand the testing suite
- [ ] Enrich constraints imposed by openapi specs (they are far too lenient - i.e. make sure that ip addresses are actual ip addresses)
- [ ] Enrich constraints with descriptions obtained from openapi specs

## Pre-requirements
[Nix](https://nixos.org/download.html) package manager with [flakes](https://nixos.wiki/wiki/Flakes#Non-NixOS) enabled.

## Generating nickel definitions
```
$ ./scripts/regenerate-defs.sh
# or
$ nix build
```

## Intended* usage
```
let k8s = include "kubernetes/1.23.3/k8s.ncl" in
let nginxDeployment = { 
  metadata = {
    name = "nginx"
  } & (k8s.io_k8s_apimachinery_pkg_apis_meta_v1_ObjectMeta),
  spec = {
    template = {
      spec = {
        containers = [
          {
            image = "docker.io/library/nginx:latest",
            name = "nginx",
          } & (k8s.io_k8s_api_core_v1_Container),
        ],
      } & (k8s.io_k8s_api_core_v1_PodSpec),
    } & (k8s.io_k8s_api_core_v1_PodTemplateSpec),
  } & (k8s.io_k8s_api_apps_v1_DeploymentSpec),
} & (k8s.io_k8s_api_apps_v1_Deployment) in
builtins.serialize `Json (nginxDeployment | #(k8s.io_k8s_api_apps_v1_Deployment))

```

* Unfortunately, the project is not yet there (but is getting there!)
