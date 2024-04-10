require("code_runner").setup({
    filetype = {
        python = "python3 -u",
        rust = "cargo run"
    },
})

vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
