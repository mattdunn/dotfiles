export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git ruby rails bundler brew chruby coffee cp heroku node tmux nvm docker)
source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"

# local bin takes precedence for homebrew installed apps e.g. git
path=('/usr/local/bin' $path)
path+="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi

if [ -f "$HOME/.nvm/nvm.sh" ]; then
  . "$HOME/.nvm/nvm.sh"
fi

# initialise auto cd
setopt auto_cd
cdpath=($HOME/projects)

# use homebrew installed vim
alias vim="/usr/local/Cellar/vim/8.2.0500_1/bin/vim"

