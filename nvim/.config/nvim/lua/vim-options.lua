vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.number = true          
vim.opt.relativenumber = true 
vim.opt.termguicolors = true

-- Copy current line
vim.api.nvim_set_keymap('n', '<leader>c', '"+yy', { noremap = true, silent = true })
-- Copy visual selection
vim.api.nvim_set_keymap('v', '<leader>c', '"+y', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- harpoon keymaps

vim.keymap.set("n", "<leader>tc", function()
  local cmp = require("cmp")
  local current = cmp.get_config().enabled
  cmp.setup({ enabled = not current })
  print("CMP enabled:", not current)
end)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })


