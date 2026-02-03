return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- <--- FORCE LOAD IMMEDIATELY (Fixes the "module not found" error)
	priority = 1000, -- Ensure it loads before other plugins
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- Protective check: if the module can't be found, don't crash the editor
		local status, treesitter = pcall(require, "nvim-treesitter.configs")
		if not status then
			return
		end

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"bash",
				"c",
				"python",
			},
			sync_install = false,
			auto_install = true,
		})
	end,
}
