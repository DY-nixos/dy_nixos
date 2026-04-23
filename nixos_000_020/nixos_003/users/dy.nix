
{ config, pkgs, ... }:

{
  home = {
    username = "dy";
    homeDirectory = "/home/dy";
    stateVersion = "24.11";
  };
  
  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
  
  ];
  
 # gtk = {
  #  enable = true;
   # iconTheme = {
   #  name = "Papirus-Dark";
     # package = pkgs.papirus-icon-theme;
    #};
    #theme = {
    #  name = "Adwaita";
    #  package = pkgs.adwaita-icon-theme;
    #};
 # };
  
 # xdg.configFile = {
 #   "gtk-3.0/settings.ini".text = ''
  #    [Settings]
  #    gtk-theme-name=Adwaita
  #    gtk-icon-theme-name=Papirus-Dark
 #     gtk-font-name=Sans 10
  #    gtk-application-prefer-dark-theme=1
  #  '';
 # };
}
