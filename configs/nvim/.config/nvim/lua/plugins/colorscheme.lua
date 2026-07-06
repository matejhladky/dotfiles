return {
  "gmr458/vscode_modern_theme.nvim",
  priority = 1000,
  config = function()
    require("vscode_modern").setup({
      cursorline = true,
      transparent_background = false,
      nvim_tree_darker = true,
    })

    vim.cmd.colorscheme("vscode_modern")

    local darker_bg = "#121212"
    local groups = {
      "Normal",
      "NormalNC",
      "SignColumn",
      "EndOfBuffer",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "TelescopeNormal",
    }

    for _, group in ipairs(groups) do
      local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if ok then
        highlight.bg = darker_bg
        vim.api.nvim_set_hl(0, group, highlight)
      end
    end
  end,
}
