require("kalsey.set")
require("kalsey.remap")
require("kalsey.lazy_init")

local augroup = vim.api.nvim_create_augroup
local KalseyGroup = augroup('kalsey', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = KalseyGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local function update_colorscheme()
    local hour = tonumber(os.date('%H'))
    if hour >= 10 and hour < 20 then
        vim.cmd.colorscheme("kanagawa-wave")
    else
        vim.cmd.colorscheme("kanagawa-dragon")
    end
end

autocmd('BufEnter', {
    group = KalseyGroup,
    callback = update_colorscheme,
})

local timer = vim.loop.new_timer()
timer:start(0, 60 * 60 * 1000, vim.schedule_wrap(function()
    update_colorscheme()
end))

autocmd('LspAttach', {
    group = KalseyGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>lz", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
