# Dotfiles

Dotfiles for providing a consistent development environment across macOS and Windows (WSL)

## Components

- **[alacritty/](alacritty/)** - terminal emulator
- **[git/](git/)** - delta diff viewer
- **[hammerspoon/](hammerspoon/)** - macOS key bindings
- **[nvim/](nvim/)** - neovim config based on AstroNvim v5
- **[psql/](psql/)** - PostgreSQL client with FZF integration
- **[tmux/](tmux/)** - terminal multiplexer
- **[zsh/](zsh/)** - Zsh shell with Oh My Zsh

## Dependencies

    alacritty
    tmux
    nvim
    zsh
    ohmyzsh
    zsh-autosuggestions
    fzf
    ripgrep
    delta
    unzip
    eza
    bat
    carapace-bin

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

# Install carapace-bin
CARAPACE_VERSION=$(curl -s https://api.github.com/repos/carapace-sh/carapace-bin/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget "https://github.com/carapace-sh/carapace-bin/releases/download/${CARAPACE_VERSION}/carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
tar -xzf "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
sudo mv carapace /usr/local/bin/
rm "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"

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
brew install stow zsh tmux neovim fzf eza bat ripgrep git-delta carapace
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

## Automated Setup (WSL Ubuntu)

For Windows WSL Ubuntu users (amd64 architecture), you can use the automated setup script:

```bash
git clone https://github.com/YArane/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

The `setup.sh` script will:
- Update system packages
- Install all required dependencies
- Download and install the latest versions of Neovim and git-delta
- Set up Oh My Zsh with autosuggestions and FZF integration
- Backup any existing conflicting configuration files
- Use GNU Stow to symlink all dotfile configurations
- Set zsh as your default shell

After running the script, restart your terminal or run `exec zsh` to start using your new setup.

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
