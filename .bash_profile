# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# for systems without logind/elogind
:'
myuserid=$(id -u)
if [ ! -d "/tmp/xdgruntimedir/$myuserid" ]; then
  mkdir -p -m=700 /tmp/xdgruntimedir/$myuserid
fi
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/xdgruntimedir/$myuserid}"
#export DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/xdgruntimedir/$myuserid/bus
'

# environment variables
export PATH="$HOME/.local/bin:$HOME/flutter/bin:$PATH"
export PAGER=less
export EDITOR=vim
export ANDROID_SDK_ROOT=$HOME/data_HDD/android-sdk
export ANDROID_AVD_HOME=$HOME/data_HDD/android-sdk/avd
#export _JAVA_AWT_WM_NONREPARENTING=1

# for systems without display managers
# autostart graphical environment on tty1 after login 
:'
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  #startx
  #exec xinit -- /usr/bin/X -nolisten tcp vt7 # Could use xinit instead of startx
  
  exec dbus-launch --exit-with-session sway
fi
'
