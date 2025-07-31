
# global
alias -g C='|wc -l'
alias -g G='|grep'
alias -g H='|head'
alias -g L='|less'
alias -g SL='|sort|less'
alias -g S='|sort'
alias -g T='|tail'

# Use eza instead of ls
alias l='eza -1a'
alias ll='eza -lh --git'
alias ls='eza -l  --no-permissions --no-user --git'
alias la='ls -a'
alias lm='ls --sort=modified'
alias lt='eza -lT --no-permissions --no-user --git'
alias ex='eza -l  --no-permissions --no-user --git'

alias g='git'
alias be='bundle exec'

# Homebrew
alias brewu='brew update && brew upgrade && brew cask upgrade'
alias brewc='brew cleanup'
alias bservl='brew services list'
alias bservr='brew services restart'
alias bservs='brew services start'
alias bservx='brew services stop'

# Rocketeer
alias re="cd $HOME/projects/rocketeer_engine && poetry env activate"
alias rw="cd $HOME/projects/rocketeer_web && nvm use 16.13.1"

alias df="cd $HOME/.dotfiles && code dotfiles.code-workspace"

# Opio Chat
alias dc="cd $HOME/projects/doc-chat && poetry env activate"

# Matt Operating Manual
alias mmw="cd $HOME/projects/mrmattwright"

# Grizzwold
alias gz="cd $HOME/projects/grizzwold && poetry env activate"

# Drive Sorter
alias ds="cd $HOME/projects/drive-sorter && poetry env activate"

# Projects
alias p="cd $HOME/projects"

# Carbon Invoice
alias le="cd $HOME/projects/local-env"

# Gaspatchio
alias gs="cd $HOME/projects/gaspatchio"
alias gsp="cd $HOME/projects/gaspatchio/gaspatchio-core/bindings/python"
alias gsm="cd $HOME/projects/gaspatchio/gaspatchio-mix"
alias gsd="cd $HOME/projects/gaspatchio/gaspatchio-docs"