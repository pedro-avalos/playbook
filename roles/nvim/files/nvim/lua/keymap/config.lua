-- File: config.lua
-- Author: glepnr https://github.com/glepnir
-- Date: 2022-07-02
-- License: MIT

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- leader key
vim.g.mapleader = '\\'
nmap({ '\\', '', opts(noremap) })
xmap({ '\\', '', opts(noremap) })

-- normal mode remapping
nmap({
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- force quit all
  { '<C-q>', cmd('qa!'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h' },
  { '<C-j>', '<C-w>j' },
  { '<C-k>', '<C-w>k' },
  { '<C-l>', '<C-w>l' },
  -- resize window
  { '<A-[>', cmd('vertical resize -5') },
  { '<A-]>', cmd('vertical resize +5') },
})

-- insert mode remapping
imap({
  -- save
  { '<C-s>', '<ESC>:w<CR>', opts(noremap) },
  -- movement
  { '<C-b>', '<Left>', opts(noremap) },
  { '<C-f>', '<Right>', opts(noremap) },
  -- append
  { '<C-a>', '<ESC>^i', opts(noremap) },
  -- new next line
  { '<C-j>', '<ESC>o', opts(noremap) },
  -- new prev line
  { '<C-k>', '<ESC>O', opts(noremap) },
})

-- commandline remap
cmap({
  {'<C-b>', '<Left>', opts(noremap)},
  {'<C-f>', '<Right>', opts(noremap)},
  {'<C-a>', '<Home>', opts(noremap)},
  {'<C-e>', '<End>', opts(noremap)},
  {'<C-d>', '<Del>', opts(noremap)},
  {'<C-h>', '<BS>', opts(noremap)},
})
