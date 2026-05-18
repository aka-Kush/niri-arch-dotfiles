vim.pack.add({ "https://github.com/lambdalisue/vim-suda" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>ws",
	":w suda://%<CR>",
	{ noremap = true, silent = true, desc = "Write file with sudo" }
)
