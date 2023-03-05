return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grwep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help" },
	},
	tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" },
}
