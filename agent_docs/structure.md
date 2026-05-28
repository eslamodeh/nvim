# Structure

## Load order

1. `init.vim` runs first (Neovim picks it up from `~/.config/nvim/init.vim`).
2. It declares plugins via `vim-plug` between `plug#begin` / `plug#end`.
3. After `plug#end`, it sources:
   - `default_config.vim` — core options + keymaps + theme + ALE + `lua require('setup')`
   - `testing.vim` — test runner mappings
   - `which-key.vim` — leader-key menus
4. `lua/setup.lua` is the single entry point for Lua plugin setup. It `require`s each file in `lua/plugins/`.

## Files

| File | Purpose |
|------|---------|
| `init.vim` | vim-plug plugin list, sources the rest |
| `default_config.vim` | Options, keymaps, theme, ALE config, foldings, clipboard, loads `setup.lua` |
| `testing.vim` | Test runner bindings |
| `which-key.vim` | which-key leader bindings |
| `lua/setup.lua` | Requires every `lua/plugins/*.lua` |
| `lua/plugins/nvim-treesitter.lua` | Treesitter parser installs + filetype highlight autocmd |
| `lua/plugins/telescope.lua` | Telescope setup |
| `lua/plugins/render-markdown.lua` | render-markdown.nvim setup (in-editor markdown rendering) |
| `scripts/install-deps.sh` | Idempotent system + per-plugin build dep installer (macOS/brew) |

## Where things live

- **Plugin declaration** → `init.vim`
- **Plugin Lua config** → `lua/plugins/<name>.lua`
- **Wiring** → `lua/setup.lua` (must `require` the new file)
- **Vimscript options/keymaps** → `default_config.vim`
- **Leader keymaps** → `which-key.vim`
