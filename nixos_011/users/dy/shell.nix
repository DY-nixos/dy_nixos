{ config, pkgs, ... }: {

  programs.fish.enable = true;
  programs.git.enable = true;
  programs.vim.enable = true;
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "natural";
        sort_dir = "asc";
      };
    };
  };

  programs.fish.shellInit = ''
    # Fish shell 初始化配置
    set -g fish_greeting ""
  '';

}