vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.py",
    "*.tsx",
    "*.ts",
    "*.lua",
  },
  command = ":Format",
})
