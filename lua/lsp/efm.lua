local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.formatting'.format()]]
        vim.cmd [[augroup END]]
    end
end
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
require'lspconfig'.efm.setup{
    init_options = {documentFormatting = true, codeAction = false},
    on_attach = on_attach,
    filetypes = {"javascriptreact", "javascript", "typescript","typescriptreact", "html", "css", "json", "graphql"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            -- python = python_arguments,
            -- lua = lua_arguments,
            -- sh = sh_arguments,
            javascript = {prettier},
            javascriptreact = {prettier},
			typescript = {prettier},
			typescriptreact = {prettier},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            graphql = {prettier},
            -- yaml = {prettier},
            -- markdown = {markdownPandocFormat}
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            -- markdown = {markdownPandocFormat, markdownlint},
        }
    }
}
