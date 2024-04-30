local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- to learn the available actions
    -- see :help lsp-zero-keybindings
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
local lua_opts = lsp_zero.nvim_lua_ls()

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp",
        "jdtls",
        "helm_ls",
        "jsonls",
        "clangd",
        "bashls",
        "dockerls",
        "eslint",
        "lua_ls",
        "rust_analyzer",
    },
    handlers = {
        function(server_name)
            if server_name ~= "jdtls" then
                require("lspconfig")[server_name].setup({})
            end
        end,
        lua_ls = function()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
        rust_analyzer = function()
            require("lspconfig").rust_analyzer.setup({
                settings = {
                    ["rust_analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        diagnostics = {
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                    },
                },
            })
        end,
    },
})

-- here you can setup the language servers
