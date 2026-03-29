{ config, pkgs, lib, ... }: {

# niri和hyprland设置
boot.supportedFilesystems = [ "ntfs" "exfat" "vfat" "ext4" ];
programs.hyprland.enable = true;
programs.niri.enable = true;
programs.xwayland.enable = true;

  # ========== 系统服务优化 ==========
  
  # 启用必要的后台服务
  services.gvfs.enable = true;          # 虚拟文件系统（必须）
  services.udisks2.enable = true;       # 磁盘管理
  services.tumbler.enable = true;       # 缩略图生成器
  security.polkit.enable = true;        # 权限管理
  services.dbus.enable = true;          # D-Bus 通信   # D-Bus 对 Wayland 应用很重要
  # 启用 udev 设备管理服务（处理 USB 设备、硬件热插拔等）
  services.udev.enable = true; 

 # services.gnome.gnome-keyring.enable = true;

systemd.user.services.polkit-agent = {
    description = "Polkit Authentication Agent";
    wantedBy = [ "graphical-session.target" ];	
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;          # wlroots 支持
    extraPortals = [
      #pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland   #hyprland支持
      
    ];
  };

  environment.variables = {
      #XCURSOR_THEME = "capitaine-cursors";
      #XCURSOR_SIZE = "15";     
  };
}
