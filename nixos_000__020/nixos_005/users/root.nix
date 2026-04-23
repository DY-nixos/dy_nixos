
{ config, pkgs, ... }:

{
  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "24.11";
  };
  
  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
  
  ];

}
