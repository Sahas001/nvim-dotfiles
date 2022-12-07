local function treesitter_setup()
  local configs = require'nvim-treesitter.configs'
  configs.setup {
    ensure_installed = "all", -- Only use parsers that are maintained
    ignore_install = { "phpdoc" }, -- https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15
    highlight = { -- enable highlighting
      enable = true,
    },
    indent = {
      enable = false,
    }
  }
  end

local function lsp_setup()
  local lsp_installer = require("nvim-lsp-installer")
  local coq = require "coq"
  -- tell the server the capability of foldingRange
  -- nvim hasn't added foldingRange to default capabilities, users must add it manually
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities
    }
    if server.name == "sumneko_lua" then
      opts = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'use' }
            },
            }
          }
        }
      end
    server:setup(coq.lsp_ensure_capabilities(opts))
  end)

  vim.cmd[[let g:cmake_link_compile_commands = 1]]
end

treesitter_setup()
lsp_setup()
