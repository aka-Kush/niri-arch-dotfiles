vim.pack.add({
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/Saghen/blink.lib",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		list = {
			selection = { preselect = true, auto_insert = false },
		},
	},
	keymap = {
		preset = "default",
		["<Tab>"] = { "accept", "fallback" },
	},
})
