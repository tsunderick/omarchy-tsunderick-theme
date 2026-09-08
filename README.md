# tsunderick theme

A personal Omarchy theme derived from
[bjarneo's Sakura](https://github.com/bjarneo/omarchy-sakura-theme) — same
cherry-blossom spirit, but with infrastructure enhancements and a palette
driven toward pastel pink hues.

> Petals drift on morning breeze,
> Code flows soft like cherry trees.
> Pastel pinks in harmony,
> Sakura's grace sets mind at ease,
> Beauty blooms in each key pressed.

## What's different from upstream

- **Pastel pink palette.** The gold and peach tones are gone. Every accent is
  now part of a pastel pink family — blush (~345°), sakura (~333°),
  orchid (~313°) and lilac (~283°) — with deliberate hue spread so `ls`
  colors, btop graphs, and syntax groups stay easy to tell apart.
- **Infrastructure enhancements.**
  - `colors.toml` as a single source of truth for *both* palettes (terminal
    ANSI and editor), consumed via tokens.
  - `themed/neovim.lua.tpl` — a template with fallback tokens, so it renders
    safely for any theme, never leaving raw tokens behind.
  - [aether.nvim](https://github.com/bjarneo/aether.nvim) hot reload for
    near-instant editor color iteration.
  - `deploy-local-changes.sh` — one-command local deploys, no GitHub
    push/pull roundtrip while iterating.
  - A personal background rotation.

## Screenshot

<p align="center">
  <img src="preview.png" alt="tsunderick theme preview">
</p>

(The preview may lag the current palette — it is regenerated whenever
convenient.)

## Installation

```bash
omarchy-theme-install https://github.com/tsunderick/omarchy-tsunderick-theme
```

Then select it:

```bash
omarchy theme set tsunderick
```

## How Theming Works

`colors.toml` is the single source of truth. On `omarchy theme set`, Omarchy
reads it and generates every themed config from templates — `neovim.lua`,
`btop.theme`, `foot.ini`, `kitty.conf`, `ghostty.conf`, and more.

The theme keeps two palettes in that one file:

- **`color0`–`color15`** — the terminal's ANSI palette (the pastel pink
  family: blush, sakura, orchid, lilac, plus the rose/salmon reds). Omarchy
  derives every semantic name (`red`, `muted`, …) from these for all
  generated configs — terminals, btop, obsidian, vscode.
- **`nvim_*` keys** — the editor's own softer pinks, consumed only by
  `themed/neovim.lua.tpl` via `gradient_start key fallback` tokens. When a
  theme doesn't define the `nvim_*` key (i.e. any other theme), the template
  falls back to the universal name — so it renders safely everywhere.

## Neovim Theme

Neovim uses [aether.nvim](https://github.com/bjarneo/aether.nvim) fed from
`colors.toml`. There is no static `neovim.lua` — it is generated at theme-set
time from a template.

Out of the box (plain `omarchy theme install`), Omarchy's built-in template
renders the palette automatically. This theme's exact variant — aether hot
reload, pink `accent`, dark-pink selection — lives in
[`themed/neovim.lua.tpl`](themed/neovim.lua.tpl). To activate it:

```bash
ln -s ~/.config/omarchy/themes/tsunderick/themed/neovim.lua.tpl \
      ~/.config/omarchy/themed/neovim.lua.tpl
omarchy theme set tsunderick
```

### Editing Colors

Change values in `colors.toml`, then either deploy locally:

```bash
./deploy-local-changes.sh
```

or commit and pull the clone:

```bash
git commit -am "tweak palette" && git push
git -C ~/.config/omarchy/themes/tsunderick pull
omarchy theme set tsunderick
```

Neovim, btop, terminals and the rest regenerate — no hand-synced files.

## OpenCode

**Zero integration needed.** opencode follows the theme through its built-in
`system` theme, which it generates at runtime from the terminal's detected
palette (foot/tmux carry the ANSI colors above). Keep `tui.json` as:

```json
{ "$schema": "https://opencode.ai/tui.json", "theme": "system" }
```

**Pitfall — dead symlinks under `~/.config/opencode/` (bit us
2026-08-30).** At every launch and every config reload, opencode rescans
`~/.config/opencode/themes/*.json` (plus `.opencode/themes/` up the cwd
tree). If that scan *errors* — a dangling symlink, an unreadable file,
invalid JSON — opencode silently forces the stock `opencode` theme,
overriding `"system"`: every terminal, every fresh instance, SIGUSR2
reloads included.

The incident: a dotfiles cleanup deleted the target of
`~/.config/opencode/themes` (an old custom theme), leaving a dead symlink.
Symptom — opencode in its default look while the rest of the desktop was
pink. Fix:

```bash
rm ~/.config/opencode/themes
```

Diagnosis shortcut: if opencode ignores the theme in *every* terminal even
after fresh restarts, suspect its config dir first — the theme pipeline
itself is fine and needs nothing from this repo.

## Attribution

Derived from [omarchy-sakura-theme](https://github.com/bjarneo/omarchy-sakura-theme)
by [iamdothash](https://x.com/iamdothash). Go enjoy the original if you want
the pink-and-gold look.
