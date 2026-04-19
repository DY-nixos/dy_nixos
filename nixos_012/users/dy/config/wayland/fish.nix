{ config, pkgs, ... }: {

  programs.fish.shellInit = ''
    set -g fish_greeting ""
  '';

  xdg.configFile."fish/config.fish".text = ''
if status is-interactive
end
  '';

  xdg.configFile."fish/fish_variables".text = ''
SETUV_INTERNAL__fish_init:2:{"languages":{"nix":{" shells":[{"executable":"nix-shell","flag":"-u"}]},"prompt":{"pipelined":{"right":{"async":true,"segments":[{"highlight":"white","info_type":"command_duration","min_duration_ms":500,"prompt":{"color":"brblack","prefix":" "<span style="color: #89b4fa"> </span>","spinner":{"frames":["⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏"],"style":"dots"},"type":"prompt"},{"highlight":"white","info_type":"vim_mode","indicator":" ","prompt":{"color":"brgreen","prefix":"N ","suffix":" "},"show_insert_mode":false,"type":"vim_mode_indicator"}]},"type":"pipelined"},"type":"prompt"},"right_prompt":{"type":"host"},"version":"2.1.0","token_transients":false,"functions":{"fish_greeting":""},"abbreviation_var":"","update_mode":"default","use_abbreviation_tokens":true}
  '';
}