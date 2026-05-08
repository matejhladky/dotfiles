local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"

vim.opt.runtimepath:prepend(parser_install_dir)

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      parser_install_dir = parser_install_dir,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "vue",
        "typescript",
        "javascript",
        "html",
        "css",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
