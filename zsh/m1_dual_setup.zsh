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
    export CPPFLAGS="-I$BREW_OPT_PATH/openssl@1.1/include -I$BREW_OPT_PATH/readline/include -I$BREW_OPT_PATH/libpq/include -I$BREW_OPT_PATH/sqlite/include -I$BREW_OPT_PATH/zlib/include -I$BREW_OPT_PATH/xz/include -I$BREW_OPT_PATH/bzip2/include -I$(xcrun --show-sdk-path)/usr/include"
    export LDFLAGS="-L$BREW_OPT_PATH/openssl@1.1/lib -L$BREW_OPT_PATH/readline/lib -L$BREW_OPT_PATH/sqlite/lib -L$BREW_OPT_PATH/libpq/lib -L$BREW_OPT_PATH/zlib/lib -L$BREW_OPT_PATH/xz/lib -L$BREW_OPT_PATH/bzip2/lib"
    export PKG_CONFIG_PATH="$BREW_OPT_PATH/openssl@1.1/lib/pkgconfig $BREW_OPT_PATH/readline/lib/pkgconfig $BREW_OPT_PATH/libpq/lib/pkgconfig $BREW_OPT_PATH/sqlite/lib/pkgconfig $BREW_OPT_PATH/zlib/lib/pkgconfig $BREW_OPT_PATH/zlib/xz/pkgconfig $BREW_OPT_PATH/zlib/bzip2/pkgconfig"

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
