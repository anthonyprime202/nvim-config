local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("Lualine didn't load!")
	return
end

lualine.setup({
	options = { theme = "catppuccin" },
})
