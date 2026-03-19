return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })

    -- transparency fix
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.cmd([[
          highlight NeoTreeNormal guibg=NONE ctermbg=NONE
          highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
          highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
          highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE
        ]])
      end,
    })

    vim.cmd([[
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
    ]])

    vim.keymap.set("n", "<leader>q", ":Neotree toggle left<CR>", {})
  end,
}
