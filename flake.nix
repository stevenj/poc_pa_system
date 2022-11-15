{
  description = "Nix Developer Shell for Locutus";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.flake-utils.follows = "flake-utils";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { 
            inherit system; 
            overlays = [ (import rust-overlay) ];
          };
        in
        {
          devShells.default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              (rust-bin.stable.latest.default.override {
                  targets = [ 
                    "wasm32-unknown-unknown"
                    "wasm32-wasi" 
                  ];
              })
              wasm-bindgen-cli
              llvmPackages_14.llvm
              nodejs
              nodePackages.webpack
              nodePackages.webpack-cli
              nodePackages.typescript

            ];
          };
        }
      );
}