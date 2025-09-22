vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
        require("nvim-tree").setup({
            tab = {
                sync = {
                    open = true,
                    close = false,
                },
            },
            filter = {
                dotfiles = false,
            },
        })

        vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle project view" })
        vim.keymap.set("n", "<leader>po", "<C-w>w", { desc = "Go to next window" })
    end,
}

