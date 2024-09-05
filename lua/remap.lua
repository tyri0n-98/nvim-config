vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>l", "$")
vim.keymap.set("n", "<leader>h", "^")
vim.keymap.set("v", "<leader>l", "$")
vim.keymap.set("v", "<leader>h", "^")
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<C-n>", ":bnext<CR>")
vim.keymap.set("n", "<C-p>", ":bprev<CR>")
-- vim.keymap.set("n", "vaa", "ggVG")
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "<C-_>", "gc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<leader>d", ":bd<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Window Related mappings
vim.api.nvim_set_keymap("n", "<A-l>", ":vertical resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", ":vertical resize -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":resize -5<CR>", { noremap = true })

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

vim.keymap.set("n", "<M-CR>", ":lua vim.lsp.buf.code_action()<CR>")

-- Quickfix list mappings
local toggle_qf = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists then
        vim.cmd("cclose")
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd("copen")
    else
        print("Quickfix list empty")
    end
end

vim.keymap.set("n", "<C-q>q", toggle_qf)
vim.keymap.set("n", "<C-q>n", ":cnext<CR>")
vim.keymap.set("n", "<C-q>p", ":cprev<CR>")
