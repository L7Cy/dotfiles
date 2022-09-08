if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U FZF_LEGACY_KEYBINDINGS 0
    set -x GOPATH $HOME/dev
    set -x PATH $PATH $GOPATH/bin
    set -g fish_user_abbreviations
    alias mery='mery.exe'
    alias rm='rm -i'
    export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
end
