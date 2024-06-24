local map = vim.keymap.set

map({"n", "v"}, "<C-d>", "<C-d>zz")
map({"n", "v"}, "<C-u>", "<C-u>zz")
map({"n", "v"}, "n", "nzzzv")
map({"n", "v"}, "N", "Nzzzv")
map({"n", "v"}, "G", "Gzz")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
