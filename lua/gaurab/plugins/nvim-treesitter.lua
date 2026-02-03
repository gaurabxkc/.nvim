return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 2, -- Limit to 2 lines of sticky context
			trim_scope = "outer",
		})
	end,
}
