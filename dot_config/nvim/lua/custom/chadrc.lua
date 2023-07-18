local M = {}

M.mappings = require "custom.mappings"

M.ui = {
  theme = "github_light",
  theme_toggle = { "tokyonight", "github_light" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  telescope = {
    style = "bordered",
  },
}

M.plugins = "custom.plugins"

return M
