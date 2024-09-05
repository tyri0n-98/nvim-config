require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    vnsure_installed = {
        "javascript",
        "typescript",
        "python",
        "json",
        "java",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "toml",
        "xml",
        "http",
        "graphql",
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autotag = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["a="] = "@assignment.outer",
                ["i="] = "@assignment.inner",
                ["r="] = "@assignment.rhs",
                ["l="] = "@assignment.lhs",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@scope.outer",
                ["ib"] = "@block.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
            selection_modes = {
                ["@block.inner"] = "v",
                ["@class.inner"] = "v",
                ["@class.outer"] = "V",
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@conditional.outer"] = "V",
                ["@conditional.inner"] = "V",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sw"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>Sw"] = "@parameter.inner",
            },
        },
    },
})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

vim.keymap.set({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_opposite)

vim.filetype.add({
    extension = {
        lox = "lox",
    },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- LOX parser

local lox_path = "/home/michalchrzanowski/treesitter/tree-sitter-lox";


parser_config.lox = {
    install_info = {
        url = lox_path,
        files = { "src/parser.c" },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
    filetype = "lox",
}

local nvim_config_path = "/home/michalchrzanowski/.config/nvim"

vim.api.nvim_create_user_command("LoxReload", function ()
    vim.cmd("TSUninstall lox")
    vim.fn.mkdir(nvim_config_path .. "/queries/lox", "p")
    local cmd = "cp -f " .. lox_path .. "/queries/highlights.scm " .. nvim_config_path .. "/queries/lox/"
    print(cmd)
    os.execute(cmd)
    vim.cmd("TSInstall lox")
end, { nargs = 0 })
