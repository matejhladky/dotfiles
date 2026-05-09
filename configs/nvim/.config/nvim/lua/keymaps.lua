local map, opts = vim.keymap.set, { noremap = true, silent = true }

-- open file explorer
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', opts)

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
for _, key in ipairs({ "<Left>", "<Right>", "<Up>", "<Down>" }) do
  map({ "n", "v", "i" }, key, "<nop>")
end

-- telescope
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, opts)
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, opts)
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, opts)

-- lsp: in ./plugins/lsp.lua