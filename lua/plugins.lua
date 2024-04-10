vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    -- use({
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     after = "nvim-treesitter"
    -- })

    use("tpope/vim-commentary")
    use("tpope/vim-surround")
    use("romainl/vim-cool")

    use("christoomey/vim-tmux-navigator")

    use("machakann/vim-highlightedyank")
    use("tpope/vim-repeat")

    use("EdenEast/nightfox.nvim")
    use{ "catppuccin/nvim", as = "catppuccin" }
    use("lewis6991/gitsigns.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")
    use("nvim-lua/lsp-status.nvim")
    use("lambdalisue/suda.vim")

    use("nvim-lualine/lualine.nvim")

    use("nvim-lua/plenary.nvim")

    use("CRAG666/code_runner.nvim")

    -- auto closing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    use("szw/vim-maximizer")

    use("okuuva/auto-save.nvim")

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
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
    })
end)
