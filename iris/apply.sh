#!/bin/sh
set -eu

if [ "$#" -lt 1 ] || [ -z "$1" ]; then
    printf '%s\n' "usage: $0 WALLPAPER" >&2
    exit 2
fi

wallpaper=$1

iris "$wallpaper" --dark 1

mkdir -p "$HOME/.config/nvim/colors"
mkdir -p "$HOME/Documents/obsidian-vault/.obsidian/snippets"

ln -sfn "$HOME/.cache/iris/colors.conf" "$HOME/.config/kitty/colors.conf"
ln -sfn "$HOME/.cache/iris/Theme.qml" "$HOME/.config/quickshell/modules/Theme.qml"
ln -sfn "$HOME/.cache/iris/niri-colors.kdl" "$HOME/.config/niri/colors.kdl"
ln -sfn "$HOME/.cache/iris/gtk-colors.css" "$HOME/.config/gtk-3.0/colors.css"
ln -sfn "$HOME/.cache/iris/gtk-colors.css" "$HOME/.config/gtk-4.0/colors.css"
ln -sfn "$HOME/.cache/iris/iris.vim" "$HOME/.config/nvim/colors/iris.vim"
ln -sfn "$HOME/.cache/iris/vesktop-midnight.css" "$HOME/.config/vesktop/settings/quickCss.css"
ln -sfn "$HOME/.cache/iris/spicetify.ini" "$HOME/.config/spicetify/Themes/Sleek/color.ini"
ln -sfn "$HOME/.cache/iris/zed-iris.json" "$HOME/.config/zed/themes/iris.json"
ln -sfn "$HOME/.cache/iris/obsidian.css" "$HOME/Documents/obsidian-vault/.obsidian/snippets/iris.css"

pkill -SIGUSR1 kitty 2>/dev/null || true
pkill -SIGUSR1 nvim 2>/dev/null || true

if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme ""
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
fi

if [ -x "$HOME/.spicetify/spicetify" ]; then
    "$HOME/.spicetify/spicetify" watch -s 2>&1 | sed "/Reloaded Spotify/q"
elif command -v spicetify >/dev/null 2>&1; then
    spicetify watch -s 2>&1 | sed "/Reloaded Spotify/q"
fi
