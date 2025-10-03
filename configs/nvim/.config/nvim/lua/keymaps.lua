local map, opts = vim.keymap.set, { noremap = true, silent = true }

-- open file exlorer
map('n', '<leader>e', '<cmd>Ex<cr>', opts)

-- copying to nvim & system buffer
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- move highlighted block
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- center after half-jump
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- disable arrows
map("n", "<Left>", "<nop>")
map("v", "<Left>", "<nop>")
map("i", "<Left>", "<nop>")
map("n", "<Right>", "<nop>")
map("v", "<Right>", "<nop>")
map("i", "<Right>", "<nop>")
map("n", "<Up>", "<nop>")
map("v", "<Up>", "<nop>")
map("i", "<Up>", "<nop>")
map("n", "<Down>", "<nop>")
map("v", "<Down>", "<nop>")
map("i", "<Down>", "<nop>")

