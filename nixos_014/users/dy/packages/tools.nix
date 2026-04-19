{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    opencode
    pureref
    kdePackages.filelight
    kdePackages.partitionmanager
    xwayland-satellite
  ];

}