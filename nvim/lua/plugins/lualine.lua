return {
    "nvim-lualine/lualine.nvim",
    config = function()
        -- local monokai_pro = require'lualine.themes.monokai-pro'
        -- monokai_pro.normal.c.bg = 'NONE'
        require('lualine').setup({
            options = {
                theme = monokai_pro,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            }
        })
    end
}

