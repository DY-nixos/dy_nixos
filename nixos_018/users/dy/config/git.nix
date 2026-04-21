{ config, pkgs, ... }: {

  # 在 home.nix 中添加
  programs.git = {
    enable = true;
    userEmail = "798626979@qq.com";
    userName = "DY-nixos";
  };

}