local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>f', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
