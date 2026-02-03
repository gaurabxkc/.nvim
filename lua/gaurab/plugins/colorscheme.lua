return {
	-- 1. TOKYO NIGHT (The Default Fallback)
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
				},
			})
		end,
	},

	-- 2. VESPER (With the Deprecation Fix)
	{
		"datsfilipe/vesper.nvim",
		lazy = false,
		config = function()
			require("vesper").setup({
				transparent = false,
				italics = {
					comments = true,
					keywords = true,
					functions = true,
				},
			})

			-- FIXED: Replaced get_active_clients() with get_clients()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "vesper",
				callback = function()
					-- Use the new API to avoid the warning
					for _, client in ipairs(vim.lsp.get_clients()) do
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})
		end,
	},

	-- 3. CATPPUCCIN
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({ flavour = "mocha" })
		end,
	},

	-- 4. GRUVBOX MATERIAL
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_enable_italic = 1
		end,
	},

	-- 5. THEME PERSISTENCE ENGINE (VS Code Style)
	{
		"Custom/ThemePersistence",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 900,
		config = function()
			local theme_file = vim.fn.stdpath("data") .. "/last_theme.txt"

			-- Save theme on change
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					local current_theme = vim.g.colors_name
					if current_theme then
						local file = io.open(theme_file, "w")
						if file then
							file:write(current_theme)
							file:close()
						end
					end
				end,
			})

			-- Restore theme on startup
			local file = io.open(theme_file, "r")
			if file then
				local saved_theme = file:read("*all")
				file:close()
				-- Trim whitespace (just in case)
				saved_theme = saved_theme:gsub("%s+", "")

				local ok, _ = pcall(vim.cmd.colorscheme, saved_theme)
				if not ok then
					vim.cmd.colorscheme("tokyonight")
				end
			else
				vim.cmd.colorscheme("tokyonight")
			end
		end,
	},
}
