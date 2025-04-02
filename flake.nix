{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs,home-manager }@inputs:{
    nixosConfigurations = {
      huaweid15kde = nixpkgs.lib.nixosSystem {
        modules = [ 

          # default settings
          ./host/huaweid15kde/configuration.nix

          # home-manager settings
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tosi = import ./home.nix;
          }
          

        ];
      };
    };
 };
}
