# Sakura

Sakura is an elegant, high-contrast theme for Omarchy inspired by the delicate beauty of cherry blossoms. It brings the serene atmosphere of a Japanese spring garden to your coding environment. Designed for those who appreciate refined aesthetics and exceptional readability, it creates a focused workspace as peaceful as sitting beneath blooming sakura trees.

<p align="center">
  <img src="logo.png" alt="Sakura Logo">
</p>

> Petals drift on morning breeze,  
> Code flows soft like cherry trees.  
> Pink and gold in harmony,  
> Sakura's grace sets mind at ease,  
> Beauty blooms in each key pressed.  

## Screenshot

<p align="center">
  <img src="theme.png" alt="Sakura Theme Screenshot">
</p>

## Installation

### Omarchy

To install this theme, simply use the `omarchy-theme-install` command:

```bash
omarchy-theme-install https://github.com/bjarneo/omarchy-sakura-theme
```


## How Theming Works

`colors.toml` is the single source of truth. On `omarchy theme set`, Omarchy
reads it and generates every themed config from templates — `neovim.lua`,
`btop.theme`, `foot.ini`, `kitty.conf`, `ghostty.conf`, and more.

The theme keeps two palettes in that one file:

- **`color0`–`color15`** — the terminal's ANSI palette (sharper sakura tones,
  pink *and* gold). Omarchy derives every semantic name (`red`, `muted`, …)
  from these for all generated configs — terminals, btop, obsidian, vscode.
- **`nvim_*` keys** — the editor's own softer sakura pinks, consumed only by
  `themed/neovim.lua.tpl` via `gradient_start key fallback` tokens. When a
  theme doesn't define the `nvim_*` key (i.e. any other theme), the template
  falls back to the universal name — so it renders safely everywhere.

## Neovim Theme

Neovim uses [aether.nvim](https://github.com/bjarneo/aether.nvim) fed from
`colors.toml`. There is no static `neovim.lua` — it is generated at theme-set
time from a template.

Out of the box (plain `omarchy theme install`), Omarchy's built-in template
renders the palette automatically. The owner's exact variant — aether hot
reload, pink `accent`, dark-pink selection — lives in
[`themed/neovim.lua.tpl`](themed/neovim.lua.tpl). To activate it:

```bash
ln -s ~/.config/omarchy/themes/tsunderick/themed/neovim.lua.tpl \
      ~/.config/omarchy/themed/neovim.lua.tpl
omarchy theme set tsunderick
```

### Editing Colors

Change values in `colors.toml`, commit, pull the clone, re-apply:

```bash
git commit -am "tweak palette" && git push
git -C ~/.config/omarchy/themes/tsunderick pull
omarchy theme set tsunderick
```

Neovim, btop, terminals and the rest regenerate — no hand-synced files.

## X.com
[iamdothash](https://x.com/iamdothash)
