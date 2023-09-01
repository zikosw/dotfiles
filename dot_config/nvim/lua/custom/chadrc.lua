---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {

  theme = "github_light",
  theme_toggle = { "tokyonight", "github_light" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  hl_override = highlights.override,
  hl_add = highlights.add,

  telescope = {
    style = "bordered",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
