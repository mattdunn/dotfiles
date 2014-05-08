export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git ruby rails bundler brew chruby coffee cp heroku node tmux)
source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"

# local bin takes precedence for homebrew installed apps e.g. git
export PATH="/usr/local/bin:$PATH"

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi
