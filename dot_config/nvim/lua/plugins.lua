-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- auto create dir on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(ctx)
    local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
    vim.fn.mkdir(dir, "p")
  end
})

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'go'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }


  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  use { 'kyazdani42/nvim-web-devicons' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup() end,
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use {'fatih/vim-go'}

  use {'ms-jpq/coq_nvim', branch = 'coq'}

  use { 'ms-jpq/chadtree', branch= 'chad', run= 'python3 -m chadtree deps'}

  use {
    { "williamboman/mason.nvim",
    config = function() require('mason').setup() end
  },
  { "williamboman/mason-lspconfig.nvim",
  after = "mason.nvim",
  config = function() require('mason-lspconfig').setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
  }) end
}
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'  },
    {'hrsh7th/cmp-path'    },
    {'hrsh7th/cmp-cmdline' },
    {'hrsh7th/nvim-cmp'    },
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'},
    {'onsails/lspkind.nvim'},
  }       

  use "rafamadriz/friendly-snippets"

  use 'folke/tokyonight.nvim'

  use 'nvim-treesitter/playground'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use { 'rcarriga/nvim-notify' }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {'akinsho/toggleterm.nvim', tag = '*',
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end
  }

use { 'lukas-reineke/indent-blankline.nvim' }

end)

