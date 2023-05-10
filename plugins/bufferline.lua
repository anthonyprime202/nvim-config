local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print("Bufferline didn't load!")
	return
end

bufferline.setup({
	options = {
		themable = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		indicator = {
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				seperator = true,
			},
		},
		always_show_bufferline = false,
	},
})
