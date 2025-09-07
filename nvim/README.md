# Neovim Configuration

Neovim configuration based on [AstroNvim](https://astronvim.com/) v5 with custom plugins and mappings.

## Dependencies

### Neovim
**Debian/Ubuntu:**
```bash
sudo snap install nvim --classic
# Or latest version:
# wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
```
**macOS:**
```bash
brew install neovim
```

### Required Tools
```bash
# Debian/Ubuntu
sudo apt install unzip ripgrep

# macOS  
brew install unzip ripgrep
```

## Installation

```bash
stow nvim -t ~
```

## Configuration Details

### Base Framework
- **AstroNvim v5** - Modern Neovim configuration framework
- **Lazy.nvim** - Plugin manager with lazy loading
- **Leader key**: `,` (comma) - configured in `lazy_setup.lua`

### Community Packs
Installed via AstroCommunity:
- **Languages**: TOML, Markdown, YAML, Bash, Lua, Java
- **Tools**: Docker, Helm
- **Features**: Language servers, formatters, linters

### Custom Plugins

#### VimWiki + Calendar
Personal wiki and note-taking system:
- **VimWiki**: `~/vimwiki/` directory with `.wiki` files
- **Calendar**: Integration for diary entries

#### Dashboard Behavior
- **Disabled default dashboard** - Clean startup
- **Recent files on launch** - Shows recent files when starting with no arguments

## Key Mappings

### Leader Key
- **Leader**: `,` (comma)

### Buffer Navigation
| Shortcut | Action |
|----------|--------|
| `Shift+L` | Next buffer |
| `Shift+H` | Previous buffer |
| `Tab` | Buffer picker (if multiple buffers) |

### File Explorer (Neotree)
| Shortcut | Action |
|----------|--------|
| `Alt+1` | Toggle file explorer |
| `,e` | Focus file explorer |

### Symbols Outline (Aerial)
| Shortcut | Action |
|----------|--------|
| `,o` | Toggle symbols outline |

### VimWiki
| Shortcut | Action |
|----------|--------|
| `,ww` | Open VimWiki index |
| `,wt` | Open VimWiki in new tab |
| `,wd` | Open VimWiki diary |

### Disabled Defaults
- `Ctrl+Q` - Disabled (common terminal conflict)
- `Ctrl+S` - Disabled (terminal flow control)

### Typo Fix
| Shortcut | Action |
|----------|--------|
| `q:` | Maps to `:` (fixes common typo) |

## Plugin Organization

### Custom Plugins Directory: `plugins/`
Add new plugins or override existing ones here:

```lua
-- plugins/example.lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  },
}
```

### Community Packs: `community.lua`
Import language packs and tool integrations:
```lua
{ import = "astrocommunity.pack.python" },
{ import = "astrocommunity.colorscheme.gruvbox-nvim" },
```

### Custom Mappings: `plugins/mappings.lua`
Override or add new key mappings:
```lua
opts = {
  mappings = {
    n = {  -- Normal mode
      ["<C-n>"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    },
  },
},
```

## VimWiki Setup

### Directory Structure
```
~/vimwiki/
├── index.wiki          # Main index
├── diary/              # Daily entries
└── *.wiki              # Your wiki pages
```

### Usage Examples
```
,ww                     # Open index
[[Page Name]]           # Link to page
[[Page Name|Display]]   # Link with custom text
= Header =              # Wiki header
* List item             # Bulleted list
```

### Diary Integration
- Calendar integration for daily notes
- Automatic date-based file creation
- Quick navigation between entries


### Adding New Language Support
1. Find pack: [AstroCommunity Packs](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack)
2. Add to `community.lua`:
   ```lua
   { import = "astrocommunity.pack.python" },
   ```