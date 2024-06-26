-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{ "kvrohit/rasmus.nvim", lazy = false, priority = 1000 },
	{ "rmehri01/onenord.nvim", lazy = false, priority = 1000 },
	{
		"themercorp/themer.lua",
		config = function()
			require("themer").setup({
				colorscheme = "rose_pine",
				transparent = true,
				dim_inactive = true,
				styles = {
					["function"] = {},
					functionbuiltin = {},
					variable = {},
					variableBuiltIn = {},
					parameter = {},
				},
			})
		end,
	},

	-- File Explorer
	{ "nvim-tree/nvim-tree.lua" },
	-- Icon for file icons
	{ "nvim-tree/nvim-web-devicons" },
	{ "xiyaowong/transparent.nvim" },

	-- Easy Motion
	{ "phaazon/hop.nvim", branch = "v2" },

	-- Surround
	{ "kylechui/nvim-surround" },
	-- Vim Move
	-- { 'matze/vim-move' },

	-- Projectionist
	{ "tpope/vim-projectionist" },

	-- Ruby break single line to multiple lines
	{ "AndrewRadev/splitjoin.vim" },

	-- Auto pairs or endwise
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
			enable_afterquote = true,
		},
	},
	{ "tpope/vim-endwise" },

	-- Highlight word at cursor
	{ "itchyny/vim-cursorword" },

	-- Github Copilot
	{ "github/copilot.vim" },

	-- Renamer
	-- { 'filipdutescu/renamer.nvim', branch = 'master', requires = { {'nvim-lua/plenary.nvim'} } },

	-- Nvim movement in one go
	{
		"booperlv/nvim-gomove",
		opts = {
			map_defaults = false,
			reindent = true,
			undojoin = true,
			move_past_end_col = false,
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
	},
	{ "stevearc/conform.nvim" },

	-- Coc nvim
	-- { 'neoclide/coc.nvim', branch = 'release' },

	-- Winshift
	-- { 'sindrets/winshift.nvim', opts = {
	--     highlight_moving_win = true,  -- Highlight the window being moved
	--   }
	-- },
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
	},
	{ "ray-x/lsp_signature.nvim" },
	"mhartington/formatter.nvim",
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
	},

	-- Vim movement + motion with brackets
	{ "echasnovski/mini.bracketed", version = "*" },
	{ "echasnovski/mini.animate", version = "*" },
	{ "echasnovski/mini.indentscope", version = "*" },

	{ "RutaTang/quicknote.nvim", opts = {
		mode = "resident",
	}, dependencies = { "nvim-lua/plenary.nvim" } },

	-- Noice for cmdline replacement with noitify
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Wilder for command line completion
	{ "gelguy/wilder.nvim" },

	-- Marks
	{ "chentoast/marks.nvim" },

	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},

	{ "pechorin/any-jump.vim" },

	-- Dashboard
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- Color display instead of codes
	{ "norcalli/nvim-colorizer.lua" },

	-- Lsp outline
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{ "Yazeed1s/oh-lucy.nvim" },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
