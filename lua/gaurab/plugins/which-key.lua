--what was the key for commenting
-- 	"folke/which-key.nvim",
-- 	event = "VeryLazy",
-- 	init = function()
-- 		vim.o.timeout = true
-- 		vim.o.timeoutlen = 1200
-- 	end,
-- 	opts = {
-- 		-- your configuration comes here
-- 		-- or leave it empty to use the default settings
-- 		-- refer to the configuration section below
-- 	},
-- }
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- 1. THE LAYOUT PRESET
		-- "helix" moves it to the right side (vertical list)
		-- "classic" is the default bottom panel
		-- "modern" is a floating window
		preset = "helix",

		-- 2. CUSTOMIZE THE WINDOW (Position & Size)
		win = {
			-- Width constraints (the "certain amount of space" you asked for)
			-- It will try to be between 20 and 50 characters wide.
			width = { min = 20, max = 50 },

			-- Optional: Add a border if you like
			border = "rounded",
		},

		-- 3. INTERFACE TWEAKS
		layout = {
			height = { min = 4, max = 25 }, -- Don't let it get too tall
			spacing = 3, -- Spacing between columns
			align = "center", -- Align the text
		},

		-- 4. FILTERING
		-- Hide specific keymaps if they clutter the list
		filter = function(mapping)
			-- Example: ignore mappings that don't have a description
			return mapping.desc and mapping.desc ~= ""
		end,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
