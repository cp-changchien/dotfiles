local plugins = {
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },

    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
    },

    {
      "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
          local dap = require("dap")
          local dapui = require ("dapui")
          dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },

    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings("dap")
        end
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path ="~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        "kevinhwang91/nvim-bqf",
        event = "VeryLazy",
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        keys = {
            { "<leader>t", desc = "Trouble"},
            { "<leader>tX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics"},
            { "<leader>tx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics"},
            { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)"},
        },
        opts = {
            use_diagnostic_signs = true,
            action_keys = {
                close = { "q", "<esc>"},
                cancel = "<c-e>",
            },
        },
    },

    {
       'anufrievroman/vim-tex-kawaii',
        lazy = false,
        vim.api.nvim_set_keymap('n', 'z', 'za', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>lv', "<cmd>:!zathura %:r.pdf > /dev/null 2>&1 &<cr><cr>", { noremap = true, silent = true }),
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-interaction=nonstopmode",
                "-synctex=1",
                -- "-recorder"
            },
        }
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_imaps_enabled = 0
        vim.cmd[[if !exists("g:vim_window_id")
            let g:vim_window_id = system("xdotool getactivewindow")
            endif]]
        end,
    },

    {
        "nvim-neorg/neorg",
        build =":Neorg sync-parsers",
        lazy = false,
        dependencies = {"nvim-Lua/plenary.nvim"},
        config = function()
            require ("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.summary"] = {},
                    ["core.completion"] = {
                      config = {
                        engine = "nvim-cmp"
                      }
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/notes/work",
                                home = "~/notes/home",
                            }
                        }
                    }
                }
            }
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "debugpy",
            }
        }
    }
}

return plugins
