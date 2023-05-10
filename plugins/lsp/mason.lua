local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("Mason Lspconfig didn't load!")
	return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	print("Lspconfig didn't load!")
	return
end

local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("Mason didn't load!")
	return
end

mason.setup()

-- Lsp Servers
local lsp_servers = {
	"rust_analyzer",
	"lua_ls",
	"pyright",
}

-- Installing the servers
mason_lspconfig.setup({
	ensure_installed = lsp_servers,
})

-- Setting up server settings
local opts = {}
for _, server in pairs(lsp_servers) do
	-- Setting server options
	opts = {
		on_attach = require("setup.plugins.lsp.handler").on_attach,
		capabilities = require("setup.plugins.lsp.handler").capabilities,
	}

	-- Getting server name
	server = vim.split(server, "@")[1]

	-- Getting server setting from the settings folder
	local require_ok, conf_opts = pcall(require, "setup.plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	-- Setting up
	lspconfig[server].setup(opts)
end
