{ config, pkgs, ... }: {

  # Noctalia 设置 - 使用现有配置文件
  home.file."noctalia/settings.json" = {
    source = ./noctalia-settings.json;
  };

  home.file."noctalia/colors.json" = {
    source = ./noctalia-colors.json;
  };

  home.file."noctalia/gui-settings.json" = {
    source = ./noctalia-gui-settings.json;
  };
}