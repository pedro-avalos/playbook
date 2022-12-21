-- File: options.lua

local opt = vim.opt

opt.termguicolors = true
-- opt.clipboard = 'unnamed'
opt.wildignorecase = true
opt.history = 2000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.syntax = 'ON'
opt.mouse = 'a'

-- tab
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- wrap
opt.wrap = false
opt.linebreak = true
opt.whichwrap = 'h,l,<,>,[,],~'
opt.breakindentopt = 'shift:2,min:20'
opt.showbreak = '↳ '

-- fold
opt.foldlevelstart = 99
opt.foldmethod = 'syntax'

opt.number = true
opt.signcolumn = 'yes'

opt.textwidth = 100
opt.colorcolumn = '80'
