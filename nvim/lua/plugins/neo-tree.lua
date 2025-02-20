
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
        })

        vim.keymap.set('n', '<leader>e', ':Neotree filesystem toggle left<CR>', {})

        -- vim.cmd [[
        --     hi NeoTreeNormal guibg=NONE ctermbg=NONE
        --     hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
        --     hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
        -- ]]
    end
}

