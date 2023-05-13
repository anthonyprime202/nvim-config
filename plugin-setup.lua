-- Ensure Packer is installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

PACKER_BOOTSTRAP = ensure_packer()

-- Run updates on saving the file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync 
    augroup end
]])

-- Requiring Packer in protected call so that nvim does not break on startup
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer didn't load!")
	return
end

-- Setting packer window to float
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Installing Plugins
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Dependecies
	use({ "onsails/lspkind.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "folke/tokyonight.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })

	-- Navigation
	use({ "nvim-tree/nvim-tree.lua" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	})

	-- Code Completion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })

	-- LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jay-babu/mason-null-ls.nvim" })
	use({ "neovim/nvim-lspconfig" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Syntax Improvements
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").pause()
		end,
	})

	-- Utilities
	use({ "akinsho/toggleterm.nvim" })

	-- Visual Improvements
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "*" })

	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
