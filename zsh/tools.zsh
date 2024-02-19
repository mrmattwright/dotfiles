# fzf

FD_OPTIONS="--follow --exclude .git --exclude node_modules"

export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ---------
# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Fly.io
# ------------
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# 1Password
# ------------
eval "$(op completion zsh)"; compdef _op op

# Diable iTerm for use with Warp
# ------------
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi