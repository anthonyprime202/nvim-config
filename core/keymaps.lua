local opts = { noremap = true, silent = true }
local map = vim.keymap

-- Setting Leader Key
vim.g.mapleader = " "

-- General Keymaps
map.set("i", "jk", "<ESC>", opts)
map.set("n", "<leader>nh", ":nohl<CR>", opts)

-- Saving
map.set("n", "<C-s>", ":w<CR>", opts)
map.set("i", "<C-s>", "<cmd>w<CR>", opts)

-- Telecope
local telescope_ok, builtin = pcall(require, "telescope.builtin")
if not telescope_ok then
	print("Telescope builtin didn't load")
	return
end

map.set("n", "<leader>ff", builtin.find_files, opts)
map.set("n", "<leader>fg", builtin.live_grep, opts)
map.set("n", "<leader>fb", builtin.buffers, opts)
map.set("n", "<leader>fh", builtin.help_tags, opts)

-- Nvim Tree
map.set("n", "n", ":NvimTreeFindFileToggle<CR>", opts)

-- Lazy Git
map.set("n", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
map.set("i", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
