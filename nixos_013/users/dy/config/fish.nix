{ config, pkgs, ... }: {

  programs.fish.shellInit = ''
    set -g fish_greeting ""
  '';

  xdg.configFile."fish/config.fish" = {
    text = ''
if status is-interactive
end
'';
    force = true;
  };
}