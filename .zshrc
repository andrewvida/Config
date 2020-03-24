# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customizations

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    dir
    perl
    ruby
    virtualenv
    nvm
    aws
    go
    elixir
    git
    hg
    cmd_exec_time
  )

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler chruby git nvm rails tmuxinator rake)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:$PATH"

export EDITOR=vim


# Aliases
alias trash='sudo rm -Rf ~/.Trash/*'
alias speedup='sudo rm -rf /private/var/log/asl/*.asl'
alias clean_gems='for i in `gem list --no-versions`; do gem uninstall -aIx $i; done'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/andrewvida/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add XDG location
export XDG_CONFIG_HOME="$HOME/.config"

# Export the custom term
# export TERM="tmux-256color"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(nodenv init -)"

#tmux
alias ta='tmux attach -t '
alias tn='tmux new -s '
alias tl='tmux ls'

# tmate/tmux pairing helpers
TMATE_PAIR_NAME="$(whoami)-pair"
TMATE_SOCKET_LOCATION="/tmp/tmate-pair.sock"
TMATE_TMUX_SESSION="/tmp/tmate-tmux-session"

# Get current tmate connection url
tmate-url() {
  url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
  echo "$url" | tr -d '\n' | pbcopy
  echo "Copied tmate url for $TMATE_PAIR_NAME:"
  echo "$url"
}

# Start a new tmate pair session if one doesn't already exist
# If creating a new session, the first argument can be an existing TMUX session to connect to automatically
tmate-pair() {
  if [ ! -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" -f "$HOME/.tmate.conf" new-session -d -s "$TMATE_PAIR_NAME"

    while [ -z "$url" ]; do
      url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
    done
    tmate-url
    sleep 1

    if [ -n "$1" ]; then
      echo $1 > $TMATE_TMUX_SESSION
      tmate -S "$TMATE_SOCKET_LOCATION" send -t "$TMATE_PAIR_NAME" "TMUX='' tmux attach-session -t $1" ENTER
    fi
  fi
  tmate -S "$TMATE_SOCKET_LOCATION" attach-session -t "$TMATE_PAIR_NAME"
}

# Close the pair because security
tmate-unpair() {
  if [ -e "$TMATE_SOCKET_LOCATION" ]; then
    if [ -e "$TMATE_SOCKET_LOCATION" ]; then
      tmux detach -s $(cat $TMATE_TMUX_SESSION)
      rm -f $TMATE_TMUX_SESSION
    fi

    tmate -S "$TMATE_SOCKET_LOCATION" kill-session -t "$TMATE_PAIR_NAME"
    echo "Killed session $TMATE_PAIR_NAME"
  else
    echo "Session already killed"
  fi
}
