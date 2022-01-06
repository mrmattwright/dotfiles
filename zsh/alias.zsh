
# global
alias -g C='|wc -l'
alias -g G='|grep'
alias -g H='|head'
alias -g L='|less'
alias -g SL='|sort|less'
alias -g S='|sort'
alias -g T='|tail'

# Use exa instead of ls
alias l='exa -1a'
alias ll='exa -lh --git'
alias ls='exa'
alias la='ls -a'
alias lt='exa -lT --git'
alias ex='exa -l  --no-permissions --no-user --git'

alias g='git'
alias be='bundle exec'

# Homebrew
alias brewu='brew update && brew upgrade && brew cask upgrade'
alias brewc='brew cleanup'
alias bservl='brew services list'
alias bservr='brew services restart'
alias bservs='brew services start'
alias bservx='brew services stop'

alias re="cd $HOME/projects/rocketeer_engine && poetry shell"
alias as="cd $HOME/projects/analytics-api-service && poetry shell"
alias df="cd $HOME/.dotfiles"

