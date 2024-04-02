# Nickel Kubernetes

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This repository aims to be a framework to write Kubernetes resource definitions
natively in Nickel. Never write a yaml spaghetti again!

The medium term vision is that `nickel-kubernetes` can be used to easily set up
a proper _developer environment_ with everything needed: Nickel contracts for
Kubernetes resources, Nickel modules for common Kubernetes resources, proper
settings for the LSP, etc. In practice, this repository will be mostly a
collection of Nickel libraries, including auto-generated contracts for
Kubernetes resources and Nickel modules.

## Status

Although the repository was created several years ago, this project started as
an experiment which quickly came to an halt when the initial contributor
couldn't devote time to it anymore. However, it just has been revived.
Nickel-kubernetes is under active development, but it isn't ready to use yet.
See the roadmap below for the next steps.

## Roadmap

- [ ] Pipe
   [json-schema-to-nickel](https://github.com/nickel-lang/json-schema-to-nickel)
   and [kubernetes-json-schema](https://github.com/yannh/kubernetes-json-schema)
   together to auto-generate Nickel contracts for Kubernetes resource
   definitions
- [ ] Do the same for argo workflows using [official argo schemas](https://github.com/argoproj/argo-workflows/tree/main/api/jsonschema)
- [ ] Provide composable partial configuration to easily write Kubernetes
   resources (think Helm charts but without a proper configuration language
   instead of templating)
- [ ] Expand the test suite
- [ ] Enrich constraints imposed by openapi specs (they are far too lenient -
      i.e. make sure that IP addresses are actual IP addresses)
- [ ] Enrich constraints with descriptions obtained from openAPI specs

## Requirements

You need the [Nix](https://nixos.org/download.html) package manager with
[flakes](https://nixos.wiki/wiki/Flakes#Non-NixOS) enabled.
