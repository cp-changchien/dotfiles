local map = vim.keymap.set

for i = 1, 8 do
    map({ "n", "t" }, "<leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

map({ "n" }, "<C-f>", "<Cmd>Open .<CR>", { desc = "Open current directory in Finder." })

map({ "n" }, "<leader>pc", require("plugins.utils").pack_clean, { desc = "Clean unused plugins" })
map({ "n" }, "<leader>o", "<cmd>Oil<CR>")
map({ "n" }, "<leader>sv", '<C-w>v', { desc = 'Split window vertically' })
map({ "n" }, "<leader>sh", '<C-w>s', { desc = 'Split window horisontally' })
map({ "n" }, "<leader>l", '<C-w>l', { desc = 'Move cursor to the right' })
map({ "n" }, '<leader>h', '<C-w>h', { desc = 'Move cursor to the left' })
map({ "n" }, '<leader>k', '<C-w>k', { desc = 'Move cursor to the top' })
map({ "n" }, '<leader>j', '<C-w>j', { desc = 'Move cursor to the bottom' })
map({ "n" }, '<leader>q', '<C-w>q', { desc = 'Close spplit' })
