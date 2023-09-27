{
  description = "example shell script flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.writeShellScriptBin "example" ''
          echo "hello world"
        '';
        devShells.default = mkShell {
          buildInputs = with pkgs; [swiProlog];
          shellHook = "alias prolog=swipl";
        };
      });
}
