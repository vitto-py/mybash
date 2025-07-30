return {
    {"nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- Optional image support for file preview: See `# Preview Mode` for more information.
            -- {"3rd/image.nvim", opts = {}},
            -- OR use snacks.nvim's image module:
            -- "folke/snacks.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        config = function() 
            vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left toggle<CR>', { desc = "Toggle Neo-tree" })
            vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "go to windows left" })
            vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "go to windows right" })
        end
    }
}
