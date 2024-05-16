
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
alias re="cd $HOME/projects/rocketeer_engine && poetry shell"
alias rw="cd $HOME/projects/rocketeer_web && nvm use 16.13.1"

alias df="cd $HOME/.dotfiles && code dotfiles.code-workspace"

# Opio Chat
alias dc="cd $HOME/projects/doc-chat && poetry shell"

# Matt Operating Manual
alias mmw="cd $HOME/projects/mrmattwright"

# Grizzwold
alias gz="cd $HOME/projects/grizzwold && poetry shell"

# Roz
alias rz="cd $HOME/projects/roz && poetry shell"

# Drive Sorter
alias ds="cd $HOME/projects/drive-sorter && poetry shell"

# Model Build
alias mbb="cd $HOME/projects/model-build-backend"

# Montoux API
alias map="cd $HOME/projects/montoux-api && poetry shell"

#aworkflow shortcuts
alias wfrs="curl -X POST -H 'Content-Type: application/json' -d @$HOME/Projects/workflow/workflow-defs/aws_scenario_demo_workflow_single.json http://localhost/api/v1/workflows/dynamic"
alias wfrm="curl -X POST -H 'Content-Type: application/json' -d @$HOME/Projects/workflow/workflow-defs/aws_scenario_demo_workflow.json http://localhost/api/v1/workflows/dynamic"