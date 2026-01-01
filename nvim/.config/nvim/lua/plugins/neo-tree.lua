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
          visible = true,        -- show hidden files (dotfiles)
          hide_dotfiles = false, -- don't hide . files
          hide_gitignored = false, -- show files ignored by git
        },
      },
    })

    -- Keybinding to toggle the file tree
    vim.keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", {})
  end,
}

