{ config, pkgs, ... }: {

xdg.configFile."mako/config".text = ''
default-timeout=8000
border-radius=8
max-visible=5
  '';
}