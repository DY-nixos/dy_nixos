{config, pkgs, ...}:

{
  imports = [
    ./bootloader.nix
    ./kernel.nix
    ./zramSwap.nix
    ./nvidia.nix
    ./networking.nix
    ./i18n.nix
  ];
}