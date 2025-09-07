# Tmux Configuration

Terminal multiplexer configuration with vim-style navigation and custom key bindings.

## Dependencies

### Tmux
**Debian/Ubuntu:**
```bash
sudo apt install tmux
```
**macOS:**
```bash
brew install tmux
```

## Installation

```bash
stow tmux -t ~
```

## Key Bindings

### Prefix Key
- **Leader**: `Ctrl-A` (instead of default `Ctrl-B`)

### Session Management
| Shortcut | Action |
|----------|--------|
| `Ctrl-A + r` | Reload tmux config |
| `Ctrl-A + Ctrl-J` | Choose session/window tree |

### Pane Navigation (Vi-style)
| Shortcut | Action |
|----------|--------|
| `Ctrl-A + h` | Move to left pane |
| `Ctrl-A + j` | Move to bottom pane |
| `Ctrl-A + k` | Move to top pane |
| `Ctrl-A + l` | Move to right pane |
| `Ctrl-A + Ctrl-A` | Quick cycle to next pane |

### Pane Management
| Shortcut | Action |
|----------|--------|
| `Ctrl-A + b` | Break pane into new window |
| `Ctrl-A + v` | Join last window as pane |
| `Ctrl-A + <` | Resize pane left (5 cells) |
| `Ctrl-A + >` | Resize pane right (5 cells) |
| `Ctrl-A + +` | Resize pane up (5 cells) |
| `Ctrl-A + -` | Resize pane down (5 cells) |
| `Ctrl-A + =` | Even vertical layout |
| `Ctrl-A + \|` | Even horizontal layout |

### Copy Mode (Vi-style)
| Shortcut | Action |
|----------|--------|
| `Ctrl-A + [` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `y` | Copy selection and exit |
| `q` | Exit copy mode |

## Mouse Support

- **Click panes** - Switch between panes
- **Click windows** - Switch between windows  
- **Drag borders** - Resize panes
- **Scroll wheel** - Scroll through history
- **Shift + Right-click paste** - No context menu