return {
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals_config = require("metals").bare_config()
            -- 1. Enforce SBT
            metals_config.settings = {
                metals = {
                    serverProperties = { "-Dmetals.build-tool=sbt" },
                },
            }
            metals_config.on_attach = function(client, bufnr)
                -- your on_attach function
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                -- LSP Basics
                -- map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                -- map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                -- map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                -- map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
                -- map("n", "gr", vim.lsp.buf.references, "Find references")

                -- Metals-specific
                -- map("n", "<leader>ws", metals.hover_worksheet, "Metals: Hover worksheet")
                -- map("n", "<leader>tt", metals.toggle_tree_view, "Metals: Toggle tree view")
                -- map("n", "<leader>st", metals.commands.server_commands(), "Metals: Server commands")

                -- Format
                map("n", "<leader>f", function()
                    vim.lsp.buf.format { async = true }
                end, "Format document")
            end

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    }
}
