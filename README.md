# Setup
Install iTerm2 and the Apple developer toolkit. Clone the repo into `$HOME/.dotfiles`, then run:
```
./install
```
This uses [Dotbot](https://github.com/anishathalye/dotbot) to create symlinks for zshrc, gitconfig, starship.toml, tmux.conf, etc.

## Brewfile
Multiple Brewfiles in `brews/` — one per client/project. Install with:
```
brew bundle install --file brews/Brewfile
```

## Shell
- **Prompt**: [Starship](https://starship.rs/) — configured in `config/starship.toml`
- **Plugins**: `zsh-autosuggestions` and `zsh-syntax-highlighting` installed via Homebrew, sourced directly in zshrc
- **History**: [atuin](https://github.com/atuinsh/atuin) — searchable shell history (replaces Ctrl+R)
- **Navigation**: [zoxide](https://github.com/ajeetdsouza/zoxide) — smart `cd` replacement (`z` command)
- **Listings**: [eza](https://github.com/eza-community/eza) — modern `ls` replacement (aliased in `zsh/alias.zsh`)
- **Fuzzy finder**: [fzf](https://github.com/junegunn/fzf) — configured in `zsh/tools.zsh`
- **File viewer**: [bat](https://github.com/sharkdp/bat) — `cat` with syntax highlighting

## tmux
Config in `tmux.conf`. Prefix is `Ctrl+A`. Includes vim-style pane navigation, mouse support, and extended keys for apps like Claude Code.

Plugins managed via [tpm](https://github.com/tmux-plugins/tpm): tmux-powerline, tmux-resurrect, tmux-continuum.

## iTerm2
Aiming for a Warp-like setup:
- **Theme**: Minimal with Nord color scheme
- **Font**: Nerd Font (for Starship icons)
- **Shell Integration**: enabled for command marks

## Secrets Management
Git-ignored `passwords.zsh` loaded in zshrc. 1Password CLI is available for future integration.

## Zsh Config Structure
- `zshrc` — main config, sources everything below
- `zsh/alias.zsh` — aliases (eza, git, project shortcuts)
- `zsh/tools.zsh` — fzf, 1Password CLI, iTerm2 shell integration
- `zsh/programming.zsh` — pyenv, nvm, mojo, poetry paths
- `zsh/montoux.zsh` — work-specific aliases and paths
- `zsh/passwords.zsh` — secrets (gitignored)
