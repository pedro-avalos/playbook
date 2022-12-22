-- File: plugins.lua

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  -- use command to lazyload telescope
  config = conf.telescope,
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', opt = true, run = 'make' },
    { 'nvim-treesitter/nvim-treesitter', opt = true },
    { 'nvim-tree/nvim-web-devicons', opt = true },
  },
})

