{ config, pkgs, ... }:

{
  # 启用 Niri
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

    
  # dms Niri 依赖
  environment.systemPackages = with pkgs; [
    accountsservice
    xwayland-satellite
    adapta-gtk-theme
    kdePackages.qt6ct
    kitty
    zsh
  ];

  # 启用portal（远程桌面支持）
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Greeter
  services.displayManager.dms-greeter = {
    enable = true;
    # package = pkgs.dms-greeter;
    quickshell.package = pkgs.quickshell;
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
    compositor.name = "niri";

    configHome = "/home/dy";
    configFiles = [
      "/home/dy/.config/DankMaterialShell/settings.json"
      "/home/dy/.local/state/DankMaterialShell/session.json"
    ];

  };

  # Desktop Shell
  programs.dms-shell = {
    enable = true;
    package = pkgs.dms-shell;
    systemd = {
      # enable = true;
      target = "graphical-session.target";
      restartIfChanged = true;
    };
    quickshell.package = pkgs.quickshell;
    enableVPN = true;
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableClipboard = true;
    enableCalendarEvents = true;
    enableAudioWavelength = true;
  };

  # dsearch
  programs.dsearch = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
  };

}