#!/bin/bash

if [[ "$TERM" =~ "screen".* ]]; then
        tmux set-environment -g TMUX_AWS_VAULT "$AWS_VAULT"
        tmux set-environment -g TMUX_AWS_CREDENTIAL_TIME "${AWS_SESSION_EXPIRATION:-$AWS_CREDENTIAL_EXPIRATION}"
fi
