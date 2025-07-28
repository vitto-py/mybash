vim.lsp.config('pyright', {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_makers = { "pyrefly.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            }
        }
    }
})
