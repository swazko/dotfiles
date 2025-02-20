local opt = vim.opt

-- leader
vim.g.mapleader = " "

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4         -- 4 is king
opt.shiftwidth = 4
opt.expandtab = true    -- expand tab to spaces
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true   -- ignore case when searching
opt.smartcase = true    -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- use system clipboard as default
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- split windows keybinds
vim.keymap.set('n', '<leader>sh', ':split-window<CR>')
vim.keymap.set('n', '<leader>sv', ':vsplit-window<CR>')

-- tab management keybinds
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')  -- open new tab
vim.keymap.set('n', '<leader>tp', ':tabprev<CR>') -- go to previous tab (tab left)
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>') -- go to next tab (tab right)
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>') -- close current tab

-- turn off swapfile
opt.swapfile = false
