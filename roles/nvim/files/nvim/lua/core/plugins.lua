-- File: plugins.lua

-- automatically install and set up packer.nvim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- automatically compile when plugins.lua is updated
vim.cmd([[
augroup packer_use_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- package manager
	use 'nyoom-engineering/oxocarbon.nvim' -- color scheme

	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup()
		end,
	}

	-- syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('core.plugins.telescope')
		end,
	}

	-- git integrations
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup()
		end,
	}
	use {
		'TimUntersBerger/neogit',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('neogit').setup()
		end,
	}

	-- file explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons', },
		config = function()
			require('core.plugins.nvim-tree')
		end,
	}

	-- notification manager
	use {
		'rcarriga/nvim-notify',
		requires = { 'nvim-telescope/telescope.nvim' },
	}

	-- automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end

end)
