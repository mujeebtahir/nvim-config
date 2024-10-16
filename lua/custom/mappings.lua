local map = vim.keymap.set

map('n', '<Tab>', ':bn<CR>', { desc = 'Buffer Next' })
map('n', '<S-Tab>', ':bp<CR>', { desc = 'Buffer Close' })
map('n', '<C-d>', ':bd<CR>', { desc = 'Buffer Close/Delete' })

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 29

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.opt.showcmd = true -- Show (partial) command in status line.
vim.opt.number = true -- Show line numbers
vim.opt.expandtab = true -- Convert tab to spaces
vim.opt.hlsearch = true -- Keeps the search pattern highlighted
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.tabstop = 4 -- Number of spaces that a Tab character represents
vim.opt.softtabstop = 4 -- Number of spaces a Tab counts for while editing
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: Terminal Bindings
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { desc = 'Terminal Opens a new terminal' })
-- vim.keymap.set_'n', '<leader>t', nvim_open_term(), { desc = 'Terminal Opens a new terminal' }_
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- WARN: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Treesitter-context
-- vim.keymap.set('n', '[c', function()
--   require('treesitter-context').go_to_context(vim.v.count1)
-- end, { silent = true })

local neogit = require 'neogit'
-- vim.keymap.set('n', '<leader>gs', neogit.open { kind = 'vsplit_left' }, { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>gs', neogit.open { kind = 'vsplit_left' }, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gs', neogit.open, { desc = 'Neogit open', silent = true, noremap = true })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = 'Neogit git commit', silent = true, noremap = true })
vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { desc = 'Neogit git pull', silent = true, noremap = true })
vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { desc = 'Neogit git push', silent = true, noremap = true })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { desc = 'Neogit git branch', silent = true, noremap = true })
vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { desc = 'Neogit git blame', silent = true, noremap = true })

-- Disable the AnsiEsc plugin's keymap, it overlaps with <leader>sw "Treesitter word search"
vim.keymap.del('n', '<leader>swp')

-- Toggle Diffview
vim.keymap.set('n', '<leader><leader>v', function()
  if next(require('diffview.lib').views) == nil then
    vim.cmd 'DiffviewOpen'
  else
    vim.cmd 'DiffviewClose'
  end
end)

vim.keymap.set('n', '<leader>np', ':NoNeckPain<CR>', { desc = 'NoNeckPain', silent = true, noremap = true })
