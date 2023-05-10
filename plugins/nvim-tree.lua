local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("Nvim Tree didn't load!")
	return
end

-- Disabling Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup
nvim_tree.setup({
	diagnostics = {
		enable = true,
		icons = {
			info = "",
			hint = "",
			error = "",
			warning = "",
		},
	},
	renderer = {
		add_trailing = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
	},
	modified = {
		enable = true,
		show_on_open_dirs = false,
	},
})
