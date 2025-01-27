# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

from libqtile import layout
from libqtile.config import Match
from .theme import colors

# Layouts and layout rules
#"#00BFFF"

layout_conf_max = {
    'border_normal': colors['focus'][0],
    'border_focus': colors['normal'][0],
    'border_width': 2,
    'margin': [2, 15, 2, 15], # Top, Right, Bottom, Lefth
}

layout_conf = {
    'border_normal': colors['focus'][0],
    'border_focus': colors['normal'][0],
    'border_width': 2,
    'margin': 4,
    # bsp    
    'margin_on_single': [2, 15, 2, 15],
    'border_on_single': colors['focus'][0],
    # MonadTall
    'single_margin': [2, 15, 2, 15],
    'single_border_width': 3
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.Max(**layout_conf_max),
    layout.MonadWide(**layout_conf),
    layout.Bsp(**layout_conf),
    layout.Matrix(columns=2, **layout_conf),
    layout.RatioTile(**layout_conf),
    # layout.Columns(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus=colors["normal"][0]
)
