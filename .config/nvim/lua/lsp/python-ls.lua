-- npm i -g pyright
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.pyright.setup {
    cmd = {"pyright-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach
    -- capabilities = capabilities
}
