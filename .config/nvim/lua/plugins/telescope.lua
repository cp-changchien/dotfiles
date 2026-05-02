local map = vim.keymap.set
local telescope = require("telescope")

telescope.setup({
    defaults = {
        preview = { treesitter = false },
        sorting_strategy = "ascending",
        borderchars = { "", "", "", "", "", "", "", "" },
        path_display = { "smart" },
        layout_config = { height = 100, width = 400, prompt_position = "top", preview_cutoff=40 },
    },
})
telescope.load_extension("ui-select")
telescope.load_extension("env")

local builtin = require("telescope.builtin")

map({ "n" }, "<leader>g", builtin.builtin)
map({ "n" }, "<leader>sk", builtin.keymaps)
map({ "n" }, "<leader>se", "<cmd>Telescope env<cr>")
map({ "n" }, "<leader>sa", require("actions-preview").code_actions)

function git_files() builtin.find_files({ no_ignore = true }) end
map({ "n" }, "<leader>f", git_files)
