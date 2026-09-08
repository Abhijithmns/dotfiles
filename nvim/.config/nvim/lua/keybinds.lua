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



-- Clipboard stuff
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.keymap.set('n', 'ye', 'ggVG"+y', {
    desc = 'Yank entire file to system clipboard',
})

vim.keymap.set('n', 'de', 'ggVGd')

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Set highlight on search but clear on pressing <Esc> on normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics

vim.keymap.set('n', 'tp', function()
  vim.diagnostic.jump({
    count = -1,
  })
end, { desc = "Previous diagnostic" })

vim.keymap.set('n', 'tn', function()
  vim.diagnostic.jump({
    count = 1,
  })
end, { desc = "Next diagnostic" })

-- Toggle Completion
vim.keymap.set("n", "<leader>tc", function()
  local cmp = require("cmp")
  local current = cmp.get_config().enabled
  cmp.setup({ enabled = not current })
  print("CMP enabled:", not current)
end)

-- No swapfiles
vim.opt.swapfile = false



