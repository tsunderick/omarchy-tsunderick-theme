# AGENTS.md

This document provides guidelines for AI coding agents working on the
tsunderick Omarchy theme.

## Project Overview

This is a personal [Omarchy](https://omarchy.org/) theme derived from
bjarneo's Sakura theme, driven toward pastel pink hues. `colors.toml` is the
single source of truth for *both* palettes:

- **`color0`–`color15`** — the terminal ANSI palette (blush, sakura,
  orchid, lilac). Omarchy derives every semantic name (`red`, `muted`, …)
  from these at `omarchy theme set` time for all generated configs:
  terminals, btop, obsidian, vscode, …
- **`nvim_*` keys** — the editor's softer palette, consumed only by
  `themed/neovim.lua.tpl` via `gradient_start key fallback` tokens. When a
  key is absent (i.e. any other theme), the template falls back to the
  derived universal name — it must render safely for every theme.

## Repo Structure

```
├── colors.toml               # Single source of truth — edit colors HERE
├── themed/
│   └── neovim.lua.tpl        # aether.nvim template (opt-in, see README)
├── backgrounds/              # Background rotation
├── deploy-local-changes.sh   # One-command local deploy while iterating
└── icons.theme
```

## Iteration Workflow

1. Edit `colors.toml` (or a template).
2. Deploy: `./deploy-local-changes.sh` — this resets the deployed clone
   with `git reset --hard`, re-copies everything except `.git`, then runs
   `omarchy theme set tsunderick` and restarts the terminal.
3. Verify: `omarchy theme current` and visually check foot/nvim/btop.

The push/pull alternative (commit → push → `git -C
~/.config/omarchy/themes/tsunderick pull` → `omarchy theme set tsunderick`)
is documented in the README; the deploy script is the fast path.

## Gotchas

### Semantic hue keys ARE the terminal palette (omarchy 4.5)

Omarchy 4.5's built-in terminal templates render the ANSI slots from the
semantic names (`foot.tpl`: `regular2={{ green_strip }}`, `bright2={{
bright_green_strip }}`, …), and an explicit key beats the derived one.
So `red/green/yellow/blue/magenta/cyan/bright_*` in `colors.toml` MUST
mirror `color1-15` — they are not a free secondary palette. Incident
2026-11-19: the semantic layer was authored from the `nvim_*` editor
palette (`green=#a7abde`, `bright_green=#80EF80`), and the next
`omarchy theme set` swapped the curated pink ANSI palette for the editor's
— a literal vivid green landing in an all-pink terminal. `nvim_*` stays
editor-only (only `themed/neovim.lua.tpl` reads it). `orange`/`brown`
have no ANSI slot and may keep soft shell-only values. Machines that
rendered before the fix serve a stale-but-correct state until their next
`omarchy theme set` — pull + re-set once, and it stays fixed.

### Never hand-edit the deployed copy

`~/.config/omarchy/themes/tsunderick` is a disposable deploy target. The
deploy script hard-resets it (`git reset --hard`) and would destroy manual
changes. Edit this repo, then deploy.

### OpenCode needs zero integration — but is fragile about dead links

opencode follows the theme automatically via `"theme": "system"` in
`~/.config/opencode/tui.json` (it generates its theme from the terminal's
detected palette at runtime). **Do not add an opencode theme or template to
this repo.**

However (incident 2026-08-30): opencode rescans
`~/.config/opencode/themes/*.json` and `.opencode/themes/` up the cwd tree
at every launch and config reload. Any scan error — a dangling symlink, an
unreadable file, invalid JSON — makes it silently force the stock
`opencode` theme, overriding `"system"` in every terminal, even fresh
instances. A dotfiles cleanup left a dead `~/.config/opencode/themes`
symlink and opencode appeared to "ignore the theme" for hours.

Diagnostic signature: theme ignored in *all* terminals with fresh restarts
→ suspect opencode's config dir (check `ls ~/.config/opencode/themes`),
not this theme.

### Neovim template is opt-in

`themed/neovim.lua.tpl` only takes effect when symlinked into
`~/.config/omarchy/themed/` (see README). Omarchy's built-in template is
used otherwise.
