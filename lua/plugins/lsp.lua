return {
	'williamboman/mason.nvim',
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig'
	},
	config = function()
		require("mason").setup()

		-- Diagnostic icons in the gutter
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " "
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local lspconfig = require("lspconfig")
		local map = vim.keymap.set
		local on_attach = function(_, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- https://github.com/neovim/nvim-lspconfig
			map('n', 'gD', vim.lsp.buf.declaration, bufopts)
			map('n', 'gd', vim.lsp.buf.definition, bufopts)
			map('n', 'K', vim.lsp.buf.hover, bufopts)
			map('n', 'gi', vim.lsp.buf.implementation, bufopts)
			map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
			map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
			map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
			map('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
			map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
		end

		-- Add additional capabilities supported by nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Lua
		lspconfig.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}

		-- Go
		local util = require "lspconfig/util"
		lspconfig.gopls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		}

		local config = {
			-- disable virtual text
			virtual_text = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
			width = 90,
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
			width = 90,
		})
	end
}
