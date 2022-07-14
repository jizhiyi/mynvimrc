local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	return
end

-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	sumneko_lua = require("lsp.config.lua"),
	clangd = require("lsp.config.clangd"),
    gopls = require("lsp.config.gopls"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
    end
end
