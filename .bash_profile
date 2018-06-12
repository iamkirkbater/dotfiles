eval "$(hub alias -s)"

export EDITOR=vim
export VISUAL="$EDITOR"
export GITAWAREPROMPT=~/dotfiles/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

    PS1="[ \w ] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\\n  $ "

#   Change Prompt
#   ------------------------------------------------------------

#   Set Paths
#   ------------------------------------------------------------
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:$PATH"

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
    export TERM=xterm-color
    export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad

    export COLOR_NC='\e[0m' # No Color
    export COLOR_WHITE='\e[1;37m'
    export COLOR_BLACK='\e[0;30m'
    export COLOR_BLUE='\e[0;34m'
    export COLOR_LIGHT_BLUE='\e[1;34m'
    export COLOR_GREEN='\e[0;32m'
    export COLOR_LIGHT_GREEN='\e[1;32m'
    export COLOR_CYAN='\e[0;36m'
    export COLOR_LIGHT_CYAN='\e[1;36m'
    export COLOR_RED='\e[0;31m'
    export COLOR_LIGHT_RED='\e[1;31m'
    export COLOR_PURPLE='\e[0;35m'
    export COLOR_LIGHT_PURPLE='\e[1;35m'
    export COLOR_BROWN='\e[0;33m'
    export COLOR_YELLOW='\e[1;33m'
    export COLOR_GRAY='\e[0;30m'
    export COLOR_LIGHT_GRAY='\e[0;37m'

source ~/dotfiles/aliases.sh
