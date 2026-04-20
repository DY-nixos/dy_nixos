{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    bibata-cursors
    capitaine-cursors
  ];

}