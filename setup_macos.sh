#!/bin/bash

set -e # Exit on any error

echo "Starting development environment setup for macOS..."

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed, updating..."
    brew update
fi

# Install core dependencies
echo "Installing core dependencies..."
brew install stow zsh tmux bat ripgrep unzip curl wget fd zoxide sesh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed, skipping..."
fi

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions already installed, skipping..."
fi

# Install eza
echo "Installing eza..."
if ! command -v eza &>/dev/null; then
    brew install eza
else
    echo "eza already installed, skipping..."
fi

# Install FZF
echo "Installing FZF..."
if ! command -v fzf &>/dev/null; then
    brew install fzf
    # Setup fzf key bindings and fuzzy completion
    $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
else
    echo "FZF already installed, skipping..."
fi

# Install carapace-bin
echo "Installing carapace-bin..."
if ! command -v carapace &>/dev/null; then
    brew install carapace
else
    echo "carapace-bin already installed, skipping..."
fi

# Install git-delta
echo "Installing git-delta..."
if ! command -v delta &>/dev/null; then
    brew install git-delta
else
    echo "git-delta already installed, skipping..."
fi

# Install Neovim
echo "Installing Neovim..."
if ! command -v nvim &>/dev/null; then
    brew install neovim
else
    echo "Neovim already installed, skipping..."
fi

# Function to backup and remove conflicting files
backup_and_remove_conflicts() {
    local component=$1
    local backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

    echo "Checking for conflicts with $component..."

    # Get stow dry-run output
    local stow_output=$(stow -n $component -t ~ 2>&1 || true)

    # Check if there are any conflicts
    if echo "$stow_output" | grep -q "would cause conflicts"; then
        echo "Conflicts found for $component, backing up existing files..."
        mkdir -p "$backup_dir"
        echo "Created backup directory: $backup_dir"

        # Handle common conflicting files based on component
        case $component in
        "git")
            [ -f "$HOME/.gitconfig" ] && mv "$HOME/.gitconfig" "$backup_dir/" && echo "Backed up .gitconfig"
            [ -f "$HOME/.gitignore_global" ] && mv "$HOME/.gitignore_global" "$backup_dir/" && echo "Backed up .gitignore_global"
            ;;
        "nvim")
            if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
                mv "$HOME/.config/nvim" "$backup_dir/nvim_config" && echo "Backed up ~/.config/nvim"
            fi
            ;;
        "tmux")
            [ -f "$HOME/.tmux.conf" ] && mv "$HOME/.tmux.conf" "$backup_dir/" && echo "Backed up .tmux.conf"
            ;;
        "zsh")
            [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$backup_dir/" && echo "Backed up .zshrc"
            [ -f "$HOME/.zshenv" ] && [ ! -L "$HOME/.zshenv" ] && mv "$HOME/.zshenv" "$backup_dir/" && echo "Backed up .zshenv"
            [ -f "$HOME/.zprofile" ] && [ ! -L "$HOME/.zprofile" ] && mv "$HOME/.zprofile" "$backup_dir/" && echo "Backed up .zprofile"
            ;;
        "sesh")
            if [ -d "$HOME/.config/sesh" ] && [ ! -L "$HOME/.config/sesh" ]; then
                mv "$HOME/.config/sesh" "$backup_dir/sesh_config" && echo "Backed up ~/.config/sesh"
            fi
            ;;
        esac

        echo "Conflicting files backed up to: $backup_dir"
    else
        echo "No conflicts found for $component"
    fi
}

# Stow dotfiles (assuming you're in the dotfiles directory)
echo "Stowing dotfiles..."
if [ -d "git" ] && [ -d "nvim" ] && [ -d "tmux" ] && [ -d "zsh" ] && [ -d "sesh" ]; then
    for component in git nvim tmux zsh sesh; do
        echo "Processing $component..."
        backup_and_remove_conflicts $component
        echo "Stowing $component..."
        stow $component -t ~
        echo "$component stowed successfully"
    done
else
    echo "Warning: Not all dotfile directories found. Make sure you're running this from your dotfiles directory."
    echo "Expected directories: git, nvim, tmux, zsh"
fi

# Set zsh as default shell
echo "Setting zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Shell changed to zsh. Please log out and log back in for the change to take effect."
else
    echo "zsh is already the default shell."
fi

echo "Setup completed successfully!"
echo "Please restart your terminal or run 'exec zsh' to start using your new setup."
