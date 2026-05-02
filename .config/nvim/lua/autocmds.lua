-- Treesitter on specific filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'lua', 'c', 'cpp' },
    callback = function()
        vim.treesitter.start()
    end,
})

-- LSP Attach
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})
