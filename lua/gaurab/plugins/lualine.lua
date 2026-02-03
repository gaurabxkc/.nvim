return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- 1. DEFINE YOUR CUSTOM VESPER THEME
		-- We keep your exact colors, but we don't apply them yet.
		local colors = {
			bg = "#101010",
			fg = "#FFFFFF",
			yellow = "#FFC799",
			cyan = "#A0E1E1",
			darkblue = "#505050",
			green = "#99FFE4",
			orange = "#FF9940",
			violet = "#D0A9E5",
			magenta = "#E5A9A9",
			blue = "#85B5FF",
			red = "#FF8080",
		}

		local vesper_lualine_theme = {
			normal = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.bg, fg = colors.darkblue, gui = "bold" },
				b = { bg = colors.bg, fg = colors.darkblue },
				c = { bg = colors.bg, fg = colors.darkblue },
			},
		}

		-- 2. THE TRICK: INJECT IT SO 'AUTO' CAN FIND IT
		-- This tells Lua: "If anyone asks for 'lualine.themes.vesper', give them this table."
		package.loaded["lualine.themes.vesper"] = vesper_lualine_theme

		-- 3. CONFIGURE LUALINE WITH 'AUTO'
		lualine.setup({
			options = {
				-- 'auto' will now find 'vesper' (our injection) OR 'tokyonight' (built-in) automatically
				theme = "auto",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.orange },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
