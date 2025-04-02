{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }@inputs:{
    nixosConfigurations = {
      huaweid15kde = nixpkgs.lib.nixosSystem {
        modules = [ ./host/huaweid15kde/configuration.nix];
      };
    };
 };
}
