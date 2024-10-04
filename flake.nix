{
  description = "NixOS-Eye-Config";

  

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url          = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url   = "github:NixOS/nixos-hardware/master";
    home-manager = {
      	url = "github:nix-community/home-manager";
      	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @{self, nixpkgs, nixos-hardware, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
   nixosConfigurations = 
   {
     eye = nixpkgs.lib.nixosSystem 
     {
       
       modules = 
       [
         ./system
	 nixos-hardware.nixosModules.asus-zephyrus-ga401
         home-manager.nixosModules.home-manager
	 {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
	   home-manager.extraSpecialArgs = inputs;
	   home-manager.backupFileExtension = "backup";
           home-manager.users.xis = import ./user/home.nix; 
         }
       ];
     };
   };
  };
 }
