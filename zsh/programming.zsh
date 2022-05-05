#Chromedriver 
export PATH="$HOME/projects/bin:$PATH"

#chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh # Or run `brew info chruby` to find out installed directory
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

eval $(/opt/homebrew/bin/brew shellenv)