#Chromedriver and binaries
export PATH="$HOME/projects/bin:$PATH"

# Poetry
export PATH="$HOME/Library/Application Support/pypoetry-x86/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

# uv - but rust
#source $HOME/.cargo/env


#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#mojo
export MODULAR_HOME="/Users/mrmattwright/.modular"

# This is to let celery work on macos : https://medium.com/@pseguel/problems-with-python-on-macos-6b4aab58c765
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
