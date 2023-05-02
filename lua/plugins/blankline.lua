return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	config = function()
		vim.g.indent_blankline_filetype_exclude = { 'dashboard' }
	end
}
