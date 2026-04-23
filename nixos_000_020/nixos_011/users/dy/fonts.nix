{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    bibata-cursors
    capitaine-cursors
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "15";
  };

}