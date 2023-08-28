-- local on_attach = require("plugins.configs.lspconfig").on_attach

local utils = require "core.utils"

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  -- TODO: temporary disable because https://github.com/neovim/nvim-lspconfig/issues/2542
  -- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
end

local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local mason_lspconfig = require "mason-lspconfig"


local servers = {
  -- clangd = {},
  gopls = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        unusedwrite = true,
        staticcheck = true,
      },
      hints = {
        functionTypeParameters = true,
        parameterNames = true,
      }
    }
  },
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
