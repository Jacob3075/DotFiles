local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jacob.lsp.lsp-installer"
require("jacob.lsp.handlers").setup()
require "jacob.lsp.null-ls"
