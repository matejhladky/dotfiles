return {
  {
    "silentium-theme/silentium.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("silentium")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "python" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
