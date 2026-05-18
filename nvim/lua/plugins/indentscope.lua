vim.pack.add({
	"https://github.com/nvim-mini/mini.indentscope",
})

require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
})
