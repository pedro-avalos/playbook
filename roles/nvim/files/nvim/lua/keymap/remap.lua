local keymap = require('core.keymap')
local nmap, imap, xmap, tmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.tmap
local expr = keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd

nmap({
	-- close buffer
	{ '<C-x>k', cmd('bdelete') },
	-- save
	{ '<C-s>', cmd('write') },
	-- buffer jump
	{ ']b', cmd('bn') },
	{ '[b', cmd('bp') },
	-- force quit all
	{ '<C-q>', cmd('qa!') },
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
	{ '<C-s>', '<ESC>:w<CR>' },
	-- movement
	{ '<C-b>', '<Left>' },
	{ '<C-f>', '<Right>' },
	-- append
	{ '<C-a>', '<ESC>^i' },
	-- new next line
	{ '<C-j>', '<ESC>o' },
	-- new prev line
	{ '<C-k>', '<ESC>O' },
})
