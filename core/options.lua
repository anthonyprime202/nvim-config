local opt = vim.opt

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line Wraping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Backspace Configuration
opt.backspace = "indent,eol,start"

-- Clipboard Configuration
opt.clipboard:append("unnamedplus")

-- Splits
opt.splitright = true
opt.splitbelow = true

-- For Code Completion
opt.completeopt = { "noselect", "menuone", "noinsert", "preview" }
opt.shortmess:append("c")

-- For Bufferline
opt.mousemoveevent = true
