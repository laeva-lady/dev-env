return {

    -- [[ {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    -- ]]},

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function ()
            require"alice.configs.null"
        end
    },

    "eandrju/cellular-automaton.nvim",
}

