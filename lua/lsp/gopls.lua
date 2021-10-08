require'lspconfig'.gopls.setup{
    settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
    root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
    init_options = {usePlaceholders = true, completeUnimported = true},
}
