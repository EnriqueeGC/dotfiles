# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.lazy import lazy


mod = "mod4"
mod1 = "mod1"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),
    ([mod], "space", lazy.layout.next()), #desc="Move window focus to other window"

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox")),

    # File Explorer
    ([mod], "e", lazy.spawn("thunar")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 2400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([mod], "s", lazy.spawn("flameshot gui -d 2000")),
    ([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    # KeyboardLayout
    ([mod1], "Tab", lazy.spawn("/home/enrique/.config/scripts/toggle_keyboard_layout.sh")),

    # ------------ Hardware Configs ------------
    # Power
    ([mod], "p", lazy.spawn("/home/enrique/.config/scripts/Power/power_menu.sh")),

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Multimedia keys
    # Play/Pause
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    # Next Track
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
    # Previous Track
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    #([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 9%-")),
    #([], "XF86MonBrightnessDown", lazy.spawn("bash -c 'current=$(brightnessctl g); [ $current -gt 1 ] && brightnessctl set 9%- || brightnessctl set 10'")),
    ([], "XF86MonBrightnessDown", lazy.spawn("bash -c 'current=$(brightnessctl g); if [ $current -le 10 ]; then brightnessctl set 10; else brightnessctl set 9%-; fi'")),

]]
