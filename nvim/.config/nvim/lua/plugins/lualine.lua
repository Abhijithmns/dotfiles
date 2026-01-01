return {
  "nvim-lualine/lualine.nvim",
   config = function()
    require('lualine').setup({
      options = {
        theme = 'tomorrow_night'
      }
    })
  end
}
