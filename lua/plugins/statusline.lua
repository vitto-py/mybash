return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- configuration
        config = function()
            require('lualine').setup({
                options = {theme = 'powerline_dark'}
            })
        end
    }
}
