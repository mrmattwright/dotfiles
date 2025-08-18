if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

autoload -Uz compinit
compinit

# https://superuser.com/questions/1245273/iterm2-version-3-individual-history-per-tab
unsetopt inc_append_history
unsetopt share_history

#at least moving passwords to a file that is gitignored for now
source ~/.dotfiles/zsh/passwords.zsh
source ~/.dotfiles/zsh/programming.zsh
#source ~/.dotfiles/zsh/plugins.zsh

source ~/.dotfiles/zsh/alias.zsh
source ~/.dotfiles/zsh/montoux.zsh

# Makes pulls faster - so there(thanks intercom)
git config --global protocol.version 2


[ -f ~/.dotfiles/zsh/tools.zsh ] && source ~/.dotfiles/zsh/tools.zsh

export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="${HOME}/.cargo/bin:$PATH"
export PATH="/Users/mrmattwright/.modular/pkg/packages.modular.com_mojo/bin:$PATH"


zstyle ':completion:*' menu select
fpath+=~/.zfunc

#. "$HOME/.cargo/env"

# Mojo
eval "$(direnv hook zsh)"
export MODULAR_HOME="/Users/mrmattwright/.modular"
export PATH="/Users/mrmattwright/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="$PATH:/Users/mrmattwright/.modular/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Created by `pipx` on 2025-03-30 19:54:18
export PATH="$PATH:/Users/mrmattwright/.local/bin"

# starship
eval "$(starship init zsh)"

# nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt INC_APPEND_HISTORY SHARE_HISTORY
export FZF_DEFAULT_OPTS='--tmux center,100%,40% --reverse --border'
export PROMPT_COMMAND='history -a; history -c; history -r'

fpath+=~/.zfunc; autoload -Uz compinit; compinit

# bun completions
[ -s "/Users/mrmattwright/.bun/_bun" ] && source "/Users/mrmattwright/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/mrmattwright/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
