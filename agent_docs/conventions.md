# Conventions

## Adding a plugin

1. Add a `Plug '...'` line in `init.vim` under the most relevant comment section. Keep the existing grouping.
2. If the plugin needs Lua setup:
   - Create `lua/plugins/<name>.lua` with a single `require('<name>').setup({...})` call.
   - Add `require('plugins.<name>')` to `lua/setup.lua`.
3. If it needs Vimscript-only config (`let g:foo = ...`), add it to `default_config.vim`.
4. Tell the user to run `:PlugInstall`.

## Removing a plugin

1. Delete its `Plug` line from `init.vim`.
2. Delete `lua/plugins/<name>.lua` if it exists.
3. Remove its `require` line from `lua/setup.lua`.
4. Remove related config blocks from `default_config.vim`.
5. Tell the user to run `:PlugClean`.

## Editing rules for Claude

- **Read first, edit second.** Never propose changes to a file you haven't read in the current session.
- **Don't speculatively change `init.vim` flags** (e.g. swapping `'do'` hooks, adding `'for'` lazy-loading) without being asked. These break installs.
- **Don't refactor unrelated code** while doing a task.
- **Ask before destructive actions** (deleting plugins, files, config blocks).
- **Confirm install steps** with the user instead of running them yourself — the user runs `:PlugInstall` etc.

## Style

- vim-plug lines: single quotes, optional `{ ... }` options on the same line.
- Lua plugin files: one `require('x').setup({ ... })` call, no extra wrapping.
- Comments in `init.vim` group plugins by purpose — keep new plugins under the right group, or add a new comment.
