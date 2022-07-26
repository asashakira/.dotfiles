local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require"akira.lsp.lsp-installer"
--require"akira.lsp.handlers".setup()
