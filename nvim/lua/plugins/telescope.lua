vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "^.git/", "node_modules/", "dist/", "build/", "/home/kush/go/" },
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
				n = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({ hidden = true, search_dirs = { vim.loop.cwd() } })
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").find_files({ hidden = true, cwd = "/" })
end, { desc = "Find hidden files" })

vim.keymap.set("n", "<leader>fr", function()
	require("telescope.builtin").find_files({ hidden = true, cwd = "/" })
end, { desc = "Find from root" })

vim.keymap.set("n", "<leader>fd", function()
	require("telescope.builtin").find_files({ hidden = true, cwd = "~/.config/" })
end, { desc = "Find dotfiles" })

vim.keymap.set("n", "<leader>fv", function()
	require("telescope.builtin").find_files({ hidden = true, cwd = "~/.config/nvim" })
end, { desc = "Find nvim dots" })

vim.keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h"), hidden = true })
end, { noremap = true, silent = true, desc = "Find in current dir" })

vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Recent files" })

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")
