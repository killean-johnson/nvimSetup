vim.cmd('syntax on')
vim.cmd('set iskeyword+=-') -- treat dash separated words as a text object
vim.cmd('set shortmess+=c') -- dont pass messages to |ins-completion-menu|
vim.o.title = true

vim.o.showtabline = 2 -- always show buffer tabs
vim.o.hidden = true -- Allow multiple buffers to be open
vim.wo.wrap = false -- dont wrap line
vim.wo.number = true -- show line numbers
vim.wo.relativenumber = false-- relative line numbers instead of absolute
vim.o.cursorline = true -- highlight current line

vim.o.splitbelow = true -- Hsplit below
vim.o.splitright = true -- Vsplit to the right

vim.o.hlsearch = false -- dont highlight search matches
vim.o.ignorecase = true -- default case insensitive search
vim.o.smartcase = true -- case sensitive if search has a capital letter
vim.o.mouse = "a" -- enable mouse
vim.o.scrolloff = 1 -- start scrolling before reaching the bottom

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir/"
vim.o.undofile = true

vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.fileencoding = "utf-8"
vim.o.pumheight = 10 --popup menu height
vim.o.cmdheight = 1 -- space for cmd messages
vim.o.laststatus = 2 -- always show the status
vim.o.conceallevel = 0 --show `` in markdown files
vim.o.showmode = false -- hide the editing mode
vim.o.writebackup = false -- this is recommended by coc
vim.o.updatetime = 300 -- faster completion
vim.o.timeoutlen = 400 -- faster timeoutlen
vim.o.clipboard = "unnamedplus" -- copy paste between vim and everything else
vim.wo.signcolumn = "no"

vim.o.guifont = 'Fira Code:h17'
