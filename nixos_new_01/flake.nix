{
  description = "NixOS configuration with auto-module loading";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell.url = "git+https://git.outfoxxed.me/quickshell/quickshell";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    # 需要排除的文件列表
    excludeFiles = ["home.nix" "home-root.nix"];
    
    autoModules = builtins.map (file: ./modules/${file})
      (builtins.filter (file: 
        nixpkgs.lib.hasSuffix ".nix" file && 
        !(builtins.elem file excludeFiles)
      ) (builtins.attrNames (builtins.readDir ./modules)));
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users = {
              dy = import ./modules/home.nix;
              #root = import ./modules/home-root.nix;
            };
          };
        }
      ] ++ autoModules;
    };
  };
}