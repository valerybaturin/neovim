return {
	"windwp/nvim-autopairs",
	event = "CmdlineEnter",
	config = function()
		require("nvim-autopairs").setup {}
	end
}
