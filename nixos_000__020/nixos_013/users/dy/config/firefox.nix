{ config, pkgs, ... }: {

  programs.firefox.profiles.default = {
    settings = {
      "browser.download.useDownloadDir" = false;
      "browser.shell.checkDefaultBrowser" = false;
    };
  };
}