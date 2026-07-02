#!/usr/bin/env bash

replacements=(░ ▒ ▓ ▙ ▚ ▛ ▜ ▞ ▟)

safe_env() {
  if [[ $# -gt 0 ]]; then
    command env "$@"
    return
  fi

  command env | while IFS='=' read -r name value; do
    if [[ "$name" == *TOKEN* ]]; then
      local masked=""
      for (( i=0; i<${#value}; i++ )); do
        masked+="${replacements[RANDOM % ${#replacements[@]}]}"
      done
      value="$masked"
    fi
    printf '%s=%s\n' "$name" "$value"
  done
}

safe_printenv() {
  if [[ $# -gt 0 ]]; then
    command printenv "$@"
    return
  fi

  command printenv | while IFS='=' read -r name value; do
    if [[ "$name" == *TOKEN* ]]; then
      local masked=""
      for (( i=0; i<${#value}; i++ )); do
        masked+="${replacements[RANDOM % ${#replacements[@]}]}"
      done
      value="$masked"
    fi
    printf '%s=%s\n' "$name" "$value"
  done
}

alias env='safe_env'
alias printenv='safe_printenv'
