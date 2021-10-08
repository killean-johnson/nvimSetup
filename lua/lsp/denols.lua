-- curl -fsSL https://deno.land/x/install/install.sh | sh
local on_attach = require('lsp.on_attach')
require'lspconfig'.denols.setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
    end,
    init_options = {
        lint = true
    }
}
