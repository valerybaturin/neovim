return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = { "go", "lua", "vim", "sql" },
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "help" }, -- list of language that will be disabled
			},
			autopairs = {
				enable = true,
			},
		}
	end
}
