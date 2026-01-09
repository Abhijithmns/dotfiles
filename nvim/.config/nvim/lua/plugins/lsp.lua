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

      ----------------------------------------------------------------
      -- Root detection (SAFE)
      ----------------------------------------------------------------
      local function get_root()
        -- Prefer git root
        local git = vim.fs.find(".git", { upward = true })[1]
        if git then
          return vim.fs.dirname(git)
        end

        -- Allow Neovim config directory
        local nvim_config = vim.fn.stdpath("config")
        local cwd = vim.loop.cwd()

        if cwd:find(nvim_config, 1, true) == 1 then
          return nvim_config
        end

        -- IMPORTANT: do NOT fall back to $HOME
        return nil
      end

      local function start(name, opts)
        if not opts.root_dir then
          return
        end

        vim.lsp.start({
          name = name,
          cmd = opts.cmd,
          filetypes = opts.filetypes,
          root_dir = opts.root_dir,
          settings = opts.settings,
        })
      end

      ----------------------------------------------------------------
      -- C / C++
      ----------------------------------------------------------------
      start("clangd", {
        cmd = { bin("clangd") },
        filetypes = { "c", "cpp" },
        root_dir = get_root(),
      })

      ----------------------------------------------------------------
      -- HTML
      ----------------------------------------------------------------
      start("html", {
        cmd = { bin("vscode-html-language-server"), "--stdio" },
        filetypes = { "html" },
        root_dir = get_root(),
      })

      ----------------------------------------------------------------
      -- CSS
      ----------------------------------------------------------------
      start("cssls", {
        cmd = { bin("vscode-css-language-server"), "--stdio" },
        filetypes = { "css" },
        root_dir = get_root(),
      })

      ----------------------------------------------------------------
      -- JavaScript / TypeScript / React
      ----------------------------------------------------------------
      start("vtsls", {
        cmd = { bin("vtsls"), "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        root_dir = get_root(),
      })

      ----------------------------------------------------------------
      -- Python
      ----------------------------------------------------------------
      start("pyright", {
        cmd = { bin("pyright-langserver"), "--stdio" },
        filetypes = { "python" },
        root_dir = get_root(),
      })

      ----------------------------------------------------------------
      -- Lua (HOME DIR FIX)
      ----------------------------------------------------------------
      local root = get_root()

      if root and root ~= vim.env.HOME then
        start("lua_ls", {
          cmd = { bin("lua-language-server") },
          filetypes = { "lua" },
          root_dir = root,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        })
      end
    end,
  },
}

