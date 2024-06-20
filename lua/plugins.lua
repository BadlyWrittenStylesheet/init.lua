vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

	use "wbthomason/packer.nvim"

	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		  -- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
	      "folke/trouble.nvim",
	      config = function()
		  require("trouble").setup {
		      icons = false,
		      -- your configuration comes here
		      -- or leave it empty to use the default settings
		      -- refer to the configuration section below
		  }
	      end
	})


	use "nvim-lua/plenary.nvim"
	use "BurntSushi/ripgrep"

	-- use "nvim-tree/nvim-tree.lua"
	use({"nvim-treesitter/nvim-treesitter", ":TSUpdate"})
	use "mbbill/undotree"

	use {
		'neovim/nvim-lspconfig',
		requires = {
		    'hrsh7th/cmp-nvim-lsp',
		    'hrsh7th/cmp-buffer',
		    'hrsh7th/cmp-path',
		    'hrsh7th/cmp-cmdline',
		    'hrsh7th/nvim-cmp',
		    'hrsh7th/cmp-vsnip',
		    'hrsh7th/vim-vsnip',
		}
	}

	use "hrsh7th/nvim-cmp"

	-- Git
	use "tpope/vim-fugitive"

	-- Looks
	use "folke/zen-mode.nvim"
	use "folke/twilight.nvim"

	-- Useful just like that
	use "tpope/vim-commentary"
	use 'm4xshen/autoclose.nvim'

	-- Less go
	use "ThePrimeagen/vim-be-good"

	use {
	  "folke/which-key.nvim",
	  config = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	    require("which-key").setup {
	      -- your configuration comes here
	      -- or leave it empty to use the default settings
	      -- refer to the configuration section below
	    }
	  end
	}

	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Showoff ;)
	use 'andweeb/presence.nvim'
	use({
	    "NStefan002/screenkey.nvim",
	    config = function()
		require("screenkey").setup()
	    end,
	})
	-- use({
	--     "NStefan002/screenkey.nvim",
	--     config = function()
	-- 	require("screenkey").setup()
	--     end,
	-- })


	-- Theme
	use "olimorris/onedarkpro.nvim"
	-- use "marko-cerovac/material.nvim"
	-- use "ellisonleao/gruvbox.nvim"
	use "nvim-tree/nvim-web-devicons"
	use { "catppuccin/nvim", as = "catppuccin" }
	use "folke/tokyonight.nvim"
	use({
		  'rose-pine/neovim',
		  as = 'rose-pine',
		  config = function()
			  vim.cmd('colorscheme rose-pine')
		  end
	})
end)
