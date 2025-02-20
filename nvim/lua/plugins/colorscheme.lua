return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
		    -- vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "moonfly"
		end,
	},
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme "nightfly"
        end,
    },
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme "oxocarbon"
		end,
	},
    {
        "loctvl842/monokai-pro.nvim",
        name="monokai-pro",
        lazy = false,
        priority = 1000,
        config = function()
            -- -- This is for charcoal
            -- require("monokai-pro").setup({
            --     transparent_background = true,
            --     overridePalette = function(filter)
            --         return {
            --             dark2 = "#3E3D32",    -- bright_black
            --             dark1 = "#272822",    -- black
            --             background = "#2D2D2D", -- background
            --             text = "#F8F8F2",     -- foreground
            --             accent1 = "#F92672",  -- red
            --             accent2 = "#FD971F",  -- orange
            --             accent3 = "#E6DB74",  -- yellow
            --             accent4 = "#A6E22E",  -- green
            --             accent5 = "#66D9EF",  -- blue
            --             accent6 = "#AE81FF",  -- purple
            --             dimmed1 = "#F8F8F0",  -- bright_white
            --             dimmed2 = "#F8F8F2",  -- gray
            --             dimmed3 = "#75715E",  -- comment
            --             dimmed4 = "#FD971F",  -- gray
            --             dimmed5 = "#272822",  -- black (using the same as dark1)
            --         }
            --     end
            -- })
            -- vim.cmd.colorscheme("monokai-pro-classic")
        end,
    },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("kanagawa").setup({
			-- 	undercurl = false,
			-- 	commentStyle = { italic = false },
			-- 	keywordStyle = { italic = false },
			-- 	statementStyle = { bold = false },
			-- })
            -- vim.cmd.colorscheme "kanagawa"
		end,
	},
    {
        "ellisonleao/gruvbox.nvim",
        name="gruvbox",
        lazy = false,
        priority = 1000,
        config = function()
            -- require("gruvbox").setup({
            --     terminal_colors = true, -- add neovim terminal colors
            --     undercurl = false,
            --     underline = false,
            --     bold = false,
            --     italic = {
            --         strings = false,
            --         emphasis = false,
            --         comments = false,
            --         operators = false,
            --         folds = false,
            --     },
            --     strikethrough = false,
            --     invert_selection = false,
            --     invert_signs = false,
            --     invert_tabline = false,
            --     invert_intend_guides = false,
            --     inverse = true, -- invert background for search, diffs, statuslines and errors
            --     contrast = "hard", -- can be "hard", "soft" or empty string
            --     palette_overrides = {},
            --     overrides = {},
            --     dim_inactive = false,
            --     transparent_mode = false,
            -- })
            -- vim.cmd.colorscheme "gruvbox"
        end,
    },
    {
        "sainnhe/gruvbox-material",
        name="gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.g.gruvbox_material_foreground = "original"
            -- vim.g.gruvbox_material_background = "hard"
            -- vim.cmd.colorscheme "gruvbox-material"
        end,
    },
}

