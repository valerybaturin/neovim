return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				always_show_bufferline = false,
				diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
				diagnostics_update_in_insert = true,
				mode = "buffers",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center"
					}
				},
			}
		})
	end
}
