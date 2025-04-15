require("config.options")
require("config.keymaps")
require("config.lazy")

-- Ensure Neovim doesn't override transparency
local highlights = {
    "Normal", "NormalNC", "NormalFloat",
    "SignColumn", "FoldColumn",
    "LineNr", "CursorLineNr",
    "StatusLine", "StatusLineNC",
    "WinSeparator",
}

for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl, { bg = "none" })
end

-- Override comment color to #717171
vim.api.nvim_set_hl(0, "Comment", { fg = "#717171", italic = true })

