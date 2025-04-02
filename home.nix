{ config, pkgs, ...}:

{
  
  home.username = "tosi";
  home.homeDirectory = "/home/tosi";

  home.packages = with pkgs; [
    nnn 
    lazygit
    cowsay
  ];
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

