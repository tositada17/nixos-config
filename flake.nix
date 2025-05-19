{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; # IMPORTANT
  };
  
  outputs = { self, nixpkgs,home-manager,chaotic, ...}@inputs:{
    nixosConfigurations.huaweid15 = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [
        ./hosts/huaweid15/configuration.nix

        # home-manager settings
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tosi = import ./home.nix;
        }

        chaotic.nixosModules.default
      ];
    };
  };
}
