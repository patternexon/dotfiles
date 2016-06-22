# Just moving about in style
alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#TODO 
# Fancy ls

# Are you sure abt moving or deleting stuff ?
alias mv='mv -i'
alias rm='rm -i'

# Pretty man pages
export PAGER="/usr/bin/most -s"

# Grep Options
export GREP_OPTIONS='--color=auto'

darker ()
{
    xrandr --output VGA1 --brightness 0.5
    xrandr --output HDMI1 --brightness 0.5
}

lighter ()
{
    xrandr --output VGA1 --brightness 1
    xrandr --output HDMI1 --brightness 1
}

# TERM color hack
myterm () {
    if [ -z "$1" ]; then
        # usage if no params given
        echo "Usage: myterm <black|green|color|white>"
    else
        xrdb -load </dev/null && export TERM_COLOR="$1" && xrdb -load ~/.Xresources.$1 && xterm &
    fi
}
