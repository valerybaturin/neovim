return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local diagnostics = null_ls.builtins.diagnostics
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				diagnostics.protolint,
				diagnostics.hadolint,
				diagnostics.checkmake,
				-- diagnostics.golangci_lint,
				diagnostics.markdownlint,
				diagnostics.yamllint,
				formatting.codespell,
				formatting.pg_format,
				formatting.npm_groovy_lint,
			},
		})
	end,
}
