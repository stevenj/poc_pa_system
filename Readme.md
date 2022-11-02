# POC for a Locutus based Proposal Assessment system

## Prerequisites

1. Install LLVM
2. Install NPM
3. Install the typescript package:
   * globally by running:
     * `npm install typescript@latest -g`
   * or use the npx command with the --package flag, e.g.
     * `npx --package typescript tsc --init`
   * Make sure it works:
     * `tsc --version`
   * If it doesn't run:
     * `npm config get prefix`
     * And make sure that path is in your `$PATH`.
4. Install webpack:
   * `npm install --global webpack`
   * `npm install --global webpack-cli`
5. Install msgpack & bs58 libraries:
   * `npm install @msgpack/msgpack`
   * `npm install bs58`

## Installing Source

Locutus is still under heavy development, so for now we include a locutus fork
as a submodule. This will allow us to easily contribute any necessary patches
upstream, until the locutus project stabilises.

To checkout, and initialize with the upstream locutus fork:

```sh
git clone --recurse-submodules git://github.com/...TODO...
```

If you forgot to add --recurse-submodules, then after checkout just run:

```sh
git submodule update --init
```

## Building

1. Build the latest `ldt` tool:
   * `make build-tool`
2.
