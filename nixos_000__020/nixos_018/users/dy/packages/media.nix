{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    mpv
    obs-studio
    blender
    foliate

    loupe
    mupdf
  ];

}