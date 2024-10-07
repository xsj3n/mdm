{
  description = "Haskell dev shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    };

  outputs = { self , nixpkgs, ... }:
  let system = "x86_64-linux"; 
  in 
  {
    packages."${system}".default = 
      let
        returnShellEnv = true;
        pkgs = import nixpkgs { inherit system; };
      in pkgs.haskellPackages.developPackage {
        root = ./.;
    };

  };
}
