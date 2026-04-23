{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    papirus-icon-theme  # 图标主题（Noctalia 只控制 GTK，图标仍需单独设置）
    # arc-theme 可以移除了，因为 Noctalia 会生成主题
  ];

  # 让 Noctalia 控制 GTK 主题
  # 不需要再手动设置 gtk.theme
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";  # 图标主题（Noctalia 不控制图标）
      package = pkgs.papirus-icon-theme;
    };
    # 不需要设置 theme，让 Noctalia 动态生成
    
    # 消除警告：设置 gtk4 跟随 theme（虽然 theme 未设置，但避免警告）
    gtk4 = {
      theme = null;  # 明确设为 null，让 Noctalia 控制
    };
    
    gtk3 = {
      extraConfig = {
        "gtk-application-prefer-dark-theme" = true;
      };
    };
  };
  
  # 强制覆盖配置文件，避免冲突
  xdg.configFile = {
    "gtk-3.0/settings.ini".force = true;
    "gtk-4.0/settings.ini".force = true;
  };
}