local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        -- or                            , branch = '0.1.x',
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
     {
         "nvim-treesitter/nvim-treesitter-textobjects",
         dependencies = { "nvim-treesitter" }
     },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
            rocks = { "lua-curl" },
        },
    },
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "romainl/vim-cool",

    "christoomey/vim-tmux-navigator",

    "machakann/vim-highlightedyank",
    "tpope/vim-repeat",

    "EdenEast/nightfox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },

    -- git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "FabijanZulj/blame.nvim",

    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "nvim-lua/lsp-status.nvim",
    "lambdalisue/suda.vim",

    "nvim-lualine/lualine.nvim",

    "nvim-lua/plenary.nvim",

    "CRAG666/code_runner.nvim",

    -- auto closing
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    "szw/vim-maximizer",

    "okuuva/auto-save.nvim",

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/vim-vsnip" },
            { "L3MON4D3/LuaSnip" },
            { "mhartington/formatter.nvim" },
        },
    },
})
