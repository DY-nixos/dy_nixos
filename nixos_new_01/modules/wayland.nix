{ config, pkgs, ... }:

{
# niri和hyprland设置

programs.hyprland.enable = true;
programs.niri.enable = true;


boot.supportedFilesystems = [ "ntfs" "exfat" "vfat" "ext4" ];
programs.thunar.enable = true;
#programs.xfconf.enable = true;
programs.xwayland.enable = true;
services.udisks2.enable = true;
security.polkit.enable = true;
services.gvfs.enable = true;
services.tumbler.enable = true; 

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
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland   #hyprland支持
      
    ];
  };

 # services.gnome.gnome-keyring.enable = true;

  # D-Bus 对 Wayland 应用很重要
  services.dbus.enable = true;
  

environment.variables = {
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "14";  
 
  };
}
