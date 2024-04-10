require("nightfox").setup({
    options = {
        transparent = false
    }
})

require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        cmp = true,
        treesitter = true,
        nvimtree = true,

    }
})

vim.cmd("colorscheme carbonfox")
-- vim.cmd("colorscheme catppuccin")
