local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = { "*.lua" },
	callback = function()
		vim.lsp.buf.format({ async = true })
	end
})

autocmd('BufWritePre', {
	pattern = '*.go',
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
	end
})

-- Trim White Space
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup('TrimWhiteSpaceGrp', {})
autocmd('BufWritePre', {
	group = TrimWhiteSpaceGrp,
	pattern = '*',
	command = '%s/\\s\\+$//e',
})
