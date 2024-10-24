-- Variables
local keymap = vim.keymap.set
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- NORMAL MODE --
-----------------

-- Configuration Reload --
keymap('n', '<leader>rl', ':w<CR> :luafile ~/.config/lvim/config.lua<CR>', opts)

-- Buffer Management --
keymap('n', '<leader>bc', ':enew<CR>', opts)
-- Buffer Navigation
keymap('n', '<Tab>', ':bnext<CR>' ,opts)
keymap('n', '<S-Tab>', ':bprevious<CR>' ,opts)
keymap('n', '<leader>x', ':BufferKill<CR>', opts)
keymap('n', '<leader>c', ':w<CR> :BufferKill<CR>', opts)
-- <leader>c closes the buffer, somehow ¯\_(ツ)_/¯ 

-- Tab Navigation
keymap('n', '<S-l>', ':tabnext<CR>', opts)
keymap('n', '<S-h>', ':tabprevious<CR>', opts)

-- Window + Buffer Management --
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)

-- MULTIPLE WINDOW MANAGEMENT --
-- Splitting & Tabedit
keymap('n', '<leader>hs', ':split<CR>', opts)
keymap('n', '<leader>vs', ':vsplit<CR>', opts)
keymap('n', '<leader>t', ':tabedit<CR>', opts)
-- Terminal Windows: Splitting & Tabedit
keymap('n', '<leader>ht', ':split | terminal<CR> i', opts)
keymap('n', '<leader>vt', ':vsplit | terminal<CR> i', opts)
keymap('n', '<leader>tt', ':tabedit | terminal<CR> i', opts)
-- Resize with arrows (delta: 1 lines)
keymap('n', '<C-Up>', ':resize +1<CR>', opts)
keymap('n', '<C-Down>', ':resize -1<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +1<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -1<CR>', opts)

-------------------
-- TERMINAL MODE --
-------------------

-- MULTIPLE WINDOW MANAGEMENT --
-- Resize with arrows (delta: 1 line) in terminal mode
keymap('t', '<C-Up>', '<C-\\><C-n>:resize +1<CR>', opts)
keymap('t', '<C-S-Down>', '<C-\\><C-n>:resize -1<CR>', opts)
keymap('t', '<C-S-Left>', '<C-\\><C-n>:vertical resize +1<CR>', opts)
keymap('t', '<C-S-Right>', '<C-\\><C-n>:vertical resize -1<CR>', opts)

--------------------
-- MODE SWITCHING --
--------------------

-- jk: Visual/Insert -> Normal
keymap('t', 'jk', '<Esc>', opts)
-- Esc: Terminal -> Normal
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

