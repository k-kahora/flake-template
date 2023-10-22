{
  description = "o-caml flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # Do precise filtering of files in the nix store
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = { self, nixpkgs, flake-utils, nix-filter}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        legacyPackages = nixpkgs.legacyPackages.${system};
        ocamlPackages = legacyPackages.ocamlPackages;
        lib = legacyPackages.lib;
      in
      {
      devShells = {
        default = legacyPackages.mkShell {
          packages = [

            legacyPackages.nixpkgs-fmt
            legacyPackages.ocamlformat
            legacyPackages.fswatch
            ocamlPackages.odoc
            ocamlPackages.ocaml-lsp
            ocamlPackages.ocamlformat-rpc-lib
            ocamlPackages.utop
            ocamlPackages.core
            ocamlPackages.batteries
            ocamlPackages.dune_3
            ocamlPackages.ocaml

          ];
        };

       };
     }
    );
}
