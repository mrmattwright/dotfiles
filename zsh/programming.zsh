#Chromedriver 
export PATH="$HOME/projects/bin:$PATH"

export PATH="$HOME/Library/Application Support/pypoetry-x86/bin:$PATH"

[[ -s "/Users/mrmattwright/.gvm/scripts/gvm" ]] && source "/Users/mrmattwright/.gvm/scripts/gvm"
export PATH="${HOME}/.pyenv/shims:${PATH}"

#chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

#eval $(/opt/homebrew/bin/brew shellenv)

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion