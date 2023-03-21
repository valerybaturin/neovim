local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufWritePre", {
	pattern = { "*.lua" },
	callback = function()
		vim.lsp.buf.format({ async = true })
	end
})

local format_sync_grp = augroup("GoImport", {})
autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})

-- autocmd('BufWritePre', {
-- 	pattern = '*.go',
-- 	callback = function()
-- 		vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
-- 	end
-- })

-- Trim White Space
local TrimWhiteSpaceGrp = augroup('TrimWhiteSpaceGrp', {})
autocmd('BufWritePre', {
	group = TrimWhiteSpaceGrp,
	pattern = '*',
	command = '%s/\\s\\+$//e',
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
