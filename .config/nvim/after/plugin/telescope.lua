require'telescope'.setup {
  defaults = {
    file_ignore_patterns = {
      ".git", "node_modules", "build", "dist", "yarn.lock"
    },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
