{ config, pkgs, ... }:

{
  home.username = "dy";
  home.homeDirectory = "/home/dy";
  home.stateVersion = "24.11";

  imports = [
    ./shell.nix
    ./tools.nix
    ./media.nix
    ./fonts.nix
    ./appconfig.nix
  ];

  home.packages = with pkgs; [
    hyprpolkitagent
    polkit_gnome
    alacritty
    mako
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