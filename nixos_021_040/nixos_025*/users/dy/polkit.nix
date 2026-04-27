{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    polkit_gnome
  ];
  services.polkit-gnome.enable = true;
}