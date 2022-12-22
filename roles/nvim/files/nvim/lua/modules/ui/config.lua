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

  require('lualine').setup({
    extensions = {
      'nvim-tree',
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

  require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
  })
end

function config.startup()
  if not packer_plugins['telescope.nvim'].loaded then
    vim.cmd('packadd plenary.nvim')
    vim.cmd('packadd telescope.nvim')
  end

  require('startup').setup({
    theme='evil',
  })
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd('packadd plenary.nvim')
  end
  require('gitsigns').setup()
end

function config.nvim_notify()
  if not packer_plugins['telescope.nvim'].loaded then
    vim.cmd('packadd telescope.nvim')
  end
end

return config
