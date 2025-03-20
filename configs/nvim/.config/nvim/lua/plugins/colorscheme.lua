return {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = true,
            nvim_tree_darker = true,
        })
        vim.cmd.colorscheme("vscode_modern")

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
    end,
}
