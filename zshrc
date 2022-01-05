if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

source ~/.zsh/alias.zsh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mrmattwright/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" 

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"


function arch_info()
{
    RED="\e[91m"
    YELLOW="\e[33m"
    EC="\e[0m"
    # arch_s="$(arch)"
    # if [[ $arch_s == "arm64" ]];
    # then
    #     :
    # else
    #     echo "(i386) "
    # fi
    if is-intel; then
        echo "${YELLOW}(x86)${EC} "
    else
        if is-rosetta; then
            echo "${RED}(x86r)${EC} "
        else
            :
        fi
    fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='$(arch_info)%F{cyan}%1~%f%b %# '

# M1 stuff
function is-intel() {
    # Check to see if proc_translated is available at all
    if result=$(sysctl -n sysctl.proc_translated 2>&1); then
        # Non error means we're on M1 of some kind (maybe though rosetta!)
        false
    else
        # Error means we're on native intel
        true
    fi
}
# Probably run is-intel() first to handle true intel chips as the stderr isn't handler here
function is-rosetta() {
    # Check to see if we're proc_translated
    if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
        # We're translated == rosetta
        true
    else
        # No translation, arm64 native!
        false
    fi
}


if is-intel || is-rosetta; then
    eval "$(/usr/local/homebrew/bin/brew shellenv)"
    export BREW_OPT_PATH="/usr/local/homebrew/opt"
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export BREW_OPT_PATH="/opt/homebrew/opt"
fi

# This is all intel & rosetta only for now, no arm
if is-intel || is-rosetta; then
    # brew based dependencies
    export CFLAGS="-I$BREW_OPT_PATH/openssl@1.1/include -I$BREW_OPT_PATH/readline/include -I$BREW_OPT_PATH/sqlite/include -I$BREW_OPT_PATH/zlib/include -I$BREW_OPT_PATH/xz/include -I$BREW_OPT_PATH/bzip2/include -I$(xcrun --show-sdk-path)/usr/include"
    export CPPFLAGS="-I$BREW_OPT_PATH/openssl@1.1/include -I$BREW_OPT_PATH/readline/include -I$BREW_OPT_PATH/sqlite/include -I$BREW_OPT_PATH/zlib/include -I$BREW_OPT_PATH/xz/include -I$BREW_OPT_PATH/bzip2/include -I$(xcrun --show-sdk-path)/usr/include"
    export LDFLAGS="-L$BREW_OPT_PATH/openssl@1.1/lib -L$BREW_OPT_PATH/readline/lib -L$BREW_OPT_PATH/sqlite/lib -L$BREW_OPT_PATH/zlib/lib -L$BREW_OPT_PATH/xz/lib -L$BREW_OPT_PATH/bzip2/lib"
    export PKG_CONFIG_PATH="$BREW_OPT_PATH/openssl@1.1/lib/pkgconfig $BREW_OPT_PATH/readline/lib/pkgconfig $BREW_OPT_PATH/sqlite/lib/pkgconfig $BREW_OPT_PATH/zlib/lib/pkgconfig $BREW_OPT_PATH/zlib/xz/pkgconfig $BREW_OPT_PATH/zlib/bzip2/pkgconfig"

    # Pyenv
    # export PYENV_ROOT="$HOME/.pyenv"
    # export PATH="$PYENV_ROOT/bin:$PATH"
    # https://github.com/pyenv/pyenv#basic-github-checkout
    # https://opensource.com/article/19/5/python-3-default-mac
    # if is-intel; then
    #    eval "$(pyenv init -)"
    # else
    #    if command -v pyenv 1>/dev/null 2>&1; then
    #        eval "$(pyenv init --path)"
    #    fi
    # fi

    # # Poetry
    # export PATH="$HOME/.local/bin:$PATH"
else
    # brew based dependencies
    export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib -L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include -I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"
    export OPENBLAS="$(brew --prefix openblas)"
    #export CFLAGS="-I$BREW_OPT_PATH/openssl@1.1/include -I$BREW_OPT_PATH/readline/include -I$BREW_OPT_PATH/sqlite/include -I$BREW_OPT_PATH/zlib/include -I$BREW_OPT_PATH/xz/include -I$BREW_OPT_PATH/bzip2/include -I$(xcrun --show-sdk-path)/usr/include"
    #export CPPFLAGS="-I$BREW_OPT_PATH/openssl@1.1/include -I$BREW_OPT_PATH/readline/include -I$BREW_OPT_PATH/sqlite/include -I$BREW_OPT_PATH/zlib/include -I$BREW_OPT_PATH/xz/include -I$BREW_OPT_PATH/bzip2/include -I$(xcrun --show-sdk-path)/usr/include"
    #§export LDFLAGS="-L$BREW_OPT_PATH/openssl@1.1/lib -L$BREW_OPT_PATH/readline/lib -L$BREW_OPT_PATH/sqlite/lib -L$BREW_OPT_PATH/zlib/lib -L$BREW_OPT_PATH/xz/lib -L$BREW_OPT_PATH/bzip2/lib"
    #export PKG_CONFIG_PATH="$BREW_OPT_PATH/openssl@1.1/lib/pkgconfig $BREW_OPT_PATH/readline/lib/pkgconfig $BREW_OPT_PATH/sqlite/lib/pkgconfig $BREW_OPT_PATH/zlib/lib/pkgconfig $BREW_OPT_PATH/zlib/xz/pkgconfig $BREW_OPT_PATH/zlib/bzip2/pkgconfig"

    # # Pyenv
    # eval "$(pyenv init -)"

    # # Poetry
    # export PATH="$HOME/.local/bin:$PATH"
fi

if is-intel || is-rosetta; then
    export PYENV_ROOT="$HOME/.pyenv-x86"
    export POETRY_HOME="$HOME/Library/Application Support/pypoetry-x86"
    export PYENV_BIN="$PYENV_ROOT/bin"
    export PYTHONPATH="$PYENV_ROOT/shims"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export POETRY_CACHE_DIR="$HOME/Library/Caches/pypoetry-x86"
    export PATH="$HOME/Library/Application Support/pypoetry-x86/venv/bin:$PATH"
    eval "$(pyenv init --path)"
else    
    export PYENV_ROOT="$HOME/.pyenv"
    export POETRY_HOME="$HOME/Library/Application Support/pypoetry"
    export PYENV_BIN="$PYENV_ROOT/bin"
    export PYTHONPATH="$PYENV_ROOT/shims"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export POETRY_CACHE_DIR="$HOME/Library/Caches/pypoetry"
    export PATH="$HOME/Library/Application Support/pypoetry/venv/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# for poetry - pobably not good for dual toolchain
#export PATH="$HOME/.local/bin:$PATH"

# Makes pulls faster - so there(thanks intercom)
git config --global protocol.version 2

if is-intel; then
  local brew_path="/usr/local/homebrew/bin"
  local brew_opt_path="/usr/local/opt"
  local nvm_path="$HOME/.nvm"
  export NVM_DIR="${nvm_path}"
else
  if is-rosetta; then
    local brew_path="/usr/local/homebrew/bin"
    local brew_opt_path="/usr/local/opt"
    local nvm_path="$HOME/.nvm-x86"
    export NVM_DIR="${nvm_path}"
  else
    local brew_path="/opt/homebrew/bin"
    local brew_opt_path="/opt/homebrew/bin"
    local nvm_path="$HOME/.nvm"
    export NVM_DIR="$HOME/.nvm"
  fi
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto NVMRC
# https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Mobi storefront
export GITLAB_TOKEN=6sGWZX54sKs5zDiKLdKv

#Chromedriver 
export PATH="$HOME/projects/bin:$PATH"
alias re="cd $HOME/projects/rocketeer_engine && poetry shell"

