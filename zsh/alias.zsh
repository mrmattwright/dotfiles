
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
alias ls='exa -l  --no-permissions --no-user --git'
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
alias rw="cd $HOME/projects/rocketeer_web && nvm use 16.13.1"
alias gs="cd $HOME/projects/goScraper"

alias df="cd $HOME/.dotfiles"

alias ds="poetry run python  manage.py runserver 8001" 
alias dlr="poetry run python manage.py livereload" 
alias dptw="poetry run ptw -- --last-failed --new-first" 