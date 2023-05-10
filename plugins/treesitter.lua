local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("Treesitter didn't load!")
	return
end

treesitter.setup({
	ensure_installed = { "rust", "python", "c", "lua", "vim", "vimdoc", "query" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
})
