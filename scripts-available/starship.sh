#!/bin/bash

SPACESHIP_CHAR_SYMBOL="> "
SPACESHIP_PACKAGE_SYMBOL=" "
SPACESHIP_KUBECONTEXT_SYMBOL="ﴱ "
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GOLANG_SHOW=false


# SPACESHIP_OPENSHIFT_SHOW="${SPACESHIP_OPENSHIFT_SHOW=true}"
# SPACESHIP_OPENSHIFT_PREFIX="${SPACESHIP_OPENSHIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
# SPACESHIP_OPENSHIFT_SUFFIX="${SPACESHIP_OPENSHIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
# SPACESHIP_OPENSHIFT_SYMBOL="${SPACESHIP_OPENSHIFT_SYMBOL=" "}"
# SPACESHIP_OPENSHIFT_COLOR="${SPACESHIP_OPENSHIFT_COLOR="white"}"
# 
# 
# spaceship_openshift() {
#   [[ $SPACESHIP_OPENSHIFT_SHOW = false ]] && return
# 
#   [[ -z $OCM_ENV ]] && return
# 
#   spaceship::section \
#     "$SPACESHIP_OPENSHIFT_COLOR"\
#     "$SPACESHIP_OPENSHIFT_PREFIX" \
#     "$SPACESHIP_OPENSHIFT_SYMBOL$OCM_ENV" \
#     "$SPACESHIP_OPENSHIFT_SUFFIX"
# }

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  openshift     # Openshift Env Selector
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
