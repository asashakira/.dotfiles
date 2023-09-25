vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- open netrw
keymap("n", "<leader>e", vim.cmd.Ex)

-- window navigation
keymap("n", "<leader>h", ":wincmd h<cr>")
keymap("n", "<leader>j", ":wincmd j<cr>")
keymap("n", "<leader>k", ":wincmd k<cr>")
keymap("n", "<leader>l", ":wincmd l<cr>")

-- keep cursor centered
-- keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
