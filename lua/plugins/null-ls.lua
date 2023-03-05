return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local diagnostics = null_ls.builtins.diagnostics
		-- local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgres" }, -- change to your dialect
				}),
				diagnostics.protolint,
				diagnostics.hadolint,
				diagnostics.revive,
				null_ls.builtins.completion.spell,
			},
		})
	end,
}
