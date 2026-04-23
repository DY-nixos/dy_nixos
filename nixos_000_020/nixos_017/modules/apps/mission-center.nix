{config, lib, pkgs, ...}: 

{
  boot.initrd.kernelModules = [ "pinctrl_tigerlake" ];
  boot.kernelModules = [ 
    "coretemp"
    "nct6683d"
  ];
  services.sysprof.enable = true;
  environment.systemPackages = with pkgs; [
    mission-center
    lm_sensors
  ];
}