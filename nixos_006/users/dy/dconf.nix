{ config, lib, pkgs, ... }:

{
  # home-manager 中使用 dconf.settings 而不是 programs.dconf
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita-dark";
        icon-theme = "Papirus";
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 24;
        font-name = "Noto Sans CJK SC 11";
        document-font-name = "Noto Serif CJK SC 11";
        monospace-font-name = "JetBrainsMono Nerd Font 11";
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/wm" = {
        prefer-primary-click = false;
        raise-on-click = true;
        action-middle-click-button = "lower";
        focus-mode = "click";
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        clock-format = "24h";
        show-hidden = true;
      };

      "org/gnome/nautilus/preferences" = {
        show-hidden-files = true;
        show-directory-item-counts = "always";
      };

      "org/gnome/settings-daemon/plugins/xsettings" = {
        antialiasing = "rgba";
        hinting = "slight";
      };

      "org/gnome/gedit/preferences/editor" = {
        scheme = "oblivion";
        use-default-font = false;
        editor-font = "JetBrainsMono Nerd Font 11";
        tabs-size = 4;
        insert-spaces = true;
      };

      "org/gnome/logs" = {
        panel-source-list-visible = true;
      };
    };
  };
}