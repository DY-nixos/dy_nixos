{ config, pkgs, ... }: {

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.default = {
      settings = {
        "browser.download.useDownloadDir" = false;
        "browser.shell.checkDefaultBrowser" = false;
      };
    };
  };

  xdg.configFile = {
    "mako/config".text = ''
      max-visible=5
      default-timeout=5000
    '';
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

}