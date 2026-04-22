{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    hyprpolkitagent
    polkit_gnome
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