{ config, pkgs, lib, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      rime-data                          # 包含小鹤双拼的核心方案包
      fcitx5-gtk                         # 必带，解决大部分应用输入问题
      qt6Packages.fcitx5-chinese-addons  # 包含拼音、五笔等基础插件
      qt6Packages.fcitx5-configtool      # 图形化配置界面
    ];
  };
}