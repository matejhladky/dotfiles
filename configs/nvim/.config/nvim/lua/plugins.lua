return {
  {
    "silentium-theme/silentium.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("silentium")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "vue", "typescript", "javascript", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
