#!/usr/bin/env bash

AWS_COMPOSED_VALUE=${AWS_SESSION_EXPIRATION:-$AWS_CREDENTIAL_EXPIRATION}
AWS_EXPIRATION_TIME=${AWS_COMPOSED_VALUE:-$TMUX_AWS_CREDENTIAL_TIME}
# based on https://stackoverflow.com/questions/63362712/ways-to-find-out-how-soon-the-aws-session-expires/72291361#72291361
aws_session_time_left() {
  zulu_time_now=$1

  aws_session_expiration_epoch="`date -j -u -f '%Y-%m-%dT%H:%M:%SZ' $AWS_EXPIRATION_TIME '+%s'`"
  zulu_time_now_epoch="`date -j -u -f '%Y-%m-%dT%H:%M:%SZ' $zulu_time_now '+%s'`"

  if [[ $zulu_time_now < $AWS_EXPIRATION_TIME ]]; then
    secs="`expr $aws_session_expiration_epoch - $zulu_time_now_epoch`"
    echo "+`printf '%dh:%02dm:%02ds\n' $((secs/3600)) $((secs%3600/60)) $((secs%60))`"
  else
    secs="`expr $zulu_time_now_epoch - $aws_session_expiration_epoch`"
    echo "-`printf '%dh:%02dm:%02ds\n' $((secs/3600)) $((secs%3600/60)) $((secs%60))`"
  fi
}


if [ -z "$AWS_EXPIRATION_TIME" ]; then
    time_left=
else
    time_left=$(aws_session_time_left "`date -u +'%Y-%m-%dT%H:%M:%SZ'`")
fi

echo "$time_left"
