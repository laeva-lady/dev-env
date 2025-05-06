-- TODO: Clean this mess and put my own keybinds
--      + add my custom function from lvim

vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "<leader>pv", vim.cmd.Ex)


set("n", ";", ":")
set("v", ";", ":")

set("n", "<C-s>", ":w<CR>")
set("v", "<C-s>", "<ESC>:w<CR>")
set("i", "<C-s>", "<ESC>:w<CR>i")

set("i", "<C-c>", "<Esc>")

set("n", "<leader>o", ":Files<CR>", { desc = "Open fzf" })
set("n", "<leader>f", vim.lsp.buf.format, { desc = "format" })

set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "make it rain" });

set("n", "<C-n>", ":bnext<CR>")
set("n", "<C-p>", ":bprev<CR>")
set("n", "<C-f>", ":bdelete<CR>")

set("n", "<C-o>", "<nop>")

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



vim.api.nvim_create_user_command("Seratchbuffer", ":e ~/scratch.md", { desc = "open scratch file" })
vim.api.nvim_create_user_command("Chatgptprompt", ":e ~/chatprompt.md", { desc = "open chatgpt file" })
vim.api.nvim_create_user_command("Todoprompt", ":e ~/todoAndNotes.md", { desc = "open todo file" })
vim.api.nvim_create_user_command(
    "Latexcompile",
    function()
        vim.cmd("write")
        vim.fn.system("lualatex " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
    end,
    {
        desc = "Compile current file with LuaLaTex",
    }
)
vim.api.nvim_create_user_command(
    "Okular",
    function(opts)
        -- Open the file using Okular with the provided argument
        local file = opts.args
        vim.fn.system("okular.exe " .. vim.fn.shellescape(file) .. " &")
    end,
    {
        desc = "Open file with Okular",
        nargs = 1,         -- Require one argument (the file name)
        complete = "file", -- Use file name completion
    }
)
vim.api.nvim_create_user_command(
    "Rscript",
    function(opts)
        -- Open the file using Okular with the provided argument
        local file = opts.args
        vim.fn.system("Rscript -e \"rmarkdown::render('" .. vim.fn.shellescape(file) .. "')")
    end,
    {
        desc = "Compile with Rscript -e",
        nargs = 1,         -- Require one argument (the file name)
        complete = "file", -- Use file name completion
    }
)
vim.api.nvim_create_user_command(
    "Sioyek",
    function(opts)
        -- Open the file using Okular with the provided argument
        local file = opts.args
        vim.fn.system("/mnt/c/dev/sioyek-release-windows/sioyek.exe " .. vim.fn.shellescape(file) .. " &")
    end,
    {
        desc = "Open file with Sioyek",
        nargs = 1,         -- Require one argument (the file name)
        complete = "file", -- Use file name completion
    }
)

