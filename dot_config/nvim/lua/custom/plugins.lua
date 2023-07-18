return {
  { 'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
    cmd = "CHADopen",
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark",   -- style for floating windows
        },
        -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.1,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,             -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        -- on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        -- on_highlights = function(highlights, colors) end,
      }

      vim.cmd.colorscheme 'tokyonight'
    end
  },

  -- {'f-person/git-blame.nvim'},
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = "VeryLazy",
    config = function()
      local hop = require('hop')
      hop.setup()
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, {remap=true})
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, {remap=true})
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, {remap=true})
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, {remap=true})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require'treesitter-context'.setup{
        enable = true,
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.mason-lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      dofile(vim.g.base46_cache .. "syntax")
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = {
          enable = true,
          use_languagetree = true,
        },

        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
      }
    end
  },
  {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
    config = function ()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
        },
      }
    end
  },
  {
    'f-person/git-blame.nvim',
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },
  {
    'fatih/vim-go',
    ft = "go",
  },
  {
    'gelguy/wilder.nvim',
    event = "VeryLazy",
    config = function()
      require('wilder').setup {
        modes = {':', '/', '?'}
      }
    end,
  },
  {
    'tpope/vim-fugitive',
    event = "VeryLazy"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      auto_fold = true,
      auto_close = true,
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   cmd = "Telescope",
  --   init = function()
  --     require("core.utils").load_mappings "telescope"
  --   end,
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. "telescope")
  --     local telescope = require "telescope"
  --     telescope.setup(opts)
  --
  --     -- load extensions
  --     for _, ext in ipairs(opts.extensions_list) do
  --       telescope.load_extension(ext)
  --     end
  --   end,
  --   opts = function()
  --     local trouble = require('trouble')
  --     return {
  --       defaults = {
  --         mappings = {
  --           i = { ["<c-t>"] = trouble.open_with_trouble },
  --           n = { ["<c-t>"] = trouble.open_with_trouble },
  --         }
  --       },
  --     }
  --   end,
  -- },
}
