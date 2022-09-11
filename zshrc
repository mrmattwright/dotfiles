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

#at least moving passwords to a file that is gitignored for now
# source ~/.dotfiles/zsh/passwords.zsh
source ~/.dotfiles/zsh/m1_dual_setup.zsh
source ~/.dotfiles/zsh/programming.zsh
source ~/.dotfiles/zsh/plugins.zsh

source ~/.dotfiles/zsh/alias.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/mrmattwright/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" 
source $ZSH/oh-my-zsh.sh

# Makes pulls faster - so there(thanks intercom)
git config --global protocol.version 2

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.dotfiles/zsh/tools.zsh ] && source ~/.dotfiles/zsh/tools.zsh

