local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Telescope didn't load!")
	return
end

telescope.setup({})
