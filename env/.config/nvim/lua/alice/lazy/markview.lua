return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        config = function ()
            require"markview".setup({
                preview = {
                    enable = false
                },
                experimental = {
                    check_rtp_message = false
                }
            })
        end
    },
}
