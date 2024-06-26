require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = true,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<Tab>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled =	true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = '<Tab>',
			accept_word = false,
			accept_line = '<Tab>',
			next = "<C-k>",
			prev = "<C-j>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
	on_status_update = require("lualine").refresh,
})
