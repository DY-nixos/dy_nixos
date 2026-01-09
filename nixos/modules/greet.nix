{config, pkgs, ...}: 

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = false;

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

}
