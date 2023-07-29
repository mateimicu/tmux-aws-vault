# Tmux aws-vault context

Show the current [aws-vault][aws-vault] context and how much time you have left in the current session.

This only works if you `aws-vault exec` before running `tmux`, so the tmux session inherits the environment variables.
If you run `aws-vault exec` inside `tmux` it won't be able to pick it up.

## Installation

### Dependencies

This assumes that you have [aws-vault][aws-vault] installed and used the `exec` function.

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`

    set -g @plugin 'mateimicu/tmux-aws-vault'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right` or `status-left` they should be visible, assuming you have the necessary dependencies.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/sudermanjr/tmux-kube ~/clone/path

Add this line to `~/.tmux.conf`

    run-shell ~/clone/path

Reload TMUX environment:

    $ tmux source ~/.tmux.conf

If format strings are added to `status-right` or `status-left` they should be visible, assuming you have the necessary dependencies.

## Usage

Add `#{aws_vault}`, or  `#{aws_remaining_time}` to your status line to get current context info.

Basic Example:

    set -g status-right '#{aws_vault}:#{aws_remaining_time}'


### Experiments

* [How to update the values for each window](./per-window-refresh.md

[aws-vault]: https://github.com/99designs/aws-vault
