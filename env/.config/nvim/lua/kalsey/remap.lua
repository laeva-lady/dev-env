-- TODO: Clean this mess and put my own keybinds
--      + add my custom function from lvim

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
