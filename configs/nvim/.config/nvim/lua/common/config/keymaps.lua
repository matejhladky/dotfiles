vim.g.mapleader = ' '

-- copying to nvim & system buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- move highlighted block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center after half-jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- disable arrows
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("v", "<Left>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("v", "<Right>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("v", "<Up>", "<nop>")
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("v", "<Down>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
