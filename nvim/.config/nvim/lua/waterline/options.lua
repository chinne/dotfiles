vim.opt.relativenumber = true               -- set relative numbered lines
vim.opt.number = true                       -- set numbered lines

vim.opt.tabstop = 4                         -- insert 2 spaces for a tab
vim.opt.shiftwidth = 4                      -- the number of spaces inserted for each indentation
vim.opt.expandtab = true                    -- convert tabs to spaces

vim.opt.smartindent = true                  -- make indenting smarter again

vim.opt.wrap = false                        -- display lines as one long line

vim.opt.swapfile = false                    -- creates a swap file
vim.opt.backup = false                      -- creates a backup file

vim.opt.undofile = true                     -- enable persistent undo

vim.opt.hlsearch = false                    -- highlight all matches on previous search pattern
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8                       
vim.opt.signcolumn = "yes"                  -- always show the sign column, otherwise it would shift the text each time

vim.opt.ignorecase = true                   -- ignore case in search patterns
vim.opt.smartcase = true                    -- smart case

--vim.opt.cursorline = true                 -- highlight the current line

vim.opt.splitbelow = true                   -- force all horizontal splits to go below current window
vim.opt.splitright = true                   -- force all vertical splits to go to the right of current window

vim.opt.clipboard:append("unnamedplus")     -- allows neovim to access the system clipboard

vim.opt.errorbells = false

vim.opt.colorcolumn = "120"
