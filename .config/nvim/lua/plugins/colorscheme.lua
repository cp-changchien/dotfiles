require("vague").setup({ transparent = true })
vim.cmd('colorscheme vague')


local hl = vim.api.nvim_set_hl

-- Active statusline: light muted purple + white text
hl(0, "StatusLine", {
  fg = "#ffffff",
  bg = "#4a4256",  -- lighter pastel purple-grey
  bold = true,
})

hl(0, "StatusLineNC", {
  fg = "#9a9a9a",
  bg = "#1c1c1c",
})

-- Inactive tabs (lighter grey)
hl(0, "TabLine", {
  fg = "#b5b5b5",
  bg = "#2a2a2a",
})

-- Active tab (light grey background, black text)
hl(0, "TabLineSel", {
  fg = "#000000",
  bg = "#e6e6e6",
  bold = true,
})

-- Fill area (slightly lighter dark grey)
hl(0, "TabLineFill", {
  bg = "#232323",
})
