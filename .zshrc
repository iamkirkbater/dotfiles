# If you come from bash you might have to change your $PATH.
export PATH=$HOME/local/bin:$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH

DOTFILES_PATH="$HOME/Projects/github.com/iamkirkbater/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export XDG_CONFIG_HOME=$HOME

# Export Vim as default editor
export EDITOR=vim

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${DOTFILES_PATH}/.oh-my-zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker aws golang ssh-agent z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export SPACESHIP_CONFIG="$DOTFILES_PATH/config-partials/spaceship.zsh"

test -e "${HOME}/.workdotfiles" && source "${HOME}/.workdotfiles"

for f in $DOTFILES_PATH/scripts-enabled/*; do source $f; done

if [ -n $WORKDOTFILES_PATH ] && [ -d $WORKDOTFILES_PATH ]; then
    [ -d $WORKDOTFILES_PATH/scripts-enabled ] && for f in $WORKDOTFILES_PATH/scripts-enabled/*; do source $f; done
    [ -d $WORKDOTFILES_PATH/bin ] && export PATH=$PATH:$WORKDOTFILES_PATH/bin
fi

if [ -d ~/hostdotfiles ]; then
    [ -d ~/hostdotfiles/scripts-enabled ] && for f in ~/hostdotfiles/scripts-enabled/*; do source $f; done
    [ -d ~/hostdotfiles/bin ] && export PATH=$PATH:$HOME/hostdotfiles/bin
fi

test -e "${DOTFILES_PATH}/.iterm2_shell_integration.zsh" && source "${DOTFILES_PATH}/.iterm2_shell_integration.zsh"

bindkey "^U" backward-kill-line

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source $(brew --prefix)/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/spaceship/spaceship.zsh

## Load Completions
autoload -U compinit
compinit
fpath+=(~/.zsh_completions/)

export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
