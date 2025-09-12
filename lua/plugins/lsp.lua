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

        lspconfig.intelephense.setup{
            capabilities = capabilities,
            filetypes = { "php", "blade" },
            init_options = {
                globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense"
            },
            settings = {
                intelephense = {
                    files = {
                        maxSize = 5000000,
                        exclude = { "**/vendor/**/", "**/node_modules/**/" },
                    },
                    environment = {
                        includePaths = { "vendor" },
                    },
                    -- common stubs to improve completion/diagnostics
                    stubs = { "apache", "bcmath", "Core", "date", "dom", "json", "pcre", "PDO", "session", "SPL", "standard" },
                },
            },
        }

        lspconfig.html.setup {
            capabilities = capabilities,
            filetypes = { "html", "blade" },
        }

        lspconfig.cssls.setup {
            capabilities = capabilities,
        }

        lspconfig.ts_ls.setup {
            capabilities = capabilities,
        }
    end,
}
