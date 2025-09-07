# Hammerspoon Configuration

macOS key binding configuration using Hammerspoon.

## Features

- **PC-style key bindings** - Ctrl+C/V/X for copy/paste/cut
- **Middle-click scrolling** - Windows-style scroll wheel behavior  
- **Window management** - Move windows between displays
- **Application-specific overrides** - Custom bindings per app
- **Keyboard remapping** - Scroll Lock → Command key

## Installation

```bash
stow hammerspoon -t ~
```

## Dependencies

### Hammerspoon (macOS only)
```bash
brew install --cask hammerspoon
```

After installation:
1. Launch Hammerspoon
2. Enable accessibility permissions when prompted
3. Config will auto-load from `~/.hammerspoon/`

## Key Bindings

### Global PC-Style Shortcuts
| Shortcut | Action | Maps to macOS |
|----------|--------|---------------|
| `Ctrl+C` | Copy | `Cmd+C` |
| `Ctrl+V` | Paste | `Cmd+V` |
| `Ctrl+X` | Cut | `Cmd+X` |
| `Ctrl+A` | Select All | `Cmd+A` |
| `Ctrl+F` | Find | `Cmd+F` |
| `Ctrl+T` | New Tab | `Cmd+T` |
| `Ctrl+N` | New | `Cmd+N` |
| `Ctrl+O` | Open | `Cmd+O` |
| `Ctrl+H` | History | `Cmd+Y` (Chrome) |
| `Ctrl+Space` | Spotlight | `Cmd+Space` |

### Special Shortcuts
| Shortcut | Action |
|----------|--------|
| `Alt+Shift+5` | Screenshot |
| `Forward Delete` | Delete (in Finder) |
| `Scroll Lock` | Acts as Command key |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Alt+Shift+←` | Move window to left display |
| `Alt+Shift+→` | Move window to right display |

## Application-Specific Overrides

### iTerm2
- Disables: Standard copy/paste, select all, new tab, spotlight
- Enables: `Ctrl+Shift+C/V` for copy/paste

### IntelliJ IDEA/PyCharm  
- Disables: Standard paste (preserves IDE shortcuts)

### Chrome
- Enables: `Ctrl+H` for history

### Finder
- Enables: Forward delete for permanent delete

## Middle-Click Scrolling

Windows-style middle-click drag scrolling:

1. **Hold middle mouse button** - Shows scroll indicator circle
2. **Drag in any direction** - Scrolls content smoothly
3. **Release to stop** - Click within dead zone for regular middle-click

## Customization

### Adding New Key Bindings
Edit `~/.hammerspoon/init.lua`:

```lua
local remap = require("remap_keys")
local new_binding = remap.bind("ctrl", "z", "cmd", "z")  -- Ctrl+Z → Cmd+Z
```

### App-Specific Bindings
```lua
local app = require("app")
-- Disable binding for specific app
app.disable("com.example.app", { new_binding })
-- Enable binding for specific app  
app.enable("com.example.app", { new_binding })
```

### Keyboard Remapping
Modify `foundation_remapping.lua`:
```lua
remapper:remap('ScrollLock', 'lcmd')  -- Scroll Lock → Left Command
```

## Troubleshooting

### Permissions Issues
1. System Preferences → Security & Privacy → Privacy → Accessibility
2. Add Hammerspoon and grant permissions
3. Restart Hammerspoon

### Key Bindings Not Working
1. Check Console.app for Hammerspoon errors
2. Reload config: `hs.reload()` in Hammerspoon console
3. Verify app bundle IDs: `hs.application.frontmostApplication():bundleID()`

### Finding App Bundle IDs
```lua
-- Run in Hammerspoon console
print(hs.application.frontmostApplication():bundleID())
```