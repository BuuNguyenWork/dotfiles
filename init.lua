--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, and understand
  what your configuration is doing.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/

  And then you can explore or search through `:help lua-guide`


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
	-- NOTE: First, some plugins that don't require any configuration

	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"ludovicchabant/vim-gutentags",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	"szw/vim-maximizer",
	"sindrets/diffview.nvim",

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"MunifTanjim/prettier.nvim",
	"folke/neodev.nvim",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	"onsails/lspkind.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },
	{ "junegunn/fzf.vim" },

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ -- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "nord",
				-- component_separators = '|',
				-- section_separators = '',
			},
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	{ "bluz71/vim-nightfly-guicolors" },
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			{ "<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "LazyGit config" },
			{
				"<leader>gf",
				"<cmd>LazyGitFilterCurrentFile<cr>",
				desc = "LazyGit filter current file",
				silent = true,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "junegunn/gv.vim" },
	{ "rebelot/kanagawa.nvim" },
	{ "arcticicestudio/nord-vim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- Plugins
	{ import = "custom.plugins" },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Some visualization configuration
vim.wo.wrap = false

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Configure autosave ]]
--require("auto-save").setup {
-- your config goes here
-- or just leave it empty :)
--}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<esc>"] = "close",
			},
			n = {
				["<esc>"] = "close",
			},
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

require("custom.nvim-treesitter")

-- Setup neovim lua configuration
require("neodev").setup()

-- [[ Configure Copilot ]]
require("custom.copilot")
-- [[ Configure cmp]]
require("custom.cmp")

-- Ensure the servers above are installed

require("custom.theme")
-- [[ Configure Keymaps]]
require("custom.keymaps")

-- [[ Configure Nvim Tree ]]
require("custom.nvim-tree")

-- [[ Configure nvim-gomove ]]
require("custom.nvim-gomove")

-- [[ Configure indent-blankline ]]
require("custom.indent-blankline")

-- [[ Configure registers ]]
require("custom.registers")

-- [[ Configure mini ]]
require("custom.mini")

-- [[ Configure noice ]]
require("custom.noice")

-- [[ Configure wilder ]]
require("custom.wilder")

-- [[ Configure marks ]]
require("custom.marks")

-- [[ Configure Miscellaneous ]]
require("custom.miscellaneous")

-- [[ Configure any-jump ]]
require("custom.any-jump")

-- [[ Configure Nvim Tree ]]
require("custom.lualine")

-- [[ Configure Dashboard ]]
require("custom.dashboard-nvim")

require("custom.search-replace")

require("custom.hlchunk")
require("custom.conform")
require("custom.symbols-outline")
require("custom.fzf")
require("custom.gitsigns")
require("custom.null-ls")
require("custom.transparent")
