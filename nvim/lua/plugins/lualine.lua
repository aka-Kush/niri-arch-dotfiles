vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local M = {}

function M.setup()
	local ok, lualine = pcall(require, "lualine")
	if not ok then
		return
	end

	lualine.setup({
		options = {
			theme = "base16",
			section_separators = "",
			component_separators = "",
			globalstatus = true,
		},
	})
end

return M
