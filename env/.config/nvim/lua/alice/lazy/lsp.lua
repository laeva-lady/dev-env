return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim"
    },

    config = function()
        require("alice.configs.gopls")
        require("alice.configs.sharp")
        require("alice.configs.html")
        require("alice.configs.pyright")
        require("conform").setup({
            formatters_by_ft = {}
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tinymist",
                "pyright",
                "ts_ls",
                "bashls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["ts_ls"] = function()
                    require "lspconfig".ts_ls.setup {
                        cmd = { 'typescript-language-server', '--stdio' }
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern({ "init.lua", "main.lua", "*.rockspec" }),
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "Lua 5.1"
                                },
                                diagnostics = {
                                    globals = {
                                        "bit", "vim", "it", "describe", "before_each", "after_each", "love",
                                        "lovr"
                                    }
                                },
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = {
            behavior = cmp.SelectBehavior.Select
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
                ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({
                    select = true
                }),
                ["<C-Space>"] = cmp.mapping.complete()
            }),
            sources = cmp.config.sources({ {
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            } -- For luasnip users.
            }, { {
                name = 'buffer'
            } })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = ""
            }
        })
    end
}
