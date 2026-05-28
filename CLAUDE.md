# CLAUDE.md

Guidance for Claude when working in this Neovim configuration.

## Project

Personal Neovim config. Plugin manager: **vim-plug**. Entry point: `init.vim`. Lua plugin configs live under `lua/plugins/` and are wired up through `lua/setup.lua`, which is loaded from `default_config.vim` (`lua require('setup')`).

## Working rules

- **Do not change config on your own.** Read the relevant files first, propose the change, and wait for confirmation before editing. The user has been burned by speculative edits.
- **Read before editing.** Always inspect `init.vim`, `default_config.vim`, and the relevant `lua/plugins/*.lua` before suggesting anything.
- **Match existing style.** vim-plug `Plug` lines in `init.vim`; per-plugin Lua setup in `lua/plugins/<name>.lua`; require it from `lua/setup.lua`.
- **Don't add helpers, abstractions, or "improvements"** beyond what was asked.
- **Terse output.** No trailing summaries.

## Layout

```
nvim/
├── init.vim              # vim-plug declarations + sources the .vim files
├── default_config.vim    # core settings, keymaps, ALE, theme; loads lua/setup
├── testing.vim           # test-runner keymaps
├── which-key.vim         # which-key bindings
├── lua/
│   ├── setup.lua         # requires every lua/plugins/*.lua
│   └── plugins/
│       ├── nvim-treesitter.lua
│       ├── telescope.lua
│       └── render-markdown.lua
├── scripts/
│   └── install-deps.sh   # system + per-plugin build deps (idempotent)
├── CLAUDE.md             # this file
└── agent_docs/           # deeper docs for Claude — read these on demand
```

## Adding a plugin

1. Add `Plug '...'` in `init.vim` under a relevant comment section.
2. If it needs Lua setup, create `lua/plugins/<name>.lua` with `require('<name>').setup({...})`.
3. Add `require('plugins.<name>')` to `lua/setup.lua`.
4. Tell the user to run `:PlugInstall` (and `:PlugClean` if removing).

## System dependencies

`scripts/install-deps.sh` installs system dependencies (Homebrew/macOS). Per-plugin deps are documented in `agent_docs/plugins.md`. When adding a plugin with a new system requirement, update **both** files.

## Commands the user runs

- `:PlugInstall` — install new plugins
- `:PlugClean` — remove uninstalled plugins
- `:PlugUpdate` — update plugins
- `:lua require('nvim-treesitter').install({'<lang>'})` — install/update a treesitter parser (we're on the `main` branch — `:TSUpdate` no longer exists)

## Treesitter note

`nvim-treesitter` is on the **`main`** branch (new API). The old `master` branch (with `nvim-treesitter.configs`, `ensure_installed`, `highlight.enable`) does NOT work here. Parser installs and filetype highlighting are wired up directly in `lua/plugins/nvim-treesitter.lua`. To add a parser, append to both the `install({...})` list and the `pattern = {...}` list.

## Before finalising any change

Whenever the user asks you to **finalise**, **finish**, **wrap up**, or **suggest a commit message** for changes, you MUST first audit and update the following so they don't drift from the code:

1. `CLAUDE.md` — working rules, layout, commands, conventions
2. `agent_docs/plugins.md` — added/removed plugins, system deps, gotchas
3. `agent_docs/structure.md` — file moves, load order changes
4. `agent_docs/conventions.md` — workflow changes
5. `scripts/install-deps.sh` — new system packages or per-plugin build steps

This is **not optional**. Do the audit, apply the doc updates, and only then produce the commit message. Treat doc updates as part of the change, never a follow-up. If nothing needs updating, briefly say so before giving the commit message so the user knows you checked.

## Further docs

See `agent_docs/` for deeper notes on plugin choices, conventions, and gotchas.
