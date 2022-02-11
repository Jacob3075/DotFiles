import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

MOD = "mod4"
TERMINAL = "alacritty"
EDITOR = "nvim"
HOME = os.path.expanduser("~")
SCRIPTS_DIR = f"{HOME}/.config/shell/scripts"

COLORS = {
    "black": "#161925",
    "red": "#e06c75",
    "green": "#98c379",
    "yellow": "#e5c07b",
    "blue": "#61afef",
    "magenta": "#c678dd",
    "cyan": "#56b6c2",
    "grey": "#abb2bf",
    "white": "#ffffff",
}
POWERLINE_SYMBOL = "\ue0be"

@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    os.system(f'{autostart}')


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    # Switch between windows
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([MOD, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([MOD, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([MOD, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([MOD, "control"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([MOD, "shift"], "Return", lazy.spawn(
        "/home/jacob/.config/rofi/launchers/launcher.sh"), desc="Launch Rofi"),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key([MOD], "w", lazy.spawn("firefox"), desc="Launch Firefox"),
    Key([MOD, "shift"], "w", lazy.spawn(
        "firefox --private-window"), desc="Launch Firefox"),
    Key([MOD], "e", lazy.spawn("thunar"), desc="Launch Thunar"),
    Key([MOD], "v", lazy.spawn(
        "/home/jacob/.config/rofi/launchers/rofi-pulse.py"), desc="Launch Thunar"),
    Key([MOD, "shift"], "v", lazy.spawn(
        "pavucontrol"), desc="Launch PulseAudio GUI"),

    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "shift"], "f", lazy.window.toggle_floating(), desc='Toggle floating'),
    Key([MOD], "f", lazy.window.toggle_fullscreen(), desc='Toggle fullscreen'),
    Key([MOD], "x", lazy.spawn("systemctl suspend"), desc='Suspend system'),
    Key([MOD, "shift"], "x", lazy.spawn("shutdown now"), desc='Shutdown system'),
    Key([MOD, "control"], "x", lazy.spawn("reboot"), desc='Rebbot system'),

    Key([MOD, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Change the volume if your keyboard has special volume keys.
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),

    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl play-pause")),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([MOD], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([MOD, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(border_focus_stack=[
                   '#d75f5f', '#8f3d3d'], border_width=1, margin=6),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(margin=6),
    layout.TreeTab(),
    layout.VerticalTile(margin=6),
    layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


def init_bar():
    return bar.Bar(
        [
            widget.GroupBox(
                borderwidth=3,
                active=COLORS["white"],
                inactive=COLORS["grey"],
                highlight_color=COLORS["black"],
                highlight_method="line",
                this_current_screen_border=COLORS["blue"],
                padding=5,
            ),
            widget.Spacer(),
            widget.Systray(),
            widget.TextBox(
                text=POWERLINE_SYMBOL,
                foreground=COLORS["red"],
                background=COLORS["black"],
                fontsize=25,
            ),
            widget.Volume(background=COLORS["red"], fmt="VOL: {}"),
            widget.TextBox(
                text=POWERLINE_SYMBOL,
                foreground=COLORS["green"],
                background=COLORS["red"],
                fontsize=25,
            ),
            widget.Backlight(
                backlight_name="intel_backlight",
                brightness_file="actual_brightness",
                fmt="BLT: {}",
                background=COLORS["green"],
            ),
            widget.TextBox(
                text=POWERLINE_SYMBOL,
                foreground=COLORS["yellow"],
                background=COLORS["green"],
                fontsize=25,
            ),
            widget.Clock(
                background=COLORS["yellow"],
                format="%A, %B %d - %H:%M ",
            ),
            widget.TextBox(
                text=POWERLINE_SYMBOL,
                fontsize=25,
                foreground=COLORS["blue"],
                background=COLORS["yellow"],
            ),
            widget.Battery(background=COLORS["blue"]),
            widget.TextBox(
                text=POWERLINE_SYMBOL,
                fontsize=25,
                foreground=COLORS["magenta"],
                background=COLORS["blue"],
            ),
            widget.GenPollText(
                fmt="DND: {}",
                func=lambda: "ON"
                if "true"
                in subprocess.check_output(["dunstctl", "is-paused"]).decode("utf-8")
                else "OFF",
                mouse_callbacks={
                    "Button1": lambda: subprocess.run(
                        ["dunstctl", "set-paused", "toggle"]
                    )
                },
                background=COLORS["magenta"],
                padding=5,
                update_interval=1,
            ),
        ],
        opacity=0.9,
        size=25,
    )


screens = [
    Screen(
        top=init_bar(),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
