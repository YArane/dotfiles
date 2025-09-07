# PostgreSQL Configuration

Enhanced PostgreSQL client configuration with FZF history integration.

## Dependencies

### PostgreSQL Client
**Debian/Ubuntu:**
```bash
sudo apt install postgresql-client
```
**macOS:**
```bash
brew install postgresql
```

### FZF (for history search)
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

## Installation

```bash
stow psql -t ~
```
## Features

### History Management
- **Large history** - 100,000 commands saved
- **Duplicate removal** - No repeated commands in history
- **FZF integration** - Interactive history search via `Ctrl+R`

### Custom Shortcuts
- **Connection info** - `\conninfo` shows user connections
- **Settings viewer** - `\settings` displays configuration
- **Uptime query** - `\uptime` shows backend uptime

### Readline Integration
- **Ctrl+R binding** - Direct FZF history search in psql