local M = {}

-- In order to disable a default keymap, use
-- TODO: what about M.general
M.disabled = {
  -- i = {
    -- Disable default keymap from NVChad
  -- },

  n = {
    ["<C-s>"] = "", -- save file
    ["<C-c>"] = "", -- copy whole file
    ["<leader>n"] = "", -- toggle line number
    ["<leader>rn"] =  "", -- toggle relative number
    ["<leader>b"] =  "", -- new buffer
    ["<leader>fm"] = "", -- lsp format
    -- nvimtree
    ["<C-n>"] = "",
    -- ["<leader>e"] = "",
  },

  x = {
    ["p"] = "",
  },

}

M.trouble = {
  n = {
    ["gr"] = {
      "<cmd>Trouble lsp_references<cr>",
      "Trouble LSP References",
      opts = {
        remap = false,
      },
    },
    ["<leader>tq"] = {
      "<cmd>TroubleToggle quickfix<cr>",
      "Trouble QuickFix",
      opts = {
        remap = false,
      },
    },

    ["<leader>q"] = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Trouble Diagonostics",
      opts = {
        remap = false,
      },
    },
  }
}

-- override default lspconfig
-- M.lspconfig = {
--   n = {
--     -- ["<leader>ra"] = "",
--     ["<leader>rn"] = {
--       function()
--         require("nvchad_ui.renamer").open()
--       end,
--       "LSP rename",
--     },
--     ["gi"] = {
--       function()
--         vim.lsp.buf.implementation()
--       end,
--       "LSP implementation",
--     },
--   }
-- }

-- disable nvimtree mappings
-- M.nvimtree = {
--   n = {
--     ["<C-n>"] = "",
--     ["<leader>e"] = "",
--   },
-- }

M.telescope = {
  n = {
    -- remap file grep to <leader>fg instead of <leader>fw
    -- ["<leader>fw"] = "",
    -- ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

  }
}

-- Your custom mappings
M.forUndoWhileInsert = {
  i = {
    ["<space>"]= { "<space><c-g>u","save after space", opts = { remap = false }},
    ["("] =  { "(<c-g>u", "save after (", opts = { remap = false }},
    [")"] =  { ")<c-g>u", "save after )", opts = { remap = false }},
    ["{"] =  { "{<c-g>u", "save after {", opts = { remap = false }},
    ["}"] =  { "}<c-g>u", "save after }", opts = { remap = false }},
    ["["] =  { "[<c-g>u", "save after [", opts = { remap = false }},
    ["]"] =  { "]<c-g>u", "save after ]", opts = { remap = false }},
    ["<CR>"] = { "<CR><c-g>u", "save after Enter", opts = { remap = false }},
  }
}

M.chadTree = {
  n = {
    ["<leader>e"] = {"<cmd>CHADopen<cr>","Open CHADTree"},
  },
}

M.dial = {
  i = {
    ["<C-a>"] = {
      function ()
        require("dial.map").inc_normal()
      end,
      "inc", opts= {remap = false, expr = true}},
    ["<C-x>"] = {
      function ()
        require("dial.map").dec_normal()
      end,
      "dec", opts= {remap = false, expr = true}},
  },
  n = {
    ["<C-a>"] = {
      function ()
        require("dial.map").inc_normal()
      end,
      "inc", opts= {remap = false, expr = true}},
    ["<C-x>"] = {
      function ()
        require("dial.map").dec_normal()
      end,
      "dec", opts= {remap = false, expr = true}},
  },
  v = {
    ["<C-a>"] = {
      function ()
        require("dial.map").inc_visual()
      end,
      "inc", opts= {remap = false, expr = true}},
    ["<C-x>"] = {
      function ()
        require("dial.map").dec_visual()
      end,
      "dec", opts= {remap = false, expr = true}},
  }
  -- n = {
  -- }
-- vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
-- vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
-- vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), {noremap = true})
-- vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), {noremap = true})
  -- v = {
  -- }

}

return M

