### How to refresh the values on a per-window basis

DISCLAIMER: this is an experimental hack until I figure out something better

There are two fallback variables `TMUX_AWS_CREDENTIAL_TIME` and `TMUX_AWS_VAULT` that you can configure with
`tmux set-environment -g TMUX_AWS_VAULT "$AWS_VAULt"` for example.

One option would be to use an [update](./scripts/set_variables.sh) and configure it to run on every command.

For BASH, you can this to `~/.bashrc`

```bash
TMUX_UPDATE_SCRIPT="$HOME/.tmux/plugins/tmux-aws-vault/scripts/set_variables.sh"

# execute on a new shell, trying to catch `aws-vault exec`
source "$TMUX_UPDATE_SCRIPT"

export PROMPT_COMMAND="$TMUX_UPDATE_SCRIPT"
```

For ZSH you can this to `~/.zshrc`

```bash 
TMUX_UPDATE_SCRIPT="$HOME/.tmux/plugins/tmux-aws-vault/scripts/set_variables.sh"

# execute on a new shell, trying to catch `aws-vault exec`
source "$TMUX_UPDATE_SCRIPT" 

precmd() {
    "$TMUX_UPDATE_SCRIPT"
}
```
