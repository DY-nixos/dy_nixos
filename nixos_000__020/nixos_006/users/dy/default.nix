{ config, pkgs, ... }:

{
  home.username = "dy";
  home.homeDirectory = "/home/dy";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    opencode
    hyprpolkitagent
    polkit_gnome  # 确保 polkit-gnome 命令可用
    #wechat
  ];

  # polkit-gnome 服务（为 Niri 准备）
  services.polkit-gnome.enable = true;

  # hyprpolkitagent 服务（为 Hyprland 准备）
  systemd.user.services.hyprpolkitagent = {
    Unit = {
      Description = "Hyprland polkit agent";
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