vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic keymaps
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qall<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Previous buffer" })

-- Buffer navigation
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Keep selection after indentation
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>tn", function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
