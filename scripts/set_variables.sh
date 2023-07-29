#!/bin/bash

if [[ "$TERM" =~ "screen".* ]]; then
    if [[ -n "$AWS_VAULT" ]]; then
        tmux set-environment -g TMUX_AWS_VAULT "$AWS_VAULT"
    fi

    if [[ -n "$AWS_SESSION_EXPIRATION" ]] || [[ -n "$AWS_CREDENTIAL_EXPIRATION" ]]; then
        tmux set-environment -g TMUX_AWS_CREDENTIAL_TIME "${AWS_SESSION_EXPIRATION:-$AWS_CREDENTIAL_EXPIRATION}"
    fi
fi
