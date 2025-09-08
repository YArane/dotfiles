#!/bin/bash

set -e  # Exit on any error

echo "Starting development environment setup..."

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install core dependencies
echo "Installing core dependencies..."
sudo apt install -y stow zsh tmux bat ripgrep unzip curl wget

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
if ! command -v eza &> /dev/null; then
    EZA_VERSION=$(curl -s https://api.github.com/repos/eza-community/eza/releases/latest | grep -Po '"tag_name": "\K[^"]*')
    echo "Installing eza ${EZA_VERSION}..."
    wget -q "https://github.com/eza-community/eza/releases/download/${EZA_VERSION}/eza_x86_64-unknown-linux-gnu.tar.gz"
    tar -xzf "eza_x86_64-unknown-linux-gnu.tar.gz"
    sudo mv eza /usr/local/bin/
    rm "eza_x86_64-unknown-linux-gnu.tar.gz"
else
    echo "eza already installed, skipping..."
fi

# Install FZF
echo "Installing FZF..."
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-bash --no-fish
else
    echo "FZF already installed, skipping..."
fi

# Install carapace-bin
echo "Installing carapace-bin..."
if ! command -v carapace &> /dev/null; then
    CARAPACE_VERSION=$(curl -s https://api.github.com/repos/carapace-sh/carapace-bin/releases/latest | grep -Po '"tag_name": "\K[^"]*')
    echo "Installing carapace-bin ${CARAPACE_VERSION}..."
    wget -q "https://github.com/carapace-sh/carapace-bin/releases/download/${CARAPACE_VERSION}/carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
    tar -xzf "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
    sudo mv carapace /usr/local/bin/
    rm "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
else
    echo "carapace-bin already installed, skipping..."
fi

# Install git-delta
echo "Installing git-delta..."
if ! command -v delta &> /dev/null; then
    DELTA_VERSION=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep -Po '"tag_name": "\K[^"]*')
    echo "Installing git-delta ${DELTA_VERSION}..."
    wget -q "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb"
    sudo dpkg -i "git-delta_${DELTA_VERSION}_amd64.deb"
    rm "git-delta_${DELTA_VERSION}_amd64.deb"
else
    echo "git-delta already installed, skipping..."
fi

# Install Neovim
echo "Installing Neovim..."
if ! command -v nvim &> /dev/null; then
    echo "Downloading latest Neovim release..."
    NVIM_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -Po '"tag_name": "\K[^"]*')
    wget -q "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"
    sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt/
    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux-x86_64.tar.gz
    echo "Neovim ${NVIM_VERSION} installed successfully"
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
    if echo "$stow_output" | grep -q "existing target is"; then
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
        esac
        
        echo "Conflicting files backed up to: $backup_dir"
    else
        echo "No conflicts found for $component"
    fi
}

# Stow dotfiles (assuming you're in the dotfiles directory)
echo "Stowing dotfiles..."
if [ -d "git" ] && [ -d "nvim" ] && [ -d "tmux" ] && [ -d "zsh" ]; then
    for component in git nvim tmux zsh; do 
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
