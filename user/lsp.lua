-- LSP --------------------------------------------
-- Your Language server protocol stuff
---------------------------------------------------
--


-- Plugins that we will use to setup LSP
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")

-- Setup Mason
require("mason").setup()

-- Configure your servers.
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"jsonls",
		"solidity",
		"yamlls",
		"jsonls", -- Don't install solargraph with mason, it sucks.
	},
})

-- Your formatters. (Comment this to disable autoformatters)
require("formatter").setup({
	logging = false,
	filetype = {
		ruby = { require("scripts.formatter_rubocop") }, -- Format with rubocop -A instead normal.
		javascript = { require("formatter.filetypes.javascript").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
	},
})

-- when LSP os connceted, this function is called.
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	local bind = vim.keymap.set

	bind("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	bind("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	bind("n", "gI", "<cmd>Telescope lsp_implementations<cr>", opts)
	bind("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
	bind("n", "K", vim.lsp.buf.hover, opts)
end

-- Add our on_attach for mason installed LSP.
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = lsp_capabilities,
		})
	end,
})

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" } -- Dont select first item

lspconfig["solidity"].setup({ -- setup solidity (remove if you don't use)
	on_attach = on_attach,
	settings = {
		solidity = {
			includePath = "",
			remapping = { ["@OpenZeppelin/"] = "dependencies/OpenZeppelin/openzeppelin-contracts@4.6.0/" },
		},
	},
})

lspconfig["solargraph"].setup( -- setup solargraph (Don't install it with mason, it sucks)
	{
		on_attach = on_attach,
		settings = {
			solargraph = {
				formatting = false,
				useBundler = true,
				diagnostics = true, -- lsp diagnostics are slow
			},
		},
	}
)

local sources = {
	{ name = "path" }, -- cmp sources
	{ keyword_length = 2, name = "nvim_lsp" },
	{ name = "buffer", option = { get_bufnrs = require("utils.valid_listed_buffers") } },
	{ name = "luasnip", keyword_length = 2 },
	{ name = "calc" },
}

local border_opts = {
	border = { { "╭" }, { "─" }, { "╮" }, { "│" }, { "╯" }, { "─" }, { "╰" }, { "│" } },
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpSel,Search:None,NormalFloat:Normal",
	scrollbar = false,
}

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border_opts.border,
	winhighlight = border_opts.winhighlight,
	close_events = { "BufHidden", "InsertLeave" },
})

vim.diagnostic.config({
	float = border_opts,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)


-- Fix C-n and C-p for cmdline

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		if not vim.g.disable_format_on_save then
			vim.cmd("FormatWrite")
		end
	end,
})

-- Our typescript utils plugin. See the commands with SPC m on a javascript/typescript file.
-- require("typescript").setup({ server = { on_attach = on_attach } })
