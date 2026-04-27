{ config, pkgs, ... }: {
  # Nix 配置
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store?priority=10"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=5"
      "https://cache.nixos.org/"
    ];
    download-buffer-size = 524288000;
  };
  # 自动垃圾回收
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # 时区
  time.timeZone = "Asia/Shanghai";
  # 允许 unfree 软件
  nixpkgs.config.allowUnfree = true;
  # 系统版本
  system.stateVersion = "25.11";
}