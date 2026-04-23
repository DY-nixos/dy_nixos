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
      qt6Packages.fcitx5-chinese-addons
    ];
    fcitx5.waylandFrontend = true;
  };

  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
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