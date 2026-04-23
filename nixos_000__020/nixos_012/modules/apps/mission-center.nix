{config, lib, pkgs, ...}: 

{
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