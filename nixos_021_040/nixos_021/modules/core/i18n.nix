{ config, pkgs, lib, ... }: {
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

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

  fonts = {
    packages = with pkgs; [
      cascadia-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      wqy_zenhei
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" "WenQuanYi Zen Hei" ];
        serif = [ "Noto Serif CJK SC" ];
      };
    };
  };
}