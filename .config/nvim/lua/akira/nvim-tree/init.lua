local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local on_attach = require("akira.nvim-tree.on-attach").on_attach

nvim_tree.setup {
  on_attach = on_attach,
  filters = {
    dotfiles = true,
  },
}
