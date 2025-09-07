# Alacritty Configuration

Fast, GPU-accelerated terminal emulator configuration with WSL integration and custom keybindings.

## Dependencies

### Alacritty
**Debian/Ubuntu:**
```bash
sudo apt install alacritty
```
**macOS:**
```bash
brew install --cask alacritty
```
**Windows:**
- Download from [GitHub releases](https://github.com/alacritty/alacritty/releases)

### Font
**FiraCode Nerd Font** required for icons and ligatures:
- Download: [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases)
- Install the FiraCode variant
 
## Installation

### macOS/Linux
```bash
stow alacritty -t ~
```

### Windows
Copy files to: `%APPDATA%\Roaming\alacritty\`
```powershell
# PowerShell
cp alacritty.toml $env:APPDATA\Roaming\alacritty\
cp -r themes $env:APPDATA\Roaming\alacritty\
```

## Key Bindings

### Navigation
| Shortcut | Action | Terminal Sequence |
|----------|--------|--------------------|
| `Ctrl+Left` | Home | `\u001b[H` |
| `Ctrl+Right` | End | `\u0005` |
| `Alt+Left` | Word backward | `\u001b[1;5D` |
| `Alt+Right` | Word forward | `\u001b[1;5C` |

### Mouse Actions
| Action              | Binding |
|---------------------|---------|
| Select text         | Auto-copy to clipboard |
| Shift + Right-click | Paste |
| Middle-click        | Paste (if supported) |

## Theme Configuration

### Current Theme: Gruvbox Dark w\ customizations
- **Background**: Pure black (`#000000`)
- **Foreground**: Light gray (`#c7c7c7`)

### Switching Themes
Download [themes](https://github.com/alacritty/alacritty-theme) and place in the `themes/` dir
```toml
[general]
import = ["themes\\iterm.toml"]           # Windows
import = ["themes/iterm.toml"]            # macOS/Linux
```

## Platform-Specific Notes

### Windows
- **Config location**: `%APPDATA%\Roaming\alacritty\`
- **Path separators**: Use `\\` in TOML strings
- **WSL integration**: Configured for Ubuntu by default
- **Working directory**: Points to WSL home folder

### macOS/Linux
- **Config location**: `~/.config/alacritty/`
- **Path separators**: Use `/` in TOML strings
- **Shell**: Uses system default shell
- **Working directory**: Uses system home folder