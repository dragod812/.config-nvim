# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal Neovim configuration. There is no build, test, or lint step — changes are validated by restarting Neovim (or `:source %` / `:Lazy sync`).

## Entry point and load order

`init.lua` → `lua/paddy/init.lua` requires three modules in this order:

1. `paddy.set` — vim options (`<leader>` = space, tabs=4/expandtab, undofile under `~/.vim/undodir`, colorcolumn 80). Also rewrites `$PATH` from `$VIM_PATH` if set (office-env workaround).
2. `paddy.remap` — non-plugin keymaps (window/tab/split motion, quickfix/loclist nav `<leader>j/k/J/K`, JSON/SQL text munging under `<leader>vj*` / `<leader>vsc`, OSC yank for SSH clipboard).
3. `paddy.lazy` — bootstraps `lazy.nvim` and declares every plugin inline in a single `require("lazy").setup({...})` call.

All plugin specs, their `config` functions, and their keymaps live in one file: `lua/paddy/lazy.lua`. When adding or modifying a plugin, edit that file — there is no per-plugin split.

## Architectural notes that aren't obvious from the code

- **LSP uses the Neovim 0.11 API** (`vim.lsp.config(...)` / `vim.lsp.enable(...)`), not the older `lspconfig[server].setup{}`. Built-in 0.11 defaults (`gd`, `K`, `grr`, `gra`, `grn`, `]d`, `[d`) are intentionally not re-mapped; only the extras are set inside the `LspAttach` autocmd. Servers are installed via `mason-lspconfig` `ensure_installed`, and `cmp_nvim_lsp` capabilities are broadcast to all servers via `vim.lsp.config("*", ...)`.
- **Formatting is `formatter.nvim`, not LSP `format-on-save`.** A `FormatAutogroup` autocmd runs `FormatWrite` on `BufWritePost` for `py/js/ts/html/css/go/lua/dart`. Go files additionally kick off a non-blocking `staticcheck` job whose output is `print()`ed. `<leader>f` is a manual LSP format fallback.
- **Treesitter is pinned to `branch = "main"`** (same for `nvim-treesitter-context`) for Nvim 0.11 compatibility — do not remove those `branch` pins.
- **Testing stack is doubled:** `neotest` (with `neotest-go`, `neotest-python` pointing at `.venv/bin/python`, `neotest-dart`) provides `<leader>tr/tf/to/tO`, and `nvim-dap` + `nvim-dap-ui` + language adapters (`nvim-dap-go`, `nvim-dap-python` pointing at the Mason debugpy venv) provide `<leader>tb/tc/ts*/tx/tdg/tdp/tdl`.
- **`which-key` uses a description filter** (`mapping.desc and mapping.desc ~= ""`) — keymaps without a `desc` are hidden from the popup. The big `wk.add({...})` block in `lazy.lua` is the source of truth for leader-key groupings; keep it in sync when adding new bindings.
- **`lazy-lock.json` is committed.** Treat it like a lockfile: let `:Lazy sync` / `:Lazy update` rewrite it, don't hand-edit.

## Office-environment escape hatches

- `vim.env.PATH = vim.env.VIM_PATH or vim.env.PATH` in `set.lua` exists so a wrapping shell can inject a custom PATH for tools/LSPs.
- `gopls` is launched with `-remote=auto` and Bazel output dirs are excluded via `directoryFilters` — this config assumes a Bazel-based Go monorepo may be in use.
- `<leader>vsc` in `remap.lua` is a chained `:%s` that expands a specific set of `{{template}}` tokens (michelangelo MES tables) — it is project-specific, leave it alone unless the user asks.

## When editing this repo

- Prefer editing `lua/paddy/lazy.lua` in place over creating new plugin files; the config is intentionally single-file.
- After changes, the user reloads by restarting Neovim or running `:Lazy sync` / `:Lazy reload <plugin>`. There is nothing to run from the shell.
