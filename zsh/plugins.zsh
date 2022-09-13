source ~/.dotfiles/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle pyenv
antigen bundle fzf
antigen bundle dgnest/zsh-gvm-plugin

antigen theme romkatv/powerlevel10k

antigen apply
