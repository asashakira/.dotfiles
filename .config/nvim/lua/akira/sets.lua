local tabs = 2

local sets = {
  helpheight = 999, -- full screen help
  clipboard = "unnamedplus", -- access system clipboard
  termguicolors = true, -- more colors

  -- tabs, indents
  tabstop = tabs,
  softtabstop = tabs,
  shiftwidth = tabs,
  expandtab = true,
  smartindent = true,
  wrap = false,

  -- column
  number = true,
  relativenumber = true,
  numberwidth = 4,
  colorcolumn = "120",
  signcolumn= "yes",

  -- search
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  -- mouse and cursor
  mouse = "a",
  guicursor = "",
  cursorline = true,

  -- cmd
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  pumheight = 10,

  -- buffers files windows splits
  showtabline = 2,
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  hidden = true,
  fileencoding = "utf-8",
  splitbelow = true,
  splitright = true,

  -- so we can actually see
  scrolloff = 8,
  sidescrolloff = 16,
}

for k, v in pairs(sets) do
  vim.opt[k] = v
end

