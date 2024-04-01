
local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap.set('i','jk','<ESC>')
keymap.set("t", "jk","<C-\\><C-N>")
keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

keymap.set('n', '<leader>ls', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [S]how' })
keymap.set('n', '<leader>lr', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [R]efresh' })
keymap.set('n', '<leader>lf', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [F]ind Files' })
keymap.set("n", "<leader>w|", "<C-w>v", { desc = 'Split window vertically'}) -- split window vertically
keymap.set("n", "<leader>w-", "<C-w>s", { desc = 'Split window horizontally'}) -- split window horizontally
keymap.set("n", "<leader>wd", ":close<CR>", { desc = 'Close split window'}) -- close current split window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- Configure for tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Configure util movements
keymap.set({ 'n', 'v' }, '<Space>jh', '<c-w><c-h>', { desc = '[J]ump to Left Pane' })
keymap.set({ 'n', 'v' }, '<Space>jj', '<c-w><c-j>', { desc = '[J]ump to Bottom Pane' })
keymap.set({ 'n', 'v' }, '<Space>jk', '<c-w><c-k>', { desc = '[J]ump to Top Pane' })
keymap.set({ 'n', 'v' }, '<Space>jl', '<c-w><c-l>', { desc = '[J]ump to Right Pane' })

-- Copy file name / relative path / full path
keymap.set('n', '<Space>cr', ':let @+=expand("%")<CR>', { desc = '[C]opy [R]elative path' })
keymap.set('n', '<Space>cf', ':let @+ = expand("%:p")<CR>', { desc = '[C]opy [F]ull path' })
keymap.set('n', '<Space>cn', ':let @+ = expand("%:t")<CR>', { desc = '[C]opy File [N]ame' })

-- Configure custom development keys
keymap.set('v', '<c-c>', '"*y', { desc = 'Copy to clipboard registry' })
keymap.set('n', 'Y', 'y$', { desc = '[Y]ank to the End of line' })
keymap.set('n', 'v$', 'v$h', { desc = '[V]isual to the last character of line' })
keymap.set('n', '<c-a>', 'ggVG', { desc = '[V]isual all textes of the current buffer' })
keymap.set('n', '<S-j>n', 'i<CR><ESC>', { desc = 'Break cursor to a new line' })
keymap.set('n', 'n', 'nzzzv', { desc = 'Keeping centered' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Keeping centered' })
keymap.set('n', '<S-j>', 'mzJ`z', { desc = 'Keeping centered' })
keymap.set('n', '<leader>\\', '<c-^>', { desc = 'Switch between the last two buffers' })
keymap.set('n', 'Zz', "<c-w>|", { desc = '[Z]oom In' })
keymap.set('n', 'Zo', "<c-w>=", { desc = '[Z]oom [O]ut' })
keymap.set('n', '<c-e>', 'A<ESC>', { desc = '[J]ump to the end of line' })
keymap.set('n', '<c-i>', 'I<ESC>', { desc = '[J]ump to the start of line' })
keymap.set('n', '<CR>', '<ESC>:noh<CR>', { desc = 'Clear console', silent = true })

-- See `:help telescope.builtin`
keymap.set('n', '<leader>q', require('telescope.builtin').quickfix, { desc = '[Q]uickfix' })
keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Telescope [R]esume' })

-- Configure quick show/hide line number
keymap.set('n', '<c-l><c-l>', ':set invrelativenumber<CR>', { desc = 'Show [L]ine Inv Relative Number' })
keymap.set('n', '<c-l><c-n>', ':set number<CR>', { desc = 'Show [L]ine [N]umber' })
keymap.set('n', '<c-l><c-o>', ':set nonumber<CR>', { desc = 'Hide [L]ine Number' })

-- Vim config easy access
keymap.set('n', '<c-v><c-o>', ':vnew ~/.config/nvim/init.lua<CR>', { desc = 'Open n[V]im config in vertical pane' })
keymap.set('n', '<c-v><c-i>', ':source ~/.config/nvim/init.lua<CR>', { desc = 'Reload n[V]im config in vertical pane' })

-- Vim surround quick access
keymap.set('n', '<leader>\'', 'cs\'"', { desc = 'Convert single quote to double quote' })
keymap.set('n', '<leader>"', 'cs"\'', { desc = 'Convert double quote to single quote' })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
