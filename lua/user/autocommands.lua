local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = { "*.go" },
  -- command = "GoImport",
  callback = function()
    require("go.format").goimport()
  end
})

-- autocmd("BufWritePre", {
--   pattern = { "*.sql" },
--   command = '%! pg_format -f 2 -u 2 -L -i'
-- })

autocmd("BufWritePre", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end
})

-- Trim White Space
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup('TrimWhiteSpaceGrp', {})
autocmd('BufWritePre', {
  group = TrimWhiteSpaceGrp,
  pattern = '*',
  command = '%s/\\s\\+$//e',
})
