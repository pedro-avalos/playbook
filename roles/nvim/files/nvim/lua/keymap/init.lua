-- File: init.lua
-- Author: glepnr https://github.com/glepnir
-- Date: 2022-07-02
-- License: MIT

require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- telescope
  { '<Leader>j', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>fs', cmd('Telescope grep_string'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fh', cmd('Telescope oldfiles'), opts(noremap, silent) },
  -- nvim-tree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- lsp
  { '<Leader>li', cmd('LspInfo'), opts(noremap, silent) },
  { '<Leader>ll', cmd('LspLog'), opts(noremap, silent) },
  { '<Leader>lr', cmd('LspRestart'), opts(noremap, silent) },
  -- Comment.nvim (set by default by Comment.nvim)
  -- gcc: line-comment toggle
  -- gbc: block-comment toggle
  -- gc: line-comment
  -- gb: block-comment
  -- gcO: add comment on line above
  -- gco: add comment on line below
  -- gcA: add comment at the end of line
})
