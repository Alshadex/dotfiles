# Neovim Configuration

Modern Neovim configuration optimized for Go, Python, Bash, and C development.

**Maintainer:** Alex Lin

## Features

- **Plugin Manager:** lazy.nvim with lazy loading for fast startup
- **LSP Support:** Full Language Server Protocol integration via lsp-zero
- **AI Completion:** GitHub Copilot integration
- **Syntax Highlighting:** Treesitter-based highlighting
- **File Explorer:** nvim-tree with git integration
- **Fuzzy Finding:** Telescope for files and live grep
- **Git Integration:** Gitsigns and blame.nvim
- **Status Line:** Lualine with icons

## Prerequisites

### System Requirements

```bash
# Arch Linux / Manjaro
sudo pacman -S neovim ripgrep fd git nodejs npm

# Ubuntu / Debian
sudo apt install neovim ripgrep fd-find git nodejs npm

# macOS
brew install neovim ripgrep fd git node
```

### GitHub Copilot

Copilot requires authentication:
1. Open Neovim
2. Run `:Copilot setup`
3. Follow the authentication flow

## Installation

1. **Clone or symlink this configuration:**
   ```bash
   # If using as part of dotfiles
   ln -s ~/git/dotfiles/nvim ~/.config/nvim

   # Or clone directly
   git clone <repo-url> ~/.config/nvim
   ```

2. **Launch Neovim:**
   ```bash
   nvim
   ```

3. **Install plugins:**
   ```
   :Lazy sync
   ```

4. **Install LSP servers:**
   ```
   :Mason
   ```
   Then install servers you need (e.g., `gopls`, `pyright`, `bashls`, `clangd`, `lua_ls`)

## Configuration Structure

```
nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua        # Vim options
│   │   └── keymaps.lua        # Global keybindings
│   ├── lazy-init.lua          # Plugin definitions
│   └── plugins/               # Plugin configurations
│       ├── telescope-config/
│       ├── lsp-zero-config/
│       ├── nvim-tree-config/
│       └── ...
└── README.md
```

## Keybindings

### Leader Key
- Leader: `;` (semicolon)

### File Explorer (nvim-tree)
- `;e` - Toggle file tree

### Window Management
- `Ctrl+h/j/k/l` - Navigate between splits
- `Ctrl+Up/Down` - Resize horizontal splits
- `Ctrl+Left/Right` - Resize vertical splits

### Fuzzy Finding (Telescope)
- `;ff` - Find files
- `;fg` - Live grep (search in files)

### LSP
- `gd` - Go to definition
- `gr` - Show references
- `K` - Hover documentation
- `gl` - Show diagnostic float
- `[d` / `]d` - Previous/next diagnostic
- `;ca` - Code actions
- `;rn` - Rename symbol

### Completion (nvim-cmp)
- `Tab` - Accept Copilot suggestion (priority) or next completion item
- `Shift+Tab` - Previous completion item
- `Enter` - Confirm completion
- `Ctrl+e` - Toggle completion menu
- `Ctrl+f` / `Ctrl+u` - Scroll documentation
- `Ctrl+d` / `Ctrl+b` - Jump forward/backward in snippets

### Copilot
- `Tab` - Accept suggestion
- `Alt+]` - Next suggestion
- `Alt+[` - Previous suggestion
- `:Copilot disable` - Disable Copilot
- `:Copilot enable` - Enable Copilot

### Commenting
- `gcc` - Toggle line comment
- `gc` - Toggle comment (visual mode)

### Git
- `:BlameToggle` - Toggle git blame

### Other
- `:Lazy` - Open plugin manager
- `:Mason` - Open LSP installer

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) | LSP configuration |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configs |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
| [blame.nvim](https://github.com/FabijanZulj/blame.nvim) | Git blame |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [go.nvim](https://github.com/ray-x/go.nvim) | Go development |
| [nvim-comment](https://github.com/terrortylor/nvim-comment) | Commenting |
| [whitespace.nvim](https://github.com/johnfrankmorgan/whitespace.nvim) | Whitespace management |

## Editor Options

- **Indentation:** 4 spaces (expandtab)
- **Line numbers:** Absolute + relative
- **Mouse:** Enabled
- **Search:** Incremental, no highlight on search
- **Scrolloff:** 8 lines
- **Update time:** 800ms (for LSP)

## Treesitter Languages

Pre-configured for:
- C, C++, Make
- Go, Go mod, Go work
- JavaScript, TypeScript
- Python
- Bash
- Dockerfile
- Solidity
- Lua, Vim
- HTML, CSS
- HCL (Terraform)

## Troubleshooting

### Copilot not showing suggestions
1. Check authentication: `:Copilot status`
2. Restart Neovim
3. Try manually triggering: `Alt+]`

### LSP not working
1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Plugins not loading
1. Sync plugins: `:Lazy sync`
2. Check for errors: `:Lazy log`
3. Clear cache and reinstall: `:Lazy clear` then `:Lazy sync`

### Tab not accepting Copilot
The Tab key prioritizes Copilot suggestions over nvim-cmp. If Tab isn't working:
1. Ensure Copilot is showing a suggestion (ghost text visible)
2. Try `Alt+]` to cycle suggestions
3. Check `:Copilot status`

## Customization

### Change leader key
Edit `lua/core/keymaps.lua`:
```lua
vim.g.mapleader = '<your-key>'
```

### Add LSP servers
Edit `lua/plugins/lsp-zero-config/init.lua`:
```lua
ensure_installed = {'gopls', 'pyright', 'your_server'}
```

### Change colorscheme
Edit `lua/plugins/tokyonight-config/init.lua` or replace with another theme plugin

### Disable Copilot for certain files
Edit `lua/plugins/copilot-config/init.lua`:
```lua
vim.g.copilot_filetypes = { xml = false, markdown = false }
```

## Migration Notes

This configuration was migrated from Packer to lazy.nvim with:
- Error handling via `pcall` for safe module loading
- Unified keymap API (`vim.keymap.set`)
- Removed duplicate Mason configuration
- Fixed Tab key conflict between Copilot and nvim-cmp

Backup of old config: `lua/packer-init.lua.backup`

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [lsp-zero Documentation](https://lsp-zero.netlify.app/)
