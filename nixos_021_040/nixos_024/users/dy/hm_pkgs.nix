{ config, pkgs, ... }: {

  programs.git.enable = true;
  programs.vim.enable = true;
  programs.yazi.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    alacritty
    fuzzel
    #media
    mpv
    obs-studio
    blender
    foliate
    loupe
    mupdf
    #tool
    opencode
    pureref
    kdePackages.filelight
    kdePackages.partitionmanager
    xwayland-satellite
    #fonts
    nerd-fonts.jetbrains-mono
    bibata-cursors
    capitaine-cursors
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "15";
  };
}
