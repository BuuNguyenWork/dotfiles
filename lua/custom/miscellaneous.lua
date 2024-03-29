local autocmd = vim.api.nvim_create_autocmd   -- Create autocommands

-- [[ Configure Hop ]]
-- Doc :help hop
local hop = require('hop')
hop.setup()
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
-- Keymap for HOP
vim.keymap.set('n', '<c-h>p', ':HopPattern<CR>', { desc = '' })

-- [[ Configure Surround ]]
-- Doc :help nvim-surround
require("nvim-surround").setup()

-- [[ Configure vim-move ]]
vim.g.move_key_modifier = 'C'

--
vim.opt.relativenumber = true
vim.opt.colorcolumn = '120'
vim.opt.encoding = 'utf8'
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 20
vim.opt.fillchars = { eob = ' ' ,fold = ' ' ,vert = '⏽' }
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.nopaste = true
vim.g.linespace = 1
vim.g.nopaste = true
vim.g.ruler = true

-- [[ Configure space stop by language ]]

autocmd('Filetype', { pattern = 'python', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('Filetype', { pattern = 'sql', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('Filetype', { pattern = 'lua', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2' })
autocmd('Filetype', { pattern = 'ruby', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2' })
autocmd('Filetype', { pattern = 'typescript', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatprg=prettier\\ --parser\\ typescript' })
autocmd('Filetype', { pattern = 'typescript.tsx', command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatprg=prettier\\ --parser\\ typescript' })
autocmd('Filetype', { pattern = 'javascript', command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 formatprg=prettier\\ --parser\\ javascript' })
-- [[ Configure lazygit ]]
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
-- vim.g.lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 0 -- fallback to 0 if neovim-remote is not installed

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open [L]azy[G]it' })
vim.keymap.set('n', '<leader>lgc', ':LazyGitConfig<CR>', { desc = 'Open [L]azy[G]it [C]onfig' })

-- Map paste to register 0
-- vim.keymap.set({ 'n', 'v' }, 'p', '"0p', { desc = '[P]aste from register 0', expr = true, silent = true })

-- [[ Common configuration ]]
autocmd('BufWritePre', { pattern = '*', command = "%s/\\s\\+$//e" })
