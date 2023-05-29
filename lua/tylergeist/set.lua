vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true

vim.opt.smartindent = true
-- test this no wrapping
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "20"

vim.g.mapleader = " "

-- Theme style

require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true,
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
	},
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	},
})

require("rose-pine").setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "moon",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		background_nc = "_experimental_nc",
		panel = "surface",
		panel_nc = "base",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = "rose" },

		-- Blend colours against the "base" background
		CursorLine = { bg = "foam", blend = 10 },
		StatusLine = { fg = "love", bg = "love", blend = 10 },
	},
})

vim.cmd("colorscheme rose-pine")
-- show barbecue globally

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		relativenumber = true,
		number = true,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require("Comment").setup()
require("autoclose").setup()
require("lualine").setup()
require("colorizer").setup({
	mode = "foreground",
	css = true,
	names = true,
	RRGGBBAA = true,
})
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
require("barbecue").setup()
require("xbase").setup(
	-- NOTE: Defaults
	{
		--- Log level. Set it to ERROR to ignore everything
		log_level = vim.log.levels.DEBUG,
		--- Options to be passed to lspconfig.nvim's sourcekit setup function.
		--- Usually empty map is sufficient, However, it is strongly recommended to use on_attach key to setup custom mapppings
		sourcekit = {}, --- Set it to nil to skip lspconfig's sourcekit setup
		--- Statusline provider configurations
		statusline = {
			watching = { icon = "", color = "#1abc9c" },
			device_running = { icon = "", color = "#4a6edb" },
			success = { icon = "", color = "#1abc9c" },
			failure = { icon = "", color = "#db4b4b" },
		},
		--- Simulators to only include.
		--- run `xcrun simctl list` to get a full list of available simulator
		--- If the list is empty then all simulator available  will be included
		simctl = {
			iOS = {
				-- "iPhone 13 Pro", --- only use this devices
			},
			watchOS = {}, -- all available devices
			tvOS = {}, -- all available devices
		},
		--- Log buffer configurations
		log_buffer = {
			--- Whether toggling the buffer should auto focus to it?
			focus = true,
			--- Split Log buffer height
			height = 20,
			--- Vsplit Log buffer width
			width = 75,
			--- Default log buffer direction: { "horizontal", "vertical" }
			default_direction = "horizontal",
		},
		--- Mappings
		mappings = {
			--- Whether xbase mapping should be disabled.
			enable = true,
			--- Open build picker. showing targets and configuration.
			build_picker = "<leader>pb", --- set to 0 to disable
			--- Open run picker. showing targets, devices and configuration
			run_picker = "<leader>pr", --- set to 0 to disable
			--- Open watch picker. showing run or build, targets, devices and configuration
			watch_picker = "<leader>pw", --- set to 0 to disable
			--- A list of all the previous pickers
			all_picker = "<leader>pa", --- set to 0 to disable
			--- horizontal toggle log buffer
			toggle_split_log_buffer = "<leader>ls",
			--- vertical toggle log buffer
			toggle_vsplit_log_buffer = "<leader>lv",
		},
	}
)
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git", "dist", "ios", "android" },
	},
})
