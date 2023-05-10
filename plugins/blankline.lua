local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
	print("Indent Blankline didn't load!")
	return
end

blankline.setup({
	show_current_context = true,
})
