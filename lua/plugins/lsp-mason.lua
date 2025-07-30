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
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})

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
