-- vim.o.t_Co = "256"
vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
vim.cmd('let g:deus_termcolors=256')

vim.cmd([[colorscheme codedark]])

vim.cmd('hi Cursor guibg=#EBDBB2')
vim.cmd('set guicursor=n-v:block-Cursor')
vim.cmd('hi iCursor guibg=#EBDBB2')
vim.cmd('set guicursor+=i-c:ver100-iCursor')
vim.cmd('set guicursor+=r:hor10-iCursor')
vim.cmd('hi oCursor guibg=#E5C07B')
vim.cmd('set guicursor+=o:block-oCursor')
