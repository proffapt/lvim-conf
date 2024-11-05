-- !! IMPORTANT OVERWRITE !! --
-- Remove this and all keybindings go brrr
-- and require manual reload of configuration
vim.g.mapleader = " "

-- disable pre-defined keymaps
lvim.keys.normal_mode['<C-Up>'] = false
lvim.keys.normal_mode['<C-Down>'] = false
lvim.keys.normal_mode['<C-Left>'] = false
lvim.keys.normal_mode['<C-Right>'] = false

-- variables
local keymap = vim.keymap.set
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local curr_file = vim.fn.expand('%:t')
local curr_dir = vim.fn.expand('%:p:h')
local cd_curr_dir = ' cd ' .. curr_dir .. '<CR>'
local open_term_buf =  ' | terminal<CR>i' .. cd_curr_dir

-- non-monotonous logics
local function entity_close()
    local ok, _ = pcall(vim.cmd.close)
    if not ok then
        vim.cmd('BufferKill')
    end
end

-----------------
-- NORMAL MODE --
-----------------

-- Manual Configuration Reload --
keymap('n', '<leader>rc', ':w<CR> :luafile ~/.config/lvim/config.lua<CR>', opts)
--

-- Buffer Management --
-- Buffer Cretion
keymap('n', '<leader>bc', ':enew<CR>', opts)
-- Buffer Navigation
keymap('n', '<Tab>', ':bnext<CR>' ,opts)
keymap('n', '<S-Tab>', ':bprevious<CR>' ,opts)
-- <leader>c closes the buffer. Defined in which-key.lua
--

-- Entity Management (Close, Save, Save and Close --
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>x', entity_close, opts)
--

-- Splitting --
-- Buffers
keymap('n', '_', ':split<CR>', opts)
keymap('n', '|', ':vsplit<CR>', opts)
-- Terminal Wndows: Splitting & Buffer
keymap('n', 'T_', ':split' .. open_term_buf, opts)
keymap('n', 'T|', ':vsplit' .. open_term_buf, opts)
keymap('n', 'TB', ':enew' .. open_term_buf, opts)
keymap('n', 'TF', ':ToggleTerm<CR>' .. cd_curr_dir, opts)
-- Resize with arrows (delta: 1 lines)
keymap('n', '<C-S-Up>', ':resize +1<CR>', opts)
keymap('n', '<C-S-Down>', ':resize -1<CR>', opts)
keymap('n', '<C-S-Left>', ':vertical resize +1<CR>', opts)
keymap('n', '<C-S-Right>', ':vertical resize -1<CR>', opts)

-------------------
-- TERMINAL MODE --
-------------------

-- MULTIPLE WINDOW MANAGEMENT --
-- Resize with arrows (delta: 1 line) in terminal mode
keymap('t', '<C-S-Up>', '<C-\\><C-n>:resize +1<CR>', opts)
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

-----------------
-- CODE RUNNER --
-----------------

keymap('n', 'rr', ':w<CR>:split' .. open_term_buf .. ' run ' .. curr_file .. '<CR>', opts)

local prev_file_buffer = vim.fn.expand('#:p')
keymap('t', 'rr', ' run ' .. prev_file_buffer .. '<CR>', opts)

--------------------
-- CUSTOM PLUGINS --
--------------------

-- Dismiss all notice pop-ups
keymap('n', '<Esc>', '<Esc> :NoiceDismiss<CR>', opts)
-- Oil (file tree editor)
keymap('n', '-', ':Oil --float<CR>', opts)
