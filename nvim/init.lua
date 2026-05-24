------------------------- OPTIONS ------------------------- 

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("vim._core.ui2").enable({})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.o.autochdir = true
vim.o.winborder = "rounded"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.colorcolumn = "0"
vim.opt.guicursor = ""

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.timeoutlen = 500
vim.opt.updatetime = 300
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")

vim.g.netrw_banner = 0

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from clipboard" })
vim.keymap.set("t", "<C-w>t", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "<C-w>t", ":terminal<CR>", { noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>so", ":update<CR>:source<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

--- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

--- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

--- pack clean
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end
vim.keymap.set("n", "<leader>pc", pack_clean)

--- pack update
vim.api.nvim_create_user_command("PackUpdate", function(opts)
	-- checks if any argument is passed
    if opts.args:match("%S") then
        -- update specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
		-- update only specified plugins
        vim.pack.update(plugins)
    else
        -- update all
        vim.pack.update()
    end
end, { nargs = "*", desc = "Update all plugins or specific ones" })

------------------------- PLUGINS ------------------------- 

--- Base16 Colorscheme
vim.pack.add({
	"https://github.com/RRethy/base16-nvim",
})
vim.cmd.colorscheme("base16-nord")

--- plenary
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
})

--- icons
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
})

---oil
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	keymaps = {
		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["<C-v>"] = { "actions.select", opts = { horizontal = true } },
		["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
	},
})
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

--- snacks picker (+ zen, image support)
vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	picker = {},
	input = {},
	notifier = {
		timeout = 3000,
	},
	terminal = {},
	lazygit = {},
    zen = {
    toggles = {
      dim = true,
      git_signs = false,
      mini_diff_signs = false,
      diagnostics = false,
      inlay_hints = false,
    },
    show = {
      statusline = false,
      tabline = false,
    },
  },
  image = {
    enabled = true,
    doc = {
      enabled = true,
      inline = true,
      float = true,
      max_width = 80,
      max_height = 40,
    },
  },
})

vim.keymap.set("n", "<leader>fF", function()
	Snacks.picker.files({ cwd = "~", hidden = true })
end, { desc = "Find files root" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files({ hidden = true })
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.grep({ hidden = true })
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>xx", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics buffer" })
vim.keymap.set("n", "<leader>xX", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics all" })
vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Help" })
vim.keymap.set("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Zen mode" })
vim.keymap.set("n", "<leader>is", function() Snacks.image.hover() end, { desc = "Image hover" })

--- Tree sitter
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})
ensure_installed = {
	-- neovim/lua
	"lua",
	"vim",
	"vimdoc",
	"query",
	-- markdown
	"markdown",
	"markdown_inline",
	-- devops
	"bash",
	"dockerfile",
	"yaml",
	"terraform",
	"hcl",
	"toml",
	"json",
	-- mern
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"scss",
	"graphql",
	-- python
	"python",
	"requirements",
	-- sql
	"sql",
}
require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})

--- Lualine
vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			statusline = { "minifiles", "snacks_picker_input" },
			winbar = {},
		},
	},
})

--- Bufferline
vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		show_buffer_close_icons = false,
		show_close_icon = false,
		offsets = {
			{
				filetype = "minifiles",
				text = "Files",
				separator = true,
			},
		},
	},
})
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete other buffers" })

--- Mini cmdline
vim.pack.add({ "https://github.com/nvim-mini/mini.cmdline" })
require("mini.cmdline").setup({
	autocorrect = { enable = false },
})

--- Mini surround
vim.pack.add({ "https://github.com/nvim-mini/mini.surround" })
require("mini.surround").setup()

--- Mini completion
vim.pack.add({
	"https://github.com/nvim-mini/mini.completion",
})
require("mini.completion").setup({
	lsp_completion = {
		auto_setup = true,
	},
})

--- Mini snippets + friendly snippets
vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvim-mini/mini.snippets",
})
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
	snippets = {
		MiniSnippets.gen_loader.from_lang(),
	},
})
MiniSnippets.start_lsp_server({ match = false })

--- Mason
vim.pack.add({
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"luacheck",
	},
})

--- LSP
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto definition" })
vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto declaration" })
vim.keymap.set("n", "gi", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto implementation" })
vim.keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
})

--- mini diff and snacks lazygit
vim.pack.add({
	"https://github.com/nvim-mini/mini.diff",
})
local MiniDiff = require("mini.diff")
MiniDiff.setup({
	source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

--- mini pairs
vim.pack.add({
	"https://github.com/nvim-mini/mini.pairs",
})
require("mini.pairs").setup()

--- mini comment
vim.pack.add({
	"https://github.com/nvim-mini/mini.comment",
})
require("mini.comment").setup()

--- fidget
vim.pack.add({
	"https://github.com/j-hui/fidget.nvim",
})

require("fidget").setup()

--- flash
vim.pack.add({
	"https://github.com/folke/flash.nvim",
})

require("flash").setup({
	vim.keymap.set({ "n", "x", "o" }, "<c-s>", function()
		require("flash").jump()
	end, { desc = "Flash" }),
})

--- harpoon
vim.pack.add({
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = "harpoon2",
  },
})
local harpoon = require("harpoon")
harpoon:setup()
local function harpoon_picker()
  local list = harpoon:list()
  local items = {}
  for i, item in ipairs(list.items) do
    table.insert(items, {
      idx = i,
      text = item.value,
      file = item.value,
    })
  end
  Snacks.picker.pick({
    title = "Harpoon",
    items = items,
    format = "file",
    confirm = function(picker, item)
      picker:close()
      if item then
        list:select(item.idx)
      end
    end,
  })
end
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>h", harpoon_picker, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Harpoon file 6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Harpoon file 7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Harpoon file 8" })
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next" })

--- indent scope
vim.pack.add({
	"https://github.com/nvim-mini/mini.indentscope",
})
require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
})

--- rainbow delimiters
vim.pack.add({ "https://github.com/HiPhish/rainbow-delimiters.nvim" })

--- render markdown
vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
require("render-markdown").setup({})

--- smear cursor
vim.pack.add({ "https://github.com/sphamba/smear-cursor.nvim" })
require("smear_cursor").setup({
  stiffness = 0.5,
  trailing_stiffness = 0.5,
  matrix_pixel_threshold = 0.5,
})

--- vim sudo
vim.pack.add({ "https://github.com/lambdalisue/vim-suda" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>ws",
	":w suda://%<CR>",
	{ noremap = true, silent = true, desc = "Write file with sudo" }
)
