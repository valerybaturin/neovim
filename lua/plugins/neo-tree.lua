return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "v2.x",
	keys = {
		{ "<leader>e", "<cmd>NeoTreeFloatToggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 50,
			},
			filesystem = {
				filtered_items = {
					visible = true, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						".git",
					},
				}
			}
		})
	end,
}
