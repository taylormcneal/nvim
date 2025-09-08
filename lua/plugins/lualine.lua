return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true,
            },
            sections = {
                lualine_c = {
                    {
                        'buffers',
                        symbols = {
                          alternate_file = '', -- remove the '#'
                          modified = ' ●',
                          directory =  '',
                        },
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
