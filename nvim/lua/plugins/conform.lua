vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({

	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		["_"] = { "prettier" },
	},
	format_on_save = true,
})
