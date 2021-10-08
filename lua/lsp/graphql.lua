require'lspconfig'.graphql.setup{
    cmd = {"graphql-lsp", "server", "-m", "stream"},
    filetypes = {"graphql"},
    root_dir = require('lspconfig/util').root_pattern('.git', '.graphqlrc')
}
