SPACESHIP_OPENSHIFT_SHOW="${SPACESHIP_OPENSHIFT_SHOW=true}"
SPACESHIP_OPENSHIFT_PREFIX="${SPACESHIP_OPENSHIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OPENSHIFT_SUFFIX="${SPACESHIP_OPENSHIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OPENSHIFT_SYMBOL="${SPACESHIP_OPENSHIFT_SYMBOL=" "}"
SPACESHIP_OPENSHIFT_COLOR="${SPACESHIP_OPENSHIFT_COLOR="white"}"


spaceship_openshift() {
  [[ $SPACESHIP_OPENSHIFT_SHOW = false ]] && return

  [[ -z $OCM_ENV ]] && return

  spaceship::section \
    "$SPACESHIP_OPENSHIFT_COLOR"\
    "$SPACESHIP_OPENSHIFT_PREFIX" \
    "$SPACESHIP_OPENSHIFT_SYMBOL$OCM_ENV" \
    "$SPACESHIP_OPENSHIFT_SUFFIX"
}

