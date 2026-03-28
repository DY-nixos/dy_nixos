{config, pkgs, ...}:

{
  imports = [
    ./ime.nix
    ./windowing.nix
    ./print.nix
    ./sound.nix
    # ./touchpad.nix
    # ./xfce-de.nix
    ./dms-niri
  ];
}