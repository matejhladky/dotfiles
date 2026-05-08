local transparent_highlights = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "SignColumn",
  "FoldColumn",
  "LineNr",
  "CursorLineNr",
  "StatusLine",
  "StatusLineNC",
  "WinSeparator",
}

local function apply_transparent_backgrounds()
  for _, highlight in ipairs(transparent_highlights) do
    vim.api.nvim_set_hl(0, highlight, { bg = "none" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_transparent_backgrounds,
})
