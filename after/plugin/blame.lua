require('blame').setup({
	format = function(blame)
		return string.format("%s %s %s", blame.author, blame.date, blame.summary)
	end,
})

vim.keymap.set("n", "<leader>a", ":BlameToggle <CR>")
