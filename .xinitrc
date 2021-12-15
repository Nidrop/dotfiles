#!/bin/sh
#Xresources configure X apps (like xterm)
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
exec /bin/spectrwm
#exec dbus-launch --exit-with-session /bin/spectrwm
