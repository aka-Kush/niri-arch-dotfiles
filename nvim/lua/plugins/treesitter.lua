vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup({
	ensure_installed = {
		"c",
		"cpp",
		"fish",
		"go",
		"html",
		"java",
		"json",
		"nix",
		"xml",
		"typescript",
		"lua",
		"vim",
		"markdown",
		"python",
		"javascript",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
