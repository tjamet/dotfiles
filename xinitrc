if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

pkill ssh-agent ; pkill gpg-agent
gpg-agent --daemon --enable-ssh-support > ~/.gpg-agent-env

urxvtd -q -f -o &
xset r rate 300 15

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

pulseaudio --start
setxkbmap -layout us -variant intl
setxkbmap -config compose:ctrl

# xss-lock -- /home/tjamet/bin/lock &


export DOCKER_HOST=tcp://127.0.0.1:4243
# allow docker to use the local socket
xhost +local:root
exec i3
