vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        }
    }
})

-- Now enable the servers
vim.lsp.enable({ "lua_ls", "clangd", "matlab_ls" })
