return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<cr>",            desc = "Terminal" },
		{ "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit" },
	},
	version = "*",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "curved",
			},
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		require("toggleterm").setup {
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			}
		}
	end
}
