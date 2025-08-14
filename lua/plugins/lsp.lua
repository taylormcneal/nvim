return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true, -- show diagnostic messages inline
            signs = true, -- show sings in sign column
            underline = true, -- underline problematic text
            update_in_insert = false, -- don't update diagnostics in insert mode
            severity_sort = true, -- sort by severity
            float = {
                border = "rounded", -- rounded border for floating windows
                header = "",
                prefix = "",
            }
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        lspconfig.lua_ls.setup{
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        lspconfig.pyright.setup{
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        }
    end,
}
