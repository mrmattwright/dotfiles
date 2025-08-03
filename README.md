# Setup
Install iterm and the apple developer toolkit (maybe I could move this into here
at some point). For some reason I have it set up so that you need to clone the
repo into ``$HOME/.dotfiles``, then the shmis work after you install. 

# dotfiles
I use [Dotbot](https://github.com/anishathalye/dotbot) to install and manage my
dotfiles, once you've forked the repository you should run. 
```
./install
```
This essentially sets up Symbolic links etc.  

Another excellent alternative seems to be [https://yadm.io/](https://yadm.io/) I
could be tempted to start again here. The secrets management looks pretty nice.

## Brewfile
Manage updates to brew with Brewfile and using 
```
brew bundle install --file brews/Brewfile
```

There are multiple brew files in brews/ one for each client/project

to install. You even get a nice Brewfile.lock.json for version managment.

## Theme
[Powerlevel10k](https://github.com/romkatv/powerlevel10k) - is set up by antigen

## Fzf
```/usr/local/opt/fzf/install``` to install fzf.

### Antigen 
I'm managing zsh plugins using [Antigen](https://github.com/zsh-users/antigen)
in the `zsh/plugins.zsh` file.
 
## Secrets Managment
Many solutions exist here. For now I've gone low tech where I just have a git
ignored passwords.zsh that gets loaded in zshrc. Better answers exist here (like
integrating the 1Password CLI) but this will do for now.  
