local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
keymap("n", "<leader>h", ":wincmd h<cr>", opts)
keymap("n", "<leader>j", ":wincmd j<cr>", opts)
keymap("n", "<leader>k", ":wincmd k<cr>", opts)
keymap("n", "<leader>l", ":wincmd l<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<cr>", opts)
keymap("n", "<C-h>", ":bprevious<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-w>", ":Bdelete<cr>", opts) -- delete buffer (tab)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)

-- better yank and paste
keymap("v", "p", '"_dP', opts)

-- Telescope
-- keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
-- TODO use find_file if it's not a git repo
keymap("n", "<C-p>", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("x", "<leader>/", '<esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>', opts)
