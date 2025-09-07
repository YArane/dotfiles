# Zsh Configuration

Modern shell configuration with Oh My Zsh, plugins for completions

## Dependencies

### Zsh Shell
**Debian/Ubuntu:**
```bash
sudo apt install zsh -y
chsh -s $(which zsh)
```
**macOS:**
```bash
brew install zsh
chsh -s /opt/homebrew/bin/zsh
```

### Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Zsh Autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### FZF (Fuzzy Finder)
**Debian/Ubuntu:**
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
**macOS:**
```bash
brew install fzf
$(brew --prefix)/opt/fzf/install
```

### Enhanced Tools
**Debian/Ubuntu:**
```bash
sudo apt install eza bat ripgrep
```
**macOS:**
```bash
brew install eza bat ripgrep
```

## Installation

```bash
stow zsh -t ~
```

## Features

### Plugin Philosophy
- **Completions only** - No plugin aliases

### Enhanced History
- **Large history** - 100,000 commands saved
- **Incremental append** - Commands saved immediately
- **No sharing** - Each session has independent history

### Modern Replacements
- **eza** instead of `ls` - Better file listing with icons
- **bat** instead of `cat` - Syntax highlighting
- **fzf** - Fuzzy file/history finding

## Plugins

```bash
plugins=(
  docker          # Docker completions
  docker-compose  # Docker Compose completions
  git            # Git completions and info
  helm           # Helm completions
  kubectl        # Kubernetes completions
  minikube       # Minikube completions
  mvn            # Maven completions
  ssh            # SSH completions
  zsh-autosuggestions  # Command suggestions
)
```

**Note**: All plugin aliases are disabled (`zstyle ':omz:plugins:*' aliases no`)

## Aliases

### File Listing (eza)
| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza --color=always --group-directories-first --icons` | Basic listing with icons |
| `ll` | `eza -la --icons --no-permissions --group-directories-first --total-size` | Long format, no permissions |
| `llm` | `eza -lb --header --git --sort=modified --color=always --icons` | Sort by modified time |
| `lls` | `eza -lb --header --git --sort=size --reverse --color=always --icons --total-size` | Sort by size |
| `la` | `eza -la --icons --octal-permissions --group-directories-first --total-size` | All files with permissions |
| `lx` | `eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons --total-size` | Everything |
| `l` | `eza -1 --color=always --group-directories-first --icons` | Single column |

### Tree Listing
```bash
lt [level]    # Tree view, default 2 levels deep
# Examples:
lt           # 2 levels
lt 3         # 3 levels  
lt 1         # 1 level
```

### File Viewing (bat)
| Alias | Command | Description |
|-------|---------|-------------|
| `cat` | `batcat -pp` | Syntax highlighted cat (Ubuntu: `batcat`) |

### Editor
| Alias | Command | Description |
|-------|---------|-------------|
| `vi` | `nvim` | Use Neovim instead of vim |


## Tips

1. **History search**: Use `Ctrl-R` for fzf history search
2. **Directory jumping**: Use `cd **<TAB>` for fzf directory completion
3. **File completion**: Use `vim **<TAB>` for fzf file completion
4. **Command suggestions**: Accept with `→` key or `End`
5. **Git shortcuts**: Use oh-my-zsh git aliases (gst, gco, gp, etc.)
6. **Auto completions**: Tab completion works for common tools