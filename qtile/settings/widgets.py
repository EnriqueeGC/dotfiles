from libqtile import widget, qtile
from .theme import colors
from libqtile.lazy import lazy

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Definimos una nueva paleta de colores para el widget Pomodoro
pomodoro_colors = {
    'background': '#1E1E1E',  # Fondo del widget (tono negro/gris oscuro)
    'text_inactive': '#A6A6A6',  # Texto cuando está inactivo (gris claro)
    'text_active': '#159acb',  # Texto durante el trabajo activo (amarillo dorado)
    'text_break': '#32CD32',  # Texto durante el descanso (verde lima)
    'border': '#282828',  # Borde del widget (gris oscuro)
}
def execute_script():
    qtile.cmd_spawn("/home/enrique/.config/scripts/Power/power_menu.sh")

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-0
    )

def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='Symbols Nerd Font',
            fontsize=20,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator()
    ]

primary_widgets = [
    #separator(),
    widget.TextBox(
        text=' 󰣇 ', 
        font='UbuntuMono Nerd Font',
        fontsize=30,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=2,
        foreground = '#159acb',
        mouse_callbacks={
            "Button1": execute_script
            #"Button1": lazy.spawn("notify-send 'Test Click'")
        },
    ),

    *workspaces(),

    separator(),

    widget.WindowName(**base(fg='focus'), fontsize=16, padding=5, font='UbuntuMono Nerd Font Bold'),

    separator(),

    widget.CurrentLayoutIcon(scale=0.65, background=colors['dark']),

    widget.CurrentLayout(
        font='UbuntuMono Nerd Font Bold',
        padding=5,
        foreground= colors['focus'],#'#1ba2e6',
        background=colors['dark']
    ),

    separator(),

    icon(bg="dark", fg='light', text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        font='UbuntuMono Nerd Font Bold',
        background=colors['dark'],
        colour_have_updates=colors['focus'],
        colour_no_updates=colors['light'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
    ),
    separator(),
    
    widget.CPU(
        format=' {load_percent:.0f}%',
        update_interval=1.0,  # Intervalo de actualización en segundos
        background=colors['dark'], #1E293B
        foreground=colors['light']
    ),

    widget.Memory(
        format=' 󰘚 {MemUsed:.0f}GB/{MemTotal:.0f}GB',
        measure_mem='G',  # Mostrar en MB
        update_interval=1.0,  # Intervalo de actualización en segundos
        background=colors['dark'], #1E293B
        foreground=colors['light']
    ),
    separator(),
    icon(bg="dark", fg='light', fontsize=17, text='󰃰 '), # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg='dark', fg='light'), format='%d/%m/%Y - %H:%M '),

    # widget.Battery(
    #     format='{char} {percent:2.0%}',  # Mostrar icono y porcentaje (Ejemplo: ⚡ 85%)
    #     charge_char='󰂄',                # Icono cuando se está cargando
    #     discharge_char='󰁹',             # Icono cuando está descargando
    #     full_char='󰁹',                  # Icono cuando la batería está completa
    #     unknown_char='󰂑',               # Icono cuando el estado es desconocido
    #     empty_char='󰂎',                 # Icono cuando la batería está vacía
    #     show_short_text=False,          # Mostrar siempre el formato completo
    #     update_interval=30,             # Actualizar cada 30 segundos
    #     background=colors['dark'],      # Fondo (color personalizado)
    #     foreground=colors['light'],     # Texto (color personalizado)
    # ),
    
    # widget.BatteryIcon(
    #     battery = 0,
    #     scale=1,
    #     update_interval = 60,  
    # ),
    
    widget.Systray(background=colors['dark'], padding=5,),

    widget.KeyboardLayout(configured_keyboards=["us", "es"]),

    separator(),

]

secondary_widgets = [
    *workspaces(),

    widget.WindowName(**base(fg='focus'), fontsize=16, padding=5),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'color1'),

    icon(bg="color2", fontsize=20, text='󰃰 '), # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font',
    'fontsize': 17,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()