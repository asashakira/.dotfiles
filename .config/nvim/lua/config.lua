require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "tsx", "cpp", "python"},
  highlight = {
    enable = true,
    disable = {
      'lua',
      'ruby',
      'toml',
      'c_sharp',
      'vue',
    },
  },
}
