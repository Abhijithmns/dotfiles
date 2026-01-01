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
    config = function()
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

      local function bin(name)
        return mason_bin .. name
      end

      local function start(name, opts)
        vim.lsp.start({
          name = name,
          cmd = opts.cmd,
          filetypes = opts.filetypes,
          root_dir = opts.root_dir or vim.fs.dirname(
            vim.fs.find({ ".git" }, { upward = true })[1]
          ),
          settings = opts.settings,
        })
      end

      ----------------------------------------------------------------
      -- C / C++
      ----------------------------------------------------------------
      start("clangd", {
        cmd = { bin("clangd") },
        filetypes = { "c", "cpp" },
      })

      ----------------------------------------------------------------
      -- HTML
      ----------------------------------------------------------------
      start("html", {
        cmd = { bin("vscode-html-language-server"), "--stdio" },
        filetypes = { "html" },
      })

      ----------------------------------------------------------------
      -- CSS
      ----------------------------------------------------------------
      start("cssls", {
        cmd = { bin("vscode-css-language-server"), "--stdio" },
        filetypes = { "css" },
      })

      ----------------------------------------------------------------
      -- JavaScript / TypeScript / React / Node / Express
      ----------------------------------------------------------------
      start("vtsls", {
        cmd = { bin("vtsls"), "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      })

      ----------------------------------------------------------------
      -- Python
      ----------------------------------------------------------------
      start("pyright", {
        cmd = { bin("pyright-langserver"), "--stdio" },
        filetypes = { "python" },
      })

      ----------------------------------------------------------------
      -- Lua
      ----------------------------------------------------------------
      start("lua_ls", {
        cmd = { bin("lua-language-server") },
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,
  },
}

