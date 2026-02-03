return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			"*", -- Apply to all files
			"!vim", -- Exclude vim files (optional)
		}, {
			mode = "background", -- Options: "foreground", "background", "virtualtext"
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- Disable "Name" colors like 'Blue' or 'Red' (prevents confusion)
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn

			-- Available modes for `mode`: foreground, background,  virtualtext
			-- "background" is the classic highlighter style.
		})
	end,
}
