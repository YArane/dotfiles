# Yarden's Dotfiles

Aimed at having a consistent development environment on both MacOS and Windows (WSL).

## Components

- **[alacritty/](alacritty/)** - terminal emulator
- **[git/](git/)** - delta diff viewer
- **[hammerspoon/](hammerspoon/)** - macOS key bindings
- **[nvim/](nvim/)** - neovim config based on AstroNvim v5
- **[psql/](psql/)** - PostgreSQL client with FZF integration
- **[tmux/](tmux/)** - terminal multiplexer
- **[zsh/](zsh/)** - Zsh shell with Oh My Zsh

## Dependencies

For automated dependency installation:

**Debian/Ubuntu:**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install core dependencies
sudo apt install -y stow zsh tmux alacritty eza bat ripgrep unzip git

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Install git-delta
wget https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
sudo dpkg -i git-delta_0.18.2_amd64.deb

# Install Neovim
sudo snap install nvim --classic

# Set zsh as default shell
chsh -s $(which zsh)
```

**macOS:**
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install stow zsh tmux neovim fzf eza bat ripgrep git-delta
brew install --cask alacritty hammerspoon

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install FZF shell integrations
$(brew --prefix)/opt/fzf/install

# Set zsh as default shell
chsh -s /opt/homebrew/bin/zsh
```

### Installation

These dotfiles are designed to be managed using [GNU Stow](https://www.gnu.org/software/stow/).

```bash
git clone https://github.com/YArane/dotfiles.git
cd dotfiles
```

### Using Stow

To install core components:
```bash
for component in git nvim tmux zsh; do 
  stow $component -t ~;
done
```

To install a specific component:
```bash
stow zsh -t ~        # Install zsh config to home directory
stow nvim -t ~       # Install nvim config to home directory
stow tmux -t ~       # Install tmux config to home directory
```

To remove/unstow a component:
```bash
stow -D zsh -t ~     # Remove zsh config
stow -D */ -t ~      # Remove all configs
```