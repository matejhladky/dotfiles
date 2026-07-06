local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"

vim.opt.runtimepath:prepend(parser_install_dir)

local ensure_installed = {
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
  "markdown",
  "markdown_inline",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = parser_install_dir,
    })

    require("nvim-treesitter").install(ensure_installed)

    -- Enable highlighting (and treesitter-based indent) for installed parsers.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if lang and vim.treesitter.language.add(lang) then
          pcall(vim.treesitter.start, args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
