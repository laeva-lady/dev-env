-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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

vim.opt.colorcolumn = "80"


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











