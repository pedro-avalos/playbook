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
  -- nvim-tree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
})
