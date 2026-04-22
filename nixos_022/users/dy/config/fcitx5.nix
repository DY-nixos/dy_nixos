{ config, pkgs, lib, ... }:

{
  home.activation.removeFcitx5Dir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    rm -rf $HOME/.config/fcitx5
  '';

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };
  
  i18n.inputMethod.fcitx5.ignoreUserConfig = true;

  xdg.configFile."fcitx5".force = true;
  
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    "Groups/0" = {
      "Name" = "Default";
      "Default Layout" = "us";
      "DefaultIM" = "keyboard-us";
    };
    "Groups/0/Items/0" = { "Name" = "keyboard-us"; };
    "Groups/0/Items/1" = { "Name" = "rime"; };
    "GroupOrder" = { "0" = "Default"; };
  };
home.activation = {
    setupRimeLocal = lib.hm.dag.entryAfter ["writeBoundary"] ''
      # 1. 定义目标目录
      RIME_DIR="${config.home.homeDirectory}/.local/share/fcitx5/rime"
      
      # 2. 确保目录存在
      $DRY_RUN_CMD mkdir -p "$RIME_DIR"

      # 3. 写入物理配置文件
      $DRY_RUN_CMD cat > "$RIME_DIR/default.custom.yaml" <<EOF
patch:
  schema_list:
    - schema: double_pinyin_flypy
    #- schema: luna_pinyin
EOF

      # 4. 强制清理该路径下的缓存，迫使 Rime 重新读取配置
      $DRY_RUN_CMD rm -rf "$RIME_DIR/build/"
    '';
  };
}