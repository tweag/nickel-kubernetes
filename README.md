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
couldn't devote time to it anymore. However, it has been revived since and is
under active development.

## Content

You'll find auto-generated Nickel contracts for Kubernetes resources for some
selected versions of the Kubernetes API in the `kubernetes-contracts` directory.
You can simply import them and apply them to your Nickel configurations.

**IMPORTANT**: the generated contracts are all implicitly relying on a Nickel
library which is located inside each contract directory
`kubernetes-contracts/vX.Y.Z` in the `.js2n-lib` subdirectory. If you want to
use only a few selected contracts without pulling the whole contract directory
in, make sure to copy the library as well (which must either be located in the
same directory as the contracts or must be made available through the Nickel
import path - see the documentation of `--import-path` by running `nickel help
export`).

## Roadmap

- [x] Pipe
   [json-schema-to-nickel](https://github.com/nickel-lang/json-schema-to-nickel)
   and [kubernetes-json-schema](https://github.com/yannh/kubernetes-json-schema)
   together to auto-generate Nickel contracts for Kubernetes resource
   definitions
- [ ] Do the same for argo workflows using [official argo schemas](https://github.com/argoproj/argo-workflows/tree/main/api/jsonschema)
- [ ] Provide composable partial configuration to easily write Kubernetes
   resources (think Helm charts but with a proper configuration language
   instead of string templating)
- [ ] Expand the test suite
- [ ] Enrich constraints imposed by openapi specs (they are far too lenient -
      i.e. make sure that IP addresses are actual IP addresses)
- [ ] Enrich constraints with descriptions obtained from openAPI specs

## Requirements

Most content that we intend to serve will be pure Nickel code, that you can just
clone and use.

To hack on this repository, such as generating contracts for a new version of
the API, you need the [Nix](https://nixos.org/download.html) package manager
with [flakes](https://nixos.wiki/wiki/Flakes#Non-NixOS) enabled.
