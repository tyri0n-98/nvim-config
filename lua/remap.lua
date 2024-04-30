vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>l", "$")
vim.keymap.set("n", "<leader>h", "^")
vim.keymap.set("v", "<leader>l", "$")
vim.keymap.set("v", "<leader>h", "^")
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<C-n>", ":bnext<CR>")
vim.keymap.set("n", "<C-p>", ":bprev<CR>")
vim.keymap.set("n", "vaa", "ggVG")
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

-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Options settings
