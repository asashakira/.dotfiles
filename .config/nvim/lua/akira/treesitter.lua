local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "dockerfile",
    "git_rebase",
    "go",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "rust",
    "toml",
    "tsx",
    "typescript",
    -- "yaml",
    "vim",
  },
  sync_install = true,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
