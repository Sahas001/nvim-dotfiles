require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'ellisonleao/gruvbox.nvim'
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/',
          syntax = 'markdown',
          ext  = '.md',
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }
use {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function ()
    require'alpha'.setup(require'alpha.themes.startify'.opts)
    local startify = require("alpha.themes.startify")
    startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
    startify.section.bottom_buttons.val = {
      startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
      startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
      startify.button("q", "quit nvim", ":qa<cr>"),
    }
    vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', {noremap = true})
  end
}
 use 'nvim-treesitter/nvim-treesitter'
 use 'neovim/nvim-lspconfig'
 use 'williamboman/nvim-lsp-installer'
 use 'hrsh7th/cmp-nvim-lsp'
 use 'hrsh7th/cmp-buffer'
 use 'hrsh7th/cmp-path'
 use 'hrsh7th/cmp-cmdline'
 use 'hrsh7th/nvim-cmp'
  -- extra
 use 'voldikss/vim-floaterm'
 use 'nvim-lua/popup.nvim'
 use 'nvim-lua/plenary.nvim'
 use 'nvim-telescope/telescope.nvim'

 use { 'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function() require('plugin_configs/nvim-tree') end
 }

 use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
 }
 use 'cdelledonne/vim-cmake'
 use 'antoinemadec/FixCursorHold.nvim'
end)
