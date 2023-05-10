local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("Mason Null-Ls didn't load!")
	return
end

local nul_ls_status, null_ls = pcall(require, "null-ls")
if not nul_ls_status then
	print("Null-Ls didn't load!")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
mason_null_ls.setup({
	ensure_installed = {
		"stylua",
		"black",
		"rustfmt",
		"flake8",
	},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.rustfmt,
		formatting.black,
		diagnostics.flake8,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr }) 
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
