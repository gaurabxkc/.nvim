return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000, -- Load early to override default diagnostics
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern", -- Options: "modern", "classic", "minimal", "ghost"

			options = {
				show_source = true, -- Show "Pyright", "Eslint", etc.
				use_icons_from_diagnostic = true,
				multilines = true, -- Allow long errors to wrap (optional)
			},

			-- Vesper-friendly colors (Optional: It usually auto-detects)
			-- If it looks weird, the plugin auto-blends colors for you.
		})

		-- DISABLE standard virtual text so you don't see TWO errors
		vim.diagnostic.config({
			virtual_text = false, -- Disable the default ugly text
		})
	end,
}
