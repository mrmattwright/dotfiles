alias mon="cd $HOME/projects/monty"
alias docs="cd $HOME/projects/docs"
alias kt="cd $HOME/projects/montoux-exec"
alias ag="cd $HOME/projects/autogen"

alias wf="cd $HOME/projects/workflow"
alias wfi="cd $HOME/projects/workflow-infrastructure"
#hash -d wfi="$HOME/projects/workflow-infrastructure"
hash -d wfd="$HOME/projects/workflow" 

# Model Copilot
alias mc="cd $HOME/projects/model-copilot"
# Model Copilot Core + web 
alias mcc="cd $HOME/projects/model-copilot/model-copilot-core"
alias mcw="cd $HOME/projects/model-copilot/model-copilot-web"

 
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib -L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include -I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"
export OPENBLAS="$(brew --prefix openblas)"

#ensure redis-stack is on the path.
export PATH=/opt/homebrew/Caskroom/redis-stack-server/7.2.0-v7/bin:$PATH

export PATH=$PATH:$HOME/go/bin

function __vault_profile {
    if [ "$AWS_VAULT" = "" ]; then
        echo ""
    else
        echo "($AWS_VAULT until $(date --date $AWS_SESSION_EXPIRATION +%H:%M)) "
    fi
}

function __aws_region {
    if [ "$AWS_DEFAULT_REGION" = "" ]; then
        echo ""
    else
        echo "$AWS_DEFAULT_REGION "
    fi
}