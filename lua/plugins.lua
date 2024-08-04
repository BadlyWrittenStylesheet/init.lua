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


	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'

	  use({
	    'Bekaboo/dropbar.nvim', requires = {
	      'nvim-telescope/telescope-fzf-native.nvim'
	    }
	  })


	use({ "MaximilianLloyd/ascii.nvim", requires = {

		"MunifTanjim/nui.nvim"
	} })

	-- Git
	use "tpope/vim-fugitive"


	-- Looks
	use "folke/zen-mode.nvim"
	use {"folke/twilight.nvim",
		config=function()
			require("twilight").setup{
				-- context = 10
			}
		end
	}


	use "nvim-tree/nvim-tree.lua"



	use "rust-lang/rust.vim"

	-- Useful just like that
	use "tpope/vim-commentary"
	use 'm4xshen/autoclose.nvim'

	-- use "HlibShutov/Uwuifier"

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
	use "jiriks74/presence.nvim"
	-- use 'andweeb/presence.nvim'


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




	-- Themes, i suck at picking one
	use {
	    'tiagovla/tokyodark.nvim',
	    config = function()
		require('tokyodark').setup {
		    -- custom options here
		}
		-- vim.cmd('colorscheme tokyodark')
	    end
	}
	use {
		'maxmx03/fluoromachine.nvim',
		config = function()
		    local fm = require('fluoromachine')

		    fm.setup {
			glow = true,
			theme = 'fluoromachine',
			transparent = true,
		    }

		    -- vim.cmd.colorscheme 'fluoromachine'
		end
	    }
	-- use "oxfist/night-owl.nvim"
	use "rebelot/kanagawa.nvim"
	use "olimorris/onedarkpro.nvim"
	-- use "marko-cerovac/material.nvim"
	-- use "ellisonleao/gruvbox.nvim"
	use "nvim-tree/nvim-web-devicons"
	-- use { "catppuccin/nvim", as = "catppuccin" }
	-- use "folke/tokyonight.nvim"
	use({
		  'rose-pine/neovim',
		  as = 'rose-pine',
		  -- config = function()
			  -- vim.cmd('colorscheme rose-pine')
		  -- end
	})
end)
