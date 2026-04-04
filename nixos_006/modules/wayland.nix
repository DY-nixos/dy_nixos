{ config, pkgs, lib, ... }:
{
 # niri和hyprland设置

 programs.hyprland.enable = true;
 programs.niri.enable = true;
 programs.xwayland.enable = true;
 programs.uwsm.enable = true;   # 启用 UWSM

 programs.hyprland = {
    #enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  
  # 配置 Niri 作为 UWSM 管理的合成器
  programs.uwsm.waylandCompositors.niri = {
    binPath = "/run/current-system/sw/bin/niri-session";
    comment = "Niri (UWSM managed)";
    prettyName = "Niri";
  };

 # ========== 系统服务优化 ==========
  
  # 启用必要的后台服务
  services.gvfs.enable = true;          # 虚拟文件系统（必须）
  services.udisks2.enable = true;       # 磁盘管理
  services.tumbler.enable = true;       # 缩略图生成器
  security.polkit.enable = true;        # 权限管理
  #services.dbus.enable = true;          # D-Bus 通信   # D-Bus 对 Wayland 应用很重要
  #services.udev.enable = true;          # 启用 udev 设备管理服务（处理 USB 设备、硬件热插拔等）

 # services.gnome.gnome-keyring.enable = true;

  xdg.portal = {
    enable = true;
    #wlr.enable = true;          # wlroots 支持
    extraPortals = [
      #pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland   #hyprland支持
    ];
    config = {
      hyprland = {
        default = ["hyprland" "gtk"];
      };
    };
  };

  environment.variables = {
      NIXOS_OZONE_WL = "1";
      #XCURSOR_THEME = "capitaine-cursors";
      #XCURSOR_SIZE = "15";     
  };
}
