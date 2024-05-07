local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        -- { name = "buffer" },
        { name = "path" },
        -- { name = "vsnip" },
        { name = "calc" },
    },
    mapping = {
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = "insert" })
            else
                cmp.complete()
            end
        end),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = "insert" })
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            -- require("luasnip").lsp_expand(args.body)
            vim.fn[ "vsnip#anonymous" ](args.body)
        end,
    },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
