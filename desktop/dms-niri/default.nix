{config, pkgs, ...}:

{
  imports = [
    ./xdg-desktop-portal.nix
    ./greet.nix
    ./thunar.nix
    ./niri.nix
  ];
}