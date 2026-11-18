-- neovim theme template (rendered by omarchy-theme-set from colors.toml).
-- Editing notes: colors live in the theme's colors.toml (single source of
-- truth); this file only maps them onto aether.nvim. The padding below is
-- aligned for the RENDERED 7-char hex values, not the tokens.
--
-- Token style: "gradient_start" tokens carry (key, fallback) — the key wins
-- when the theme defines it (tsunderick's nvim_* soft-sakura palette in
-- colors.toml), otherwise the universal derived name is used. That way this
-- template renders safely for ANY theme and never leaves raw tokens behind.
-- Deliberate mappings that differ from omarchy's built-in neovim template:
-- pink accent (not gold), cursor/selection_foreground = foreground,
-- dark-pink selection, plus the aether hotreload setup below.
return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "{{ background }}",
        dark_bg    = "{{ gradient_start nvim_dark_bg dark_background }}",
        darker_bg  = "{{ gradient_start nvim_darker_bg darker_background }}",
        lighter_bg = "{{ gradient_start nvim_lighter_bg lighter_background }}",

        fg         = "{{ foreground }}",
        dark_fg    = "{{ gradient_start nvim_dark_fg dark_foreground }}",
        light_fg   = "{{ gradient_start nvim_light_fg light_foreground }}",
        bright_fg  = "{{ bright_foreground }}",
        muted      = "{{ gradient_start nvim_muted muted }}",

        red        = "{{ gradient_start nvim_red red }}",
        yellow     = "{{ gradient_start nvim_yellow yellow }}",
        orange     = "{{ gradient_start nvim_orange orange }}",
        green      = "{{ gradient_start nvim_green green }}",
        cyan       = "{{ gradient_start nvim_cyan cyan }}",
        blue       = "{{ gradient_start nvim_blue blue }}",
        purple     = "{{ gradient_start nvim_purple magenta }}",
        brown      = "{{ gradient_start nvim_brown brown }}",

        bright_red    = "{{ gradient_start nvim_bright_red bright_red }}",
        bright_yellow = "{{ gradient_start nvim_bright_yellow bright_yellow }}",
        bright_green  = "{{ gradient_start nvim_bright_green bright_green }}",
        bright_cyan   = "{{ gradient_start nvim_bright_cyan bright_cyan }}",
        bright_blue   = "{{ gradient_start nvim_bright_blue bright_blue }}",
        bright_purple = "{{ gradient_start nvim_bright_purple bright_magenta }}",

        accent               = "{{ gradient_start nvim_accent accent }}",
        cursor               = "{{ foreground }}",
        foreground           = "{{ foreground }}",
        background           = "{{ background }}",
        selection            = "{{ gradient_start nvim_lighter_bg lighter_background }}",
        selection_foreground = "{{ foreground }}",
        selection_background = "{{ gradient_start nvim_lighter_bg lighter_background }}",
      },
    },
    -- set up hot reload
    config = function(_, opts)
      require("aether").setup(opts)
      -- Pill palette for the lualine session pill — rendered from
      -- colors.toml tokens at theme-set time.
      -- Consumed by dotfiles: nvim/lua/plugins/lualine-session.lua
      vim.g.tsunderick_pills = {
        session_bg = "{{ color5 }}",
        session_fg = "{{ color0 }}",
      }
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
