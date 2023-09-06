local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- popup packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim") -- need this for literaly everything

	-- colorschemes
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("L3MON4D3/LuaSnip")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- telescope
	use("nvim-telescope/telescope.nvim")

	-- Treeshitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
  use("nvim-treesitter/nvim-treesitter-context") -- context

	-- autopairs
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")

	-- comment stuff
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- comment string using treesitter

	-- bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- treeeeeeeeeee
	use("nvim-tree/nvim-tree.lua")

  -- file icons
	use("nvim-tree/nvim-web-devicons")

	-- toggle term
	use("akinsho/toggleterm.nvim")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- git
  use("lewis6991/gitsigns.nvim")

  -- status
  use({
    'j-hui/fidget.nvim',
    tag = 'legacy'
  })

  -- copilot
  use('github/copilot.vim')

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
