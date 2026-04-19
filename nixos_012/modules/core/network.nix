{ config, pkgs, lib, ... }: {

  networking.networkmanager.enable = true;

  environment.systemPackages = [
      pkgs.clash-verge-rev
  ];
  programs.clash-verge = {
    enable = true;
    autoStart = true;   
    serviceMode = true;
    tunMode = true; 
  };

  networking.proxy.default = "http://127.0.0.1:7897/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.avahi = {
     enable = true;
     nssmdns4 = true;
     publish = {
         enable = true;
         domain = true;
         userServices = true;
     };
     openFirewall = true;
  };
  
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 3000 ];
  networking.firewall.trustedInterfaces = [ "docker0" ];
}