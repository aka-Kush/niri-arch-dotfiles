vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true, desc = "Git status" })
vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true, desc = "Git commit" })
vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true, desc = "Git push" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>ga",
	":Git add --all<CR>",
	{ noremap = true, silent = true, desc = "Git add all" }
)
