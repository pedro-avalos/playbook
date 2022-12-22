-- File: config.lua

local config = {}

function config.oxocarbon()
  vim.opt.background = 'dark'
  vim.cmd.colorscheme('oxocarbon')
end

function config.lualine()
  if not packer_plugins['nvim-web-devicons'].loaded then
    vim.cmd('packadd nvim-web-devicons')
  end

  local ll = require('lualine')

  ll.setup({
    extensions = {
      'nvim-tree',
    },
  })
end

function config.bufferline()
  if not packer_plugins['nvim-web-devicons'].loaded then
    vim.cmd('packadd nvim-web-devicons')
  end

  vim.opt.termguicolors = true

  local bl = require('bufferline')

  bl.setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    },
  })
end

function config.nvim_tree()
  if not packer_plugins['nvim-web-devicons'].loaded then
    vim.cmd('packadd nvim-web-devicons')
  end

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.opt.termguicolors = true

  local nvim_tree = require('nvim-tree')

  nvim_tree.setup({
    open_on_setup = true, -- open tree when argument is directory
  })
end

function config.dashboard()
  if not packer_plugins['telescope.nvim'].loaded then
    vim.cmd('packadd telescope.nvim')
  end

  local cache = require('core.helper').get_cache_path()
  local db = require('dashboard')

  db.session_directory = cache .. '/session'
  db.custom_header = {
    '                                           ',
    '       ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆             ',
    '        ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦           ',
    '              ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄         ',
    '               ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄        ',
    '              ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀       ',
    '       ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄      ',
    '      ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄       ',
    '     ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄      ',
    '     ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄     ',
    '          ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆         ',
    '           ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃         ',
    '                                           ',
  }
  db.custom_center = {
    {
      icon = '  ',
      desc = 'Update Plugins                          ',
      action = 'PackerUpdate',
      shortcut = '<Leader>pu',
    },
    {
      icon = '  ',
      desc = 'Old Files                               ',
      action = 'Telescope oldfiles',
      shortcut = '<Leader>fh',
    },
    {
      icon = '  ',
      desc = 'Find File                               ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = '<Leader>ff',
    },
  }
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd('packadd plenary.nvim')
  end

  local gs = require('gitsigns')

  gs.setup()
end

function config.nvim_notify()
  if not packer_plugins['telescope.nvim'].loaded then
    vim.cmd('packadd telescope.nvim')
  end
end

return config
