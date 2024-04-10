local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- to learn the available actions
    -- see :help lsp-zero-keybindings
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
local lua_opts = lsp_zero.nvim_lua_ls()


local java_config = require("config.java")

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
        lsp_zero.default_setup,
        require("lspconfig").lua_ls.setup(lua_opts),
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
        }),
        require("lspconfig").jdtls.setup({ java_config }),
    },
})

-- here you can setup the language servers
