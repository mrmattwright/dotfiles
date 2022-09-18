 alias mon="cd $HOME/projects/monty"
 alias docs="cd $HOME/projects/docs"
 alias kt="cd $HOME/projects/montoux-exec"
 


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