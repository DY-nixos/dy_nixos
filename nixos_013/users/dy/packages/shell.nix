{ config, pkgs, ... }: {

  programs.git.enable = true;
  programs.vim.enable = true;
  programs.yazi.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    mako
    libnotify
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "15";
  };
}