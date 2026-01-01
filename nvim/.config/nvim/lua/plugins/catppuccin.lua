--[[
return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
]]
return
{
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
                undercurl = false,
                underline = false,
                transparent_mode =true
    })

    vim.cmd('colorscheme github_dark_default')
  end,
}
--[[

return{
    "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...,
    config = function ()
        -- Default options:
        require("gruvbox").setup({
          terminal_colors = true, -- add neovim terminal colors
          undercurl = false,
          underline = true,
          bold = true,
          italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
          },
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = false,
          inverse = true, -- invert background for search, diffs, statuslines and errors
          contrast = "", -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = false,
        })
    vim.cmd("colorscheme gruvbox")

    end

}
]]
--[[
return {
    "rebelot/kanagawa.nvim",
    config = function ()
                -- Default options:
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa-wave")
    end


}
]]
