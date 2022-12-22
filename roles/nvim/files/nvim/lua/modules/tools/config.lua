-- File: config.lua

local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd('packadd plenary.nvim')
    vim.cmd('packadd telescope-fzf-native.nvim')
    vim.cmd('packadd nvim-treesitter')
    vim.cmd('packadd nvim-web-devicons')
  end

  local telescope = require('telescope')
  local previewers = require('telescope.previewers')

  telescope.setup({
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  })

  telescope.load_extension('fzf')
end


return config
