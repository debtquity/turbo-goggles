{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    # for toolchain (stable, nightly, beta ...)
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
    };
    naersk = {
      url = "github:nix-community/naersk";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      naersk,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        toolchain = with rust-overlay.packages.${system};
        combine [

        ];
        naersk' = pkgs.callPackage naersk { };
      in
      {
        # nix run and nix build
        defaultPackage = naersk'.buildPackage {
          src = ./.;
        };

        packages.${system}."dns" = ./package.nix;

        devShell =
          with pkgs;
          mkShell {
            buildInputs = [
              openssl
              pkg-config
              eza # optional - alternative to ls
              fd # optional - alternative to find
              rust-bin.stable.latest.default
              # rust-bin.stable."1.48.0".default # specify specific version
            ];

            env = {

            };

            shellHook = ''
              echo "initialized rust dev shell"
            '';
          };
      }
    );
}
