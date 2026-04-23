{ config, pkgs, ... }: {

  home.file."niri/config.kdl" = {
    text = ''
// Niri Config
environment {
    LANG "zh_CN.UTF-8"
    LC_CTYPE "en_US.UTF-8"
}

cursor {
    xcursor-theme "capitaine-cursors-white"
    xcursor-size 14
    hide-after-inactive-ms 15000
}

input {
    keyboard {
        xkb {
        }
        numlock
    }
    touchpad {
        tap
        natural-scroll
    }
    mouse {
        accel-speed 0.2
        accel-profile "flat"
    }
    trackpoint {
    }
}

output "eDP-1"{
    mode "1920x1080@60"
    scale 1.3
    position x=0 y=0
}

layout {
    gaps 12
    struts {
        left 1
        right 1
        top 1
        bottom 1
    }
    center-focused-column "never"
    preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
    }
    default-column-width { proportion 0.5; }
    focus-ring {
        width 3
        active-color "#f0f0f0cc"
    }
}

window-state {
    ignore-fulscreen-requests false
}

binds {
    // Screenshot
    bind SUPER SHIFT S "niri msg action invoke-screenshot-tool"
    bind SUPER ALT "niri msg action close-window"
    // Mod+R to resize
    bind "SUPER R" "niri msg action resize"
}

// mouse
// niri msg action toggle-pseudotile

// Mod+Shift+E to exit
bind "SUPER SHIFT E" "niri msg action quit"

modifiers {
    // Caps to mod
}

// window rules
window-rules [
    // Float some applications
    float-by-default title "Microsoft Teams Notification"
]

// 快捷键
// open terminal
bind SUPER "niri msg action spawn alacritty"
// open file manager
bind "SUPER E" "niri msg action spawn thunar"
// open menu
bind SUPER "niri msg action open-appLauncher"
// toggle fullscreen
bind SUPER "f" "niri msg action toggle-fullscreen"
// toggle maximize
bind SUPER "m" "niri msg action maximize"
// switch window
bind SUPER "h" "niri msg action focus-window left"
bind SUPER "l" "niri msg action focus-window right"
bind SUPER "j" "niri msg action focus-window down"
bind SUPER "k" "niri msg action focus-window up"
// move window
bind SUPER SHIFT "h" "niri msg action move-window left"
bind SUPER SHIFT "l" "niri msg action move-window right"
bind SUPER SHIFT "j" "niri msg action move-window down"
bind SUPER SHIFT "k" "niri msg action move-window up"
// workspace
bind SUPER "1" "niri msg action goto-workspace 1"
bind SUPER "2" "niri msg action goto-workspace 2"
bind SUPER "3" "niri msg action goto-workspace 3"
bind SUPER "4" "niri msg action goto-workspace 4"
bind SUPER "5" "niri msg action goto-workspace 5"
bind SUPER "6" "niri msg action goto-workspace 6"
bind SUPER "7" "niri msg action goto-workspace 7"
bind SUPER "8" "niri msg action goto-workspace 8"
bind SUPER "9" "niri msg action goto-workspace 9"
bind SUPER "0" "niri msg action goto-workspace 10"
// move to workspace
bind SUPER SHIFT "1" "niri msg action move-to-workspace 1"
bind SUPER SHIFT "2" "niri msg action move-to-workspace 2"
bind SUPER SHIFT "3" "niri msg action move-to-workspace 3"
bind SUPER SHIFT "4" "niri msg action move-to-workspace 4"
bind SUPER SHIFT "5" "niri msg action move-to-workspace 5"
bind SUPER SHIFT "6" "niri msg action move-to-workspace 6"
bind SUPER SHIFT "7" "niri msg action move-to-workspace 7"
bind SUPER SHIFT "8" "niri msg action move-to-workspace 8"
bind SUPER SHIFT "9" "niri msg action move-to-workspace 9"
bind SUPER SHIFT "0" "niri msg action move-to-workspace 10"
];
'';
  };

  home.file."niri/colors.kdl" = {
    text = ''
// Niri Colors
'';
  };
}