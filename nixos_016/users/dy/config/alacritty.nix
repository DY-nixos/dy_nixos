{ config, pkgs, ... }: {

  home.file."alacritty/alacritty.toml" = {
    text = ''
[general]
import = ["~/.config/alacritty/themes/noctalia.toml"]

[font]
size = 15.0
[font.offset]
x = 1

[font.bold]
style = "Heavy"

[font.bold_italic]
family = "JetBrainsMono Nerd Font"
style = "Heavy Italic"

[font.italic]
family = "JetBrainsMono Nerd Font"
style = "Medium Italic"

[font.normal]
style = "Medium"

[window]
decorations = "Full"
dynamic_padding = false
opacity = 0.8

[window.padding]
x = 15
y = 15
'';
  };
}