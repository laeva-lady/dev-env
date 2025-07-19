vim.opt.clipboard = "unnamedplus"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25


vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

local augroup = vim.api.nvim_create_augroup
local KalseyGroup = augroup('kalsey', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

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

autocmd({"BufWritePre"}, {
    group = KalseyGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

set("n", "<leader>pv", ":NvimTreeToggle<CR>")
set("n", "<leader>e", ":NvimTreeFocus<CR>")

set("n", "<leader>hf", ":%!stylish-haskell<CR>")

set({ "n", "v" }, ";", ":")

set({ "n", "v", "i" }, "<C-s>", "<ESC>:w<CR>")

set("i", "<C-u>", "<Esc>")

set("n", "<C-f>", ":Files<CR>", { desc = "Open fzf" })
set("n", "<leader>f", vim.lsp.buf.format, { desc = "format" })

set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "make it rain" });

-- set("n", "<C-n>", ":bnext<CR>")
-- set("n", "<C-p>", ":bprev<CR>")
-- set("n", "<C-c>", ":bdelete<CR>")

set("n", "<C-o>", "<nop>")

set("n", "<leader>\\", ":ToggleTerm<CR>")

set("n", "<leader>mv", ":Markview<CR>")

-- commands related to functions
--
local function removeRN()
    vim.cmd([[%s/\r//g]])
end
local function selectALL()
    vim.cmd([[normal! ggVG]])
end

set("n", "<leader>re", removeRN)
set("n", "<leader>sa", selectALL)
set("n", "<leader>spq", "vapgq")
set("n", "<leader>mk", ":make<CR>")
set("n", "<leader>ch", ":e ~/chat.md<CR>")



vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "ocaml", "cpp", "cc" }, -- or any filetype
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
    end,
})

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{,}"
vim.opt.foldlevelstart = 99

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"


vim.opt.list = true
vim.opt.listchars:append("space:·")
-- vim.opt.listchars:append("nbsp:␣")
-- vim.opt.listchars:append("rail:~")
-- vim.opt.listchars:append("ol:↴")
-- vim.opt.listchars:append("xtends:>")
-- vim.opt.listchars:append("recedes:<")
-- vim.opt.listchars:append("zws:⭲ ")

vim.opt.ignorecase = true
vim.opt.smartcase = true
