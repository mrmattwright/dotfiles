
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
alias gscore="cd $HOME/projects/gaspatchio/gaspatchio-core/core"
alias gsm="cd $HOME/projects/gaspatchio/gaspatchio-mix"
alias gsd="cd $HOME/projects/gaspatchio/gaspatchio-docs"
alias gst="cd $HOME/projects/gst"

# Orac (Mac Mini) - all via mosh (UDP, survives laptop sleep/roaming)
# pattern: orac-<project>[-cx]   bare = claude, -cx = codex; both in auto mode
alias orac='mosh orac -- bash -lc "tmux attach -t main || tmux new -s main"'
alias orac-main='mosh orac -- bash -lc "tmux new-session -A -s main -c ~/projects '\''claude --permission-mode auto'\''"'
alias orac-main2='mosh orac -- bash -lc "tmux new-session -A -s main2 -c ~/projects"'
alias orac-gas='mosh orac -- bash -lc "tmux new-session -A -s gas -c ~/projects/gaspatchio/gaspatchio-oss '\''claude --permission-mode auto'\''"'
alias orac-gaspy='mosh orac -- bash -lc "tmux new-session -A -s gaspy -c ~/projects/gaspatchio/gaspatchio-oss '\''claude --permission-mode auto'\''"'
alias orac-gasdocs='mosh orac -- bash -lc "tmux new-session -A -s gasdocs -c ~/projects/gaspatchio/gaspatchio-docs '\''claude --permission-mode auto'\''"'
alias orac-lab='mosh orac -- bash -lc "tmux new-session -A -s lab -c ~/projects/gaspatchio/gaspatchio-lab '\''claude --permission-mode auto'\''"'
alias orac-laby='mosh orac -- bash -lc "tmux new-session -A -s laby -c ~/projects/gaspatchio/gaspatchio-lab '\''claude --permission-mode auto'\''"'
alias orac-media='mosh orac -- bash -lc "tmux new-session -A -s media -c ~/projects/media-server '\''claude --dangerously-skip-permissions'\''"'
alias orac-rock='mosh orac -- bash -lc "tmux new-session -A -s rock -c ~/projects/rocketeer '\''claude --dangerously-skip-permissions'\''"'
alias orac-rocky='mosh orac -- bash -lc "tmux new-session -A -s rocky -c ~/projects/rocketeer '\''claude --dangerously-skip-permissions'\''"'
alias orac-golf='mosh orac -- bash -lc "tmux new-session -A -s golf -c ~/projects/golf-stats '\''claude --dangerously-skip-permissions'\''"'
alias orac-mar='mosh orac -- bash -lc "tmux new-session -A -s mar -c ~/projects/xl-marinade '\''claude --permission-mode auto'\''"'
alias orac-opio-web='mosh orac -- bash -lc "tmux new-session -A -s opio-web -c ~/projects/opio-web '\''claude --permission-mode auto'\''"'

# Codex on orac - own tmux sessions (<project>-cx)
# ~/bin/codex-longrun (on orac) = workspace-write + network + writable .git + -a never
alias orac-gas-cx='mosh orac -- bash -lc "tmux new-session -A -s gas-cx -c ~/projects/gaspatchio/gaspatchio-oss '\''/Users/mrmattwright/bin/codex-longrun'\''"'
alias orac-gaspy-cx='mosh orac -- bash -lc "tmux new-session -A -s gaspy-cx -c ~/projects/gaspatchio/gaspatchio-oss '\''/Users/mrmattwright/bin/codex-longrun'\''"'
alias orac-gasdocs-cx='mosh orac -- bash -lc "tmux new-session -A -s gasdocs-cx -c ~/projects/gaspatchio/gaspatchio-docs '\''/Users/mrmattwright/bin/codex-longrun'\''"'
alias orac-lab-cx='mosh orac -- bash -lc "tmux new-session -A -s lab-cx -c ~/projects/gaspatchio/gaspatchio-lab '\''/Users/mrmattwright/bin/codex-longrun'\''"'
alias orac-laby-cx='mosh orac -- bash -lc "tmux new-session -A -s laby-cx -c ~/projects/gaspatchio/gaspatchio-lab '\''/Users/mrmattwright/bin/codex-longrun'\''"'
alias orac-opio-web-cx='mosh orac -- bash -lc "tmux new-session -A -s opio-web-cx -c ~/projects/opio-web '\''/Users/mrmattwright/bin/codex-longrun'\''"'

#agents
alias claude-auto="claude --permission-mode auto"
alias claude-yolo="claude --dangerously-skip-permissions"
alias amp-yolo="claude --dangerously-allow-all"

# tere
alias teb="cd $HOME/projects/tere/tere-fastapi"
alias tef="cd $HOME/projects/tere/tere-svelte"
alias te="cd $HOME/projects/tere"