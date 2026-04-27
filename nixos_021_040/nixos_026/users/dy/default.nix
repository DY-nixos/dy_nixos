{ config, pkgs, ... }:

{
  home.username = "dy";
  home.homeDirectory = "/home/dy";
  home.stateVersion = "26.05";

  imports = [
    ./hm_pkgs.nix
    ./polkit.nix
    ./config/git.nix
    ./config/hyprland.nix
    ./config/fish.nix
    #./config/firefox.nix
    ./config/niri.nix
    #./config/fcitx5.nix
    #./config/noctalia.nix
  ];
}