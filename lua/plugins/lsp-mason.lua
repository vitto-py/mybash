return {
    {
        -- MASON is the package manager for LSP servers
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({})
        end
    },
    {
        -- here you start the server -> just add lspconfig."your lsp".setup({})
        -- also here is where keybindings go
        "neovim/nvim-lspconfig",
        config = function()
            -- from completions -> nvim-cmd-lsp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- the rest comes from nvim-lspconfig documentation
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities
            })
        end
    },
    {
        -- is the bridge between the other 2 + has nice functionalities
        -- MASON config has the function ensure_installed={}, we need it to ensure languages installed
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },

        config = function()
            -- mason is for the LSP
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "jdtls"}
            })
        end
    }
}
