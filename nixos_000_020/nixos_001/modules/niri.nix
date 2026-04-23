{ config, pkgs, ... }:

{

# niri设置
boot.supportedFilesystems = [ "ntfs" "exfat" "vfat" "ext4" ];
programs.niri.enable = true;
services.udisks2.enable = true;
security.polkit.enable = true;
services.gvfs.enable = true;
#services.devmon.enable = true;
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
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

environment.systemPackages = with pkgs; [
   # xdg-desktop-portal-gtk
    #xdg-desktop-portal-gnome
   fuzzel
   alacritty
   bibata-cursors
  
  ];


environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "14";  
   GSK_RENDERER="gl thunar";
   NIXOS_OZONE_WL = "1";
  };
}
