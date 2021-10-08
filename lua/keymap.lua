local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

map('n', '<Leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap=true; silent=true})

-- LSP SAGA
map('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
map('n', '<Leader>do', ':Lspsaga code_action<CR>', { noremap=true, silent=true }) -- in whichkey
map('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>',
    {noremap = true, silent = true})
map('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>',
    {noremap = true, silent = true})
-- scroll down hover doc or scroll in definition preview
map('n', '<Down>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
    {noremap = true, silent = true})
-- scroll up hover doc
map('n', '<Up>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>k',
    '<cmd>lua require(\'lspsaga.diagnostic\').show_line_diagnostics()<CR>',
    {noremap = true, silent = true})



-- NVIM_COMPE
vim.api.nvim_exec(
    [[
        inoremap <silent><expr> <C-Space> compe#complete()
    ]],true
)

-- LSP TROUBLE
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_command("command! LspFormatting :lua vim.lsp.buf.formatting()")

vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>LspFormatting<CR>",{silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>NvimTreeToggle<cr>", 
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>NvimTreeFindFile<cr>", 
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", 
    {silent = true, noremap = true}
)

-- git stuff
vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //3<CR>", 
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gu", ":diffget //2<CR>", 
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gs", ":G <CR>", 
    {silent = true, noremap = true}
)
