return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Python
                    null_ls.builtins.formatting.black,
                    require("none-ls.diagnostics.flake8"),

                    -- C / C++
                    null_ls.builtins.formatting.clang_format,

                    -- JavaScript / TypeScript
                    null_ls.builtins.formatting.prettier,
                    require("none-ls.diagnostics.eslint"),

                    -- HTML / CSS
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.stylelint,

                    -- Bash
                    null_ls.builtins.formatting.shfmt,

                    -- Go
                    null_ls.builtins.formatting.goimports,

                    -- Lua
                    null_ls.builtins.formatting.stylua,

                    -- Spellcheck (completion only, safe everywhere)
                    null_ls.builtins.completion.spell,
                },

                on_init = function(client)
                    client.config.cmd_env = {
                        PATH = vim.env.PATH,
                    }
                end,
            })

            -- Format current buffer
            vim.keymap.set("n", "fo", function()
                vim.lsp.buf.format({ async = true })
            end, { desc = "Format file with null-ls" })
        end,
    },
    {
        "nvimtools/none-ls-extras.nvim",
    },
}
