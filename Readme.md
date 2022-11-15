# POC for a Locutus based Proposal Assessment system

## Prerequisites

### Development Environment (NIX Shell)

This is the **preferred** development environment.

1. Install NIX : <https://nixos.org/download.html>
2. Start a nix development environment (From the repo Root):
   `nix develop`

### Development Environment (Manual)

~~ ***NOT RECOMMENDED*** ~~

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

### Install Extra Packages/Tools

This only needs to be done once when the development environment is created.

1. `cargo install cargo-make` : see <https://github.com/sagiegurari/cargo-make>
2. `cargo make install-prereqs`

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

Make sure you are in a Nix dev shell: `nix develop`

1. Build the Locutus Tools: `cargo make build-locutus`

## Ignore this stuff ---

1. Build the latest `ldt` tool:
   * `make build-tool`
2.

```sh
$ cd locutus/docker
$ docker compose build
...
$ cd ../..


$ CONTRACT_SRC_DIR=./contracts/posts/ ./locutus/docker/ldt.sh build
$ ./locutus/docker/ldt.sh publish --code contracts/posts/build/locutus/poc_proposal_assessment_posts.wasm --state contracts/posts/build/locutus/contract-state
PROJECT_SRC_DIR=/home/<something>/poc_pa_system <- Root of the Project being build
CONTRACT_SRC_DIR=/home/<something>/poc_pa_system  <- Relative DIR under PROJECT_SRC_DIR to the Contract to build
Putting contract FwiG1DsyEHbvtsQaE6qrT5jbSD8vhwaQqSWCSchdWha2
$ CONTRACT_SRC_DIR=./web ./locutus/docker/ldt.sh build

$ cd locutus/docker
$ docker compose up
```

* Browse to: <http://localhost:50509/contract/web/HiUHuHQpVxrnXBA762spQoBi8cQjrZF7sK1DPTNvUucw/>
