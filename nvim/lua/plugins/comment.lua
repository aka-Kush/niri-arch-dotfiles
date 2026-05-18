vim.pack.add({
	"https://github.com/numToStr/Comment.nvim",
})

require("Comment").setup({
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gcA",
	},
})
