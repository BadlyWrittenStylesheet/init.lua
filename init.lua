require 'remap'
require 'plugins'


vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd "set nowrap"

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- require("liveserver")
vim.g.netrw_banner = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


-- vim.cmd('autocmd VimEnter * lua print(require("ascii").art.animals.dogs.lucky)')


require('kanagawa').setup({
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    statementStyle = { bold = true },
    transparent = true,         -- do not set background color
    dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
})

vim.cmd "colorscheme kanagawa"

require("autoclose").setup()
require('lualine').setup()

require 'lspconfig' .pyright.	setup{}
require 'lspconfig' .gopls.	setup{}
require 'lspconfig' .lua_ls.	setup{}
require 'lspconfig' .html.	setup{}



-- future me, hi, all this is in :help nvim-tree-setup
require("nvim-tree").setup {

	view = {
		-- signcolumn = "no", -- waH?
		side = "right",
		width = 45,
	},
	renderer = {
		highlight_opened_files = "all", -- to future me: can be icon/name/all 
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "+",
					arrow_open = "-",
				}
			}
		}
	}
}


require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "An actual editor",         -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = true,                       -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = false,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = false,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text	= "Line %s of %s" -- lol ..  math.random(0, 99)-- string.char(0xE2, 0x81, 0xB0 + math.random(0, 9))
    -- line_number_text    = "Line %s of %s" .. tostring(math.random(0, 9)) .. "\xE2\x81\xB8",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})




-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 1

-- require("nvim-tree").setup()



local prettier = 	require("prettier")
prettier.setup({
	bin = 'prettierd'
})

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})



-- Set up nvim-cmp
require('cmp').setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space>'] = require('cmp').mapping.complete(),
    ['<C-e>'] = require('cmp').mapping.abort(),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }
})


-- Use buffer source for '/' and '?' in cmdline
require('cmp').setup.cmdline({ '/', '?' }, {
  mapping = require('cmp').mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' in cmdline
require('cmp').setup.cmdline(':', {
  mapping = require('cmp').mapping.preset.cmdline(),
  sources = {
    { name = 'path' },
    { name = 'cmdline' }
  },
  matching = { disallow_symbol_nonprefix_matching = false }
})

