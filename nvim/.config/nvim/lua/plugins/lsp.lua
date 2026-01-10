return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "html",
        "cssls",
        "vtsls",
        "pyright",
        "lua_ls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp = vim.lsp

      -- C / C++
      lsp.config.clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },
      }

      -- HTML
      lsp.config.html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
      }

      -- CSS
      lsp.config.cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
      }

      -- JS / TS
      lsp.config.vtsls = {
        cmd = { "vtsls", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      }

      -- Python
      lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
      }

      -- Lua
      lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      }
    end,
  },
}

