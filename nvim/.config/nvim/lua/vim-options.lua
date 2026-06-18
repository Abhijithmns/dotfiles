vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Indents
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Copy current line
vim.api.nvim_set_keymap('n', '<leader>c', '"+yy', { noremap = true, silent = true })
-- Copy visual selection
vim.api.nvim_set_keymap('v', '<leader>c', '"+y', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


vim.keymap.set("n", "<leader>tc", function()
  local cmp = require("cmp")
  local current = cmp.get_config().enabled
  cmp.setup({ enabled = not current })
  print("CMP enabled:", not current)
end)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })


