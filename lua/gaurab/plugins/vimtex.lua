return {
	"lervag/vimtex",
	lazy = false, -- We want this loaded immediately for file detection
	init = function()
		-- 1. PDF Viewer Method
		-- For Windows (SumatraPDF is best):
		-- vim.g.vimtex_view_general_viewer = 'SumatraPDF'

		-- For Linux (Zathura is best):
		vim.g.vimtex_view_method = "zathura"

		-- 2. Compiler Method (latexmk is standard)
		vim.g.vimtex_compiler_method = "latexmk"

		-- 3. PDF Viewer Integration (Reverse Search)
		-- This allows you to Ctrl+Click in the PDF to jump back to code
		vim.g.vimtex_quickfix_mode = 0
	end,
}
