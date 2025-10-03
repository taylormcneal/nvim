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

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config["lua_ls"] = {
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

        vim.lsp.config["pyright"] = {
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

        vim.lsp.config["clangd"] = {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",
                "--clangd-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
            },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        }

        vim.lsp.config["intelephense"] = {
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

        vim.lsp.config["html"] = {
            capabilities = capabilities,
            filetypes = { "html", "blade" },
        }

        vim.lsp.config["cssls"] = {
            capabilities = capabilities,
        }

        vim.lsp.config["ts_ls"] = {
            capabilities = capabilities,
        }

        -- Enable LSP servers
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("clangd")
        vim.lsp.enable("intelephense")
        vim.lsp.enable("html")
        vim.lsp.enable("cssls")
        vim.lsp.enable("ts_ls")
    end,
}
