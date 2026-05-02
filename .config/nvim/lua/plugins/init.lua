vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/chentoast/marks.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter",   version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/aznhe21/actions-preview.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim",     version = "0.1.8" },
    { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/LinArcX/telescope-env.nvim" },
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/julianolf/nvim-dap-lldb" },
    { src = "https://github.com/nvim-neotest/nvim-nio" }
})

-- Load individual plugins
require("plugins.marks")
require("plugins.oil")
require("plugins.telescope")
require("plugins.actions-preview")
require("plugins.colorscheme")
require "mason".setup()
