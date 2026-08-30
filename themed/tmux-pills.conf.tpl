# tmux theme pills — rendered by `omarchy theme set` from the tsunderick
# theme's colors.toml (source: themed/tmux-pills.conf.tpl, symlinked into
# ~/.config/omarchy/themed/). Do not edit the rendered file at
# ~/.local/state/omarchy/current/theme/tmux-pills.conf — change this template
# (or colors.toml) and re-run `omarchy theme set tsunderick`.
#
# Palette roles:
#   * session pill  = color5 (magenta slot, sakura) — twin of the nvim
#     lualine session pill, which reads the same tokens via
#     vim.g.tsunderick_pills (see themed/neovim.lua.tpl)
#   * window pills / ZOOM badge / active pane border = color4 (blue slot, lilac)
#   * pill text     = color0 (near-black, readable on the pastel backgrounds)
# Everything else in tmux.conf already uses tmux named colors, so it follows
# the terminal's ANSI palette on its own.

set -g status-left "#[fg={{ color0 }},bg={{ color5 }},bold] #S #[bg=default] "
set -g status-right "#{?pane_in_mode,#[fg=black]#[bg=yellow] COPY ,}#{?client_prefix,#[fg=black]#[bg=cyan] PREFIX ,}#{?window_zoomed_flag,#[fg={{ color0 }}]#[bg={{ color4 }}]#[bold] ZOOM ,}#[fg=brightblack]#h "
set -g window-status-current-format "#[fg={{ color0 }},bg={{ color4 }},bold] #I:#W "
set -g pane-active-border-style "fg={{ color4 }}"
