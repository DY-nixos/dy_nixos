{ config, pkgs, ... }:

{
  home.username = "dy";
  home.homeDirectory = "/home/dy";
  home.stateVersion = "26.05";

  imports = [
    ./packages/shell.nix
    ./packages/tools.nix
    ./packages/media.nix
    ./packages/fonts.nix
    ./packages/fcitx.nix
    ./config/hyprland.nix
    ./config/fish.nix
    ./config/alacritty.nix
    ./config/firefox.nix
    ./config/niri.nix
    ./config/fcitx5.nix
    ./config/noctalia.nix
  ];

  home.packages = with pkgs; [
    hyprpolkitagent
    polkit_gnome
    alacritty
    libnotify
  ];

  services.polkit-gnome.enable = true;

  systemd.user.services.hyprpolkitagent = {
    Unit = {
      Description = "Hyprland polkit agent";
      ConditionEnvironment = "HYPRLAND_INSTANCE_SIGNATURE";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}