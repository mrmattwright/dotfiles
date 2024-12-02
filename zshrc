if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit

# https://superuser.com/questions/1245273/iterm2-version-3-individual-history-per-tab
unsetopt inc_append_history
unsetopt share_history

#at least moving passwords to a file that is gitignored for now
source ~/.dotfiles/zsh/passwords.zsh
source ~/.dotfiles/zsh/programming.zsh
source ~/.dotfiles/zsh/plugins.zsh

source ~/.dotfiles/zsh/alias.zsh
source ~/.dotfiles/zsh/montoux.zsh

# Makes pulls faster - so there(thanks intercom)
git config --global protocol.version 2

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.dotfiles/zsh/tools.zsh ] && source ~/.dotfiles/zsh/tools.zsh

export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="${HOME}/.cargo/bin:$PATH"
export PATH="/Users/mrmattwright/.modular/pkg/packages.modular.com_mojo/bin:$PATH"


zstyle ':completion:*' menu select
fpath+=~/.zfunc

. "$HOME/.cargo/env"

eval "$(direnv hook zsh)"
export MODULAR_HOME="/Users/mrmattwright/.modular"
export PATH="/Users/mrmattwright/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="$PATH:/Users/mrmattwright/.modular/bin"
