return {
	"folke/trouble.nvim",
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>",          desc = "Trouble" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
