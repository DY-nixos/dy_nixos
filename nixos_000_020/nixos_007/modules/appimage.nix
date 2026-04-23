
{ config, pkgs, ... }: {

  programs.appimage = {
    enable = true;
    binfmt = true;
    # 如果遇到缺少特定库，可以这样补充，例如添加 libepoxy
    #package = pkgs.appimage-run.override {
    #  extraPkgs = pkgs: [ pkgs.libepoxy ];
    #};
  };
}