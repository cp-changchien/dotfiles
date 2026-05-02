require("actions-preview").setup({
    backend = { "telescope" },
    telescope = vim.tbl_extend('force', require("telescope.themes").get_dropdown(), {})
})