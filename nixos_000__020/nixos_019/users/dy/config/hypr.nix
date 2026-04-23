# users/dy/config/hypr.nix
{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    
    # 这一行确保你使用的是 Git 版的 Hyprland 包
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    # 针对 Git 版本插件的正确引用方式
    plugins = [];

    extraConfig = ''
      source = ~/.config/hypr/hyprland.conf
    '';
  };
}