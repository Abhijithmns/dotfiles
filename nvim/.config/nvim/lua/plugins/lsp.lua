return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"html",
				"cssls",
				"vtsls",
				"pyright",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"bashls",
				"marksman",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			-- Lua
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			}

			-- Rust
			vim.lsp.config.rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			}

			-- Enable servers
			local servers = {
				"clangd",
				"html",
				"cssls",
				"vtsls",
				"pyright",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"bashls",
				"marksman",
			}

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			-- Keymaps
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end)

			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
				},
			})
		end,
	},
}
