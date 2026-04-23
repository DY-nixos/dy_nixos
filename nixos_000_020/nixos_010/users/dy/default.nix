{ config, pkgs, ... }:

{
  home.username = "dy";
  home.homeDirectory = "/home/dy";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hyprpolkitagent
    polkit_gnome  # 确保 polkit-gnome 命令可用
  ];

  # polkit-gnome 服务（为 Niri 准备）
  services.polkit-gnome.enable = true;

  # hyprpolkitagent 服务（为 Hyprland 准备）
  systemd.user.services.hyprpolkitagent = {
    Unit = {
      Description = "Hyprland polkit agent";
      # 增加限制：仅在 Hyprland 下启动
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