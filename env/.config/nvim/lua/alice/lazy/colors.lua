function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

    {
        "erikbackman/brightburn.vim",
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "moon"
            })
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },

    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                transparent = true, -- do not set background color
                theme = "wave",     -- Load "wave" theme when 'background' option is not set
                background = {      -- map the value of 'background' option to a theme
                    dark = "wave",  -- try "dragon" !
                    light = "lotus"
                },
            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        config = function()
            require("cyberdream").setup({
                transparent = true,
                theme = {
                    variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
                    saturation = 1,   -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
                },
            })
        end
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require 'nightfox'.setup {
                options = {
                    transparent = true,               -- Disable setting background
                },
            }
        end
    }


}
