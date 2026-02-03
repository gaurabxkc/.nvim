return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-n>", -- Select next (forward)
			["Find Subword Under"] = "<C-n>",
			["Find Prev"] = "<C-p>", -- Select previous (backward)
		}
	end,
}
