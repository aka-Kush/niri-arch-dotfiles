vim.pack.add({
	"https://github.com/norcalli/nvim-colorizer.lua",
})

require("colorizer").setup({
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		names = false,
		RRGGBBAA = true,
		css = true,
		css_fn = true,
	},
	filetypes = { "*" },
})
