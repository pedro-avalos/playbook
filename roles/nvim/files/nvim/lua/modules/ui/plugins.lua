-- File: plugins.lua

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({
  'nyoom-engineering/oxocarbon.nvim',
  config = conf.oxocarbon,
})

plugin({
  'nvim-lualine/lualine.nvim',
  config = conf.lualine,
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
})

plugin({
  'akinsho/bufferline.nvim',
  tag = 'v3.*',
  config = conf.bufferline,
  requires = 'nvim-tree/nvim-web-devicons',
})

plugin({
  'nvim-tree/nvim-tree.lua',
  config = conf.nvim_tree,
  requires = { 'nvim-tree/nvim-web-devicons' },
})

plugin({
  'glepnir/dashboard-nvim',
  config = conf.dashboard,
  requires = { 'nvim-telescope/telescope.nvim' },
})

plugin({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
  requires = { 'nvim-lua/plenary.nvim' },
})

plugin({
  'rcarriga/nvim-notify',
  config = conf.nvim_notify,
  requires = { 'nvim-telescope/telescope.nvim' },
})
