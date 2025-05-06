require("alice")

-- system clipboard by default
vim.opt.clipboard = "unnamedplus"

vim.env.GOPATH = "/usr/local/go/bin/go"
vim.env.GOBIN = "/usr/local/go/bin/"



vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.typst", -- Match *.typst files
  callback = function()
    -- Replace the command below with what you want to run
    vim.cmd("make")
  end,
})
