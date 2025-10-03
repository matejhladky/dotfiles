vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- core modules
require('opts')
require('keymaps')

-- ensure neovim doesn't override transparency
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

-- setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {
  checker = { enabled = true },
  -- retain existing runtimepath so system parsers stay visible
  performance = {
    rtp = { reset = false },
  },
})

-- per-machine overrides (not in git)
local local_cfg = vim.fn.stdpath('config') .. '/local.lua'
if vim.fn.filereadable(local_cfg) == 1 then
  dofile(local_cfg)
end

