{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };
  
  outputs = { self, nixpkgs, ...}@inputs:{
    nixosConfigurations.huaweid15 = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [
        ./hosts/huaweid15/configuration.nix
      ];
    };
  };
}
