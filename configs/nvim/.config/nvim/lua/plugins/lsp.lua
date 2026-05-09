return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- buffer-local keymaps, bound only when an LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
        end
        map("gd", vim.lsp.buf.definition, "LSP: go to definition")
        map("gD", vim.lsp.buf.declaration, "LSP: go to declaration")
        map("gi", vim.lsp.buf.implementation, "LSP: go to implementation")
        map("gr", vim.lsp.buf.references, "LSP: references")
        map("K", vim.lsp.buf.hover, "LSP: hover")
        map("<leader>rn", vim.lsp.buf.rename, "LSP: rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
      end,
    })

    -- diagnostic navigation (global, not buffer-local)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "prev diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "next diagnostic" })

    -- servers
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          -- silence "undefined global 'vim'" inside nvim configs
          diagnostics = { globals = { "vim" } },
          -- make nvim runtime files visible for completion
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    lspconfig.basedpyright.setup({
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",
          },
        },
      },
    })
  end,
}
