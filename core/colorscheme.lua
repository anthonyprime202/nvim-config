local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	print("Catppuccin didn't load!")
	return
end

-- catppuccin.setup({
-- 	flavour = "mocha",
-- 	termcolors = false,
-- 	show_end_of_buffer = false,
-- })

vim.cmd([[ colorscheme catppuccin-mocha ]])
