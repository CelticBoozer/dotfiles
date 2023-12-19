-- Download and install lazy package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install all needed plugins
require('lazy').setup({
  { 'sainnhe/gruvbox-material' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      "3rd/image.nvim"
    }
  },
  { 'nvim-lualine/lualine.nvim' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    }
  },
  { 'numToStr/Comment.nvim' },
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter"
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  }
})
