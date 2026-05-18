vim.pack.add({
	"https://github.com/folke/trouble.nvim",
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
	virtual_text = { current_line = true },
	underline = true,
	update_in_insert = false,
})

require("trouble").setup()

vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { silent = true, desc = "Diagnostics" })
vim.keymap.set(
	"n",
	"<leader>xb",
	":Trouble diagnostics toggle filter.buf=0<CR>",
	{ silent = true, desc = "Buffer diagnostics" }
)
vim.keymap.set("n", "<leader>xl", ":Trouble loclist toggle<CR>", { silent = true, desc = "Location list" })
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle<CR>", { silent = true, desc = "Quickfix list" })
