return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = false,
                show_close_icon = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        separator = true
                    }
                },
            }
        })
    end,
}
