return {
    {
        -- provide the 'make' command to compile the pdf
        "kaarmu/typst.vim",
        ft = 'typst',
        lazy = false,
    },
    {
        -- preview using 'TypstPreview'
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {
            formatterMode = "typstyle"
        }, -- lazy.nvim will implicitly calls `setup {}`
    }
}
