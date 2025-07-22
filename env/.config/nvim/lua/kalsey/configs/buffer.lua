vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup {
    options = {
        indicator = {
            style = "underline",
        },
        diagnostics = false,
        themable = true,
    }
}
